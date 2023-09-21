--박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름을 출력

--박지성이 구매한 도서의 출판사이름을 출력
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid= bs.bookid
and name like '박지성';

--
select name from
customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like'박지성'
and publisher in(
    select publisher from customer cs, orders os, book bs
    where cs.custid = os.custid and os.bookid = bs.bookid
    and name like'박지성'
);

-- 두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름을 출력하시오
select name from customer cm
where (select count(distinct publisher) from customer c, orders o,book b
where c.custid = o.custid and o.bookid = b.bookid
and name like cm.name)>=2;

--전체고객의 30% 이상 구매한 도서 출력
select bookname from book bm
where(select count(b.bookid) from book b, orders o
        where b.bookid = o.bookid and b.bookid =bm.bookid)
        >= (select count(*) from customer)*0.3;
        
--새로운도서(스포츠 세계,대한미디어,10000원)이 입고되었다.
--데이터행 추가
--삽입되지않는다면 부족한 데이터 확인
insert into book values(11,'스포츠 세계','대한미디어',10000);

--데이원 출판사에서 출판한 도서를 삭제
delete from book
where publisher like '데이원';

select * from book;

--해냄 출판사에서 출판한 도서 삭제
--만약 삭제되지 않는다면 오류메세지 확인
delete from book
where publisher like '해냄';
--무결성 제약조건이 위배, 자식레코드 발견-orders 테이블에서. 
--따라서 해냄 출판사 도서정보는 삭제할 수 없다

--출판사'대한미디어'를  '대한출판사'로 이름을 변경
update book set publisher = '대한출판사'
where publisher like '대한미디어';

