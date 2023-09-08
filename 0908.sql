--집합연산자  : 합집합(union) 차집합(minus) 교집합(intersect)
--차집합 연산자 사용
--도서를 주문하지않은 고객의 이름을 쓰시오

select name from customer;

select distinct custid from orders;

--차집합 연산자 사용
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);
--집합 연산자 미사용
select name from customer 
where custid not in(select distinct custid from orders);

--exists: 서브쿼리의 결과가 존재하는 경우에 true
--주문이 있는 고객의 이름과 주소 출력

--in 연산자 사용
select name, address from customer
where custid in(select distinct custid from orders);
--동등조인과 중복행 제거
select distinct name,address from customer c,orders o 
where c.custid = o.custid;
--exists 사용
select name,address from customer c
where exists(select * from orders o 
            where c.custid = o.custid);

--1.마당서점의 고객이 요구한느 다음 질문에 대해 sql 문을 작성하시오
--5)박지성이 구매한 도서의 출판사 수
SELECT COUNT(DISTINCT publisher)
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE name = '박지성';

--6)박지성이 구매한 도서의 이름,가격,정가와 판매가격의 차이
SELECT bookname,
       price,
       saleprice
       ,price - saleprice
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE name = '박지성';

--7)박지성이 구매하지않은 도서의 이름
SELECT bookname
FROM book
MINUS
SELECT B.bookname
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE C.name = '박지성';

--2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 sql문 작성
--8) 주문하지 않은 고객의 이름 ( 부속질의 사용)
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT DISTINCT custid
    FROM orders );
--9) 주문금액의 총액과 주문의 평균 금액
select sum(saleprice) from orders;
select avg(saleprice) from orders;
--10) 고객의 이름과 고객별 구매액
SELECT C.name, SUM(saleprice)
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
GROUP BY C.name;
--11) 고객의 이름과 고객이 구매한 도서목록
SELECT name, bookname
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
GROUP BY name
order by name;

--12) 도서의 가격(book 테이블)과 판매가격(orders 테이블)의 차이가 가장 많은 주문
select * from book b,orders o
where b.bookid = o.bookid
and price-saleprice=(select max(price-saleprice)
                                from book sb,orders so
                                where sb.bookid = so.bookid);
--13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
SELECT name
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN (
    SELECT AVG(B.saleprice) AS avg_saleprice
    FROM book B
) AS avg_sales ON 1=1
GROUP BY C.customer_name
HAVING AVG(O.quantity * B.saleprice) > avg_sales.avg_saleprice;


--ddl (data defination language) : 데이터 정의어
--create table/alter table/drop table
--테이블 생성 연습1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
--테이블 생성 연습2
--primary key 설정방법 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number ,
    primary key(bookid)
);
    
    --primary key 설정방법 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number 
);

--bookname 컬럼 : null값을 가질 수 없다
--publisher 컬럼 : 동일값 가질 수 없다
--price 컬럼 : 가격이 입력되어 있지 않으면 기본값을 10000, 입력될때는 1000초과로 입력되게 한다.
--bookname,publisher 컬럼을 복합키로 
create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price> 1000),
    primary key(bookname,publisher)
);