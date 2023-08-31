select phone
from Customer
where name='김연아';

select * from book;

select * from customer;


--book 테이블에서 도서명과 가격을 검색하시오 
select bookname, price from book;
--book 테이블에서 가격과 도서명을 검색하시오. 문제라면
select price, bookname from book;
--book 테이블에서 도서번호,도서명,출판사,가격을 검색하시오. 모든 컬럼이므로 all from  사용
select bookid, bookname, publisher, price from book;
select * from book;

--book 테이블에서 모든 출판사를 검색
select publisher from book;

--book 테이블에서 모든 출판사를 검색, 단, 중복되는 출판사는 제거
select distinct publisher from book;

--book 테이블에서 가격이 n원 미만/이하인 도서를 검색하시오
select * from book 
    where price <=12000;