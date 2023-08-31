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
    
--book 테이블에서 가격이 10000원 이상 15000원 이하인 도서를 검색
select * from book
    where price between 10000 and 15000;
    
--book 테이블에서 가격이 10000원 이상 16000이상인 이하 도서를 검색, 단, between and를 사용하지 마시오
select * from book
    where price >=10000 and price <= 16000;
    
--book 테이블에서 출판사가 ~~,~,~~인 도서를 검색, 단, in 연산자 사용
select * from book
    where publisher in('어크로스','사이언스북스');
    
-- '' in 연산자를 사용하지않고 비교연산자와 or 연산자를 사용
select * from book
    where publisher = '어크로스' or publisher = '사이언스북스';
    
--출판사가 어크로스, 사이언스북스가 아닌 도서를  book 테이블에서 , 단, not in 연산자 사용
select * from book
    where publisher not in ('어크로스','사이언스북스');

-- ''를 not in 을 사용하지 않고 
select * from book
    where publisher <> '굿스포츠' and publisher <>'어크로스';

-- book테이블에서 도서명이 축구의 역사인 행을 검색
select * from book
    where bookname = '축구의 역사';
select * from book
    where bookname like '축구의 역사';
    
-- book 테이블에서 도서명이 축구라는 문자열이 포함된 행을 검색
select * from book
    where bookname like '%축구%';
    
--book 테이블에서 도서명에 과학이라는 문자열이 포함된 행을 검색하시오
select * from book
    where bookname like '%과학%';
select * from book
    where bookname like '%과학';
select * from book
    where bookname like '과학%';
--book 테이블 도서명에 '의' 앞에 임의의 여섯 글자가 포함된 문자열을 갖는 행을 검색
select * from book
    where bookname like '______의%';