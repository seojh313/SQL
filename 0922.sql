--고객의 이름과 전화번호를 출력하시오( 단, 전화번호가 없는 고객은 연락처없음 으로 출력)
select name 이름, phone 전화번호 from customer;
select name 이름, nvl(phone,'연락처없음') 전화번호 from customer;

--고객목록에서 연번,고개번호,이름 ,전화번호를 앞의 두명만 출력
select rownum 순번,custid,name,phone from customer;
select rownum 순번,custid,name,phone from customer
where rownum<= 2;








--mybook 테이블 생성
create table mybook(
    bookid number not null primary key,
    pirce number
);
-- 데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

select bookid,nvl(pirce,0) from mybook;










DROP TABLE mybook; -- 위 테이블 price를 pirce로 작성함

create table mybook(
    bookid number not null primary key,
    price number
);

insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

--마당서점에 대한 rownum 문제, 문제간 동일한점과 차이점 
--1
select * from book;

--2
select * from book
where rownum <=5;

--3
select * from book
where rownum <= 5
order by price;

--4  3번과의 차이는?
select * from (select * from book order by price)b
where rownum<= 5;

--5 3번과 같음
select * from (select * from book where rownum<=5) b 
order by price;

--6 몇번과 같나?
select * from (select * from book where rownum<=5 order by price) b;






-- 부속질의

--평균 판매금액 이하으 ㅣ주문에 대해 주문번화와 판매금액을 출력
select orderid 주문번호, saleprice 판매금액 from orders;

select avg(saleprice) from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice <= (select avg(saleprice) from orders);

--각 고객의 평균판매 금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금액을 출력
select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders;

select orderid 주문번호, custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid); 

-- 서울에 거주하는 고객에게 판매한 도서의 총 판매금액을 출력
select sum(saleprice) 총판매액 from orders;

--서울에 거주하는 사람의 고객번호
select custid from customer 
where address like'%서울%';

select sum(saleprice) 총판매액 from orders
where custid in (select custid from customer 
where address like '%서울%');
-- 거주하지않는 사람의 총 판매액
select sum(saleprice) 총판매액 from orders
where custid not in (select custid from customer 
where address like '%서울%');

--3번고객이 주문한 도서의 최고금액보다 더 비싼 도서를 구입한 주문의 주문번호와 
select orderid 주문번호, saleprice 판매금액 from orders;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice >all(select saleprice from orders where custid=3);

--서울에 거주한느 고객에게 판매한 도서의 총 판매액 ( 단, exist 연산자 사용가능)
select sum(saleprice) 총판매액 from orders mo
where exists(
    select * from customer c 
    where address like '%서울%' and mo.custid = c.custid
    );
    
--고객별 판매금액의 합게를 출력( 고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

--고객별 판매금액의 합게를 출력( 고객명, 판매합계)
select (select name from customer c
        where c.custid = o.custid) 고객명, sum(saleprice) 판매합계 from orders o 
group by o.custid;

--주문목록에 책이름을 저장할 수 있는 컬럼 추가
alter table orders add bookname varchar2(40);
-- 컬럼크기가 충분하지않아 변경
 ALTER TABLE orders MODIFY (bookname VARCHAR2(2000));

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

--고객번호가 2이하인 고객번호와 이름 추ㅜㄹ력
select custid 고객번호, name 이름 from customer
where custid<=2;

-- 고객번호가 2이하인 고객의 판매금액 출력( 고객이름과 고객별 판매액 출력)
select name 고객이름, sum(saleprice) 판매총액
from ( select custid, name from customer -- 인라인 뷰
where custid <=2) c , orders o
where c.custid = o.custid
group by name; 

select name 고객이름, sum(saleprice) 판매총액
from customer c, orders o
where c.custid=o.custid
group by name;





-- 부속질의 문제
--1 주어진 SQL 쿼리는 스칼라 서브쿼리를 사용하고 있습니다, 여기서는 SELECT 문에서 customer 테이블을 서브쿼리로 사용하고 있으며, 
--이 서브쿼리는 od.custid와 관련된 address 값을 반환합니다.
select custid,(select address from customer cs
                where cs.custid = od.custid) "address",
                sum(saleprice) "total"
from orders od
group by od.custid;
