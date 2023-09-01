select * from book;
--book 테이블에서 과학이라는 문자열을 포함, 도서가격이 15000이상인 데이터 행검색
select * from book
    where bookname like '%과학%' and price >=15000;
--book 테이블에서 출판사가 굿스포츠 또는 어크로스인 도서 검색
select * from book
    where publisher ='굿스포츠' or publisher='어크로스';
--위를 in 연산자를 사용
SELECT * FROM book
 WHERE publisher IN ('굿스포츠', '어크로스');

--book 테이블에서 도서명 순 입력
select * from book order by bookname;

--도서 번호순 검색
select * from book order by bookid;

--book 테이블에서 가격순으로 검색, 같은 가격이면 이름순으로 검색
select * from book order by price,bookname;

--book table, 가격 내림차순 검색, 같은 가격일시 출판사 순으로 검색
select * from book order by price desc, publisher asc;
--orders 테이블에서 고객이 주문한 도서의 총 판매액
--집계함수 sum 사용
select sum(saleprice) as 총판매금액 from orders;

--order테이블에서 고객번호가 1인 고객이 주문한 도서의 총판매액을 구하시오
select sum(saleprice) as 총판매금액 from orders
                                    where custid=1;
                                    
INSERT INTO Orders VALUES (2, 1, 3, 21000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, TO_DATE('2020-07-03','yyyy-mm-dd'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, TO_DATE('2020-07-04','yyyy-mm-dd'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, TO_DATE('2020-07-05','yyyy-mm-dd'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, TO_DATE('2020-07-07','yyyy-mm-dd'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, TO_DATE('2020-07-08','yyyy-mm-dd'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, TO_DATE('2020-07-09','yyyy-mm-dd'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, TO_DATE('2020-07-10','yyyy-mm-dd'));

--orders 테이블에서 판매액의 함계ㅡ 평균, 최소,최대값을 구하시오
select sum(saleprice) as  총판금액,
    avg(saleprice) as 평균판매액,
    min(saleprice) as 최저가격,
    max(saleprice) as 최대가격
from orders;
--orders 테이블에서 판매한 도서의 개수를 구하시오
select sum(orderid) from orders; -- M
select count(*) from orders; -- T
--orders 테이블에서 도서가격이 13000원 이상인 도서의 개수를 구하시오
--select saleprice>=13000 from orders; --M
select count(*) from orders where saleprice >= 13000;--T
--orders 테이블에서 고객번호가 1 또는 3인 고객의 주문 개수를 구하시오 
select count(*) from orders where custid in(1,3);

--orders 테이블에서 고객별 주문한 도서의 개수와 총합계를 구하시오
--그룹화(부분합) : group by
select count(*) 주문수량, sum(saleprice) 주문총액
from orders
group by custid
order by custid;

--order 테이블에서 판매가가 8000이상인 도서를 구매한 고객에 대해 고객별 주문 도서의 총 수량
--단 2권 이상 구매한 고객만 출력
select custid, count(*) as 도서수량 from orders
where saleprice>=8000
group by custid
having count(*) >=2
order by custid; --group by 와 having 절의 문법 주의사항 확인

--1번 문제 .마당 서점의 고객이 요구하는 다음 질문에 대해 sql 문을 작성하시오. 195p
--1)도서번호가 1인 도서의 이름
select * from book 
    where bookid =1;
--2) 가격이 2만원 이상인 도서의 이름
select * from book
    where price>=20000;
--3)박지성의 총 구매액(박지성 고객의 번호는 1번으로 놓고 작성)
select sum(saleprice) as 총구매액 from orders
    where custid=1;
--4)박지성이 구매한 도서의 수 (고객번호 1)
select sum(orderid) from orders
    where custid=1;
    
--2번 문제 .마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오
--1)마당서점 도서의 총 개수
select count(*) from book;
--2)마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) from book;
--3)모든 고객의 이름, 주소
select name,address from customer;
--4) 2014 7/4~7/7 사이 주문받은 도서의 주문번호
select orderid from orders
    where orderdate between '2020-07-04' and  '2020-07-07';
--5) '' 를 제외한 도서의 주문번호
select orderid from orders
    where orderdate not between '2020-07-04' and  '2020-07-07';
--6)성이 김 씨인 고객의 이름과 주소
select name,address from customer
    where name like '김%';
--7)성이 김 씨이며 이름이 아 로 끝나는 고객의 이름과 주소
select name,address from customer
    where name like '김_아';