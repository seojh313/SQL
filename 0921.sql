--abs : 절댓값구하는 함수
select abs(-33) , abs(33) from dual;

--5.657을 소수 첫째자리까지 반올림한 값
select round(5.657,1) from dual;

--고객별 평균 주문금액을 백원단위 반올림 값

select custid "고객번호", round(avg(saleprice),-2) "평균금액" from orders
group by custid;

--도서명에 '과학'이 포함된 도서를 '수학'으로 변경하여 도서정보 출력
-- 실제 book 테이블 원본데이터 변경 X
select bookid, replace(bookname,'과학','수학') bookname, publisher,price from book;
select * from book;

--출판사가 '해냄'인 도서명의 글자 수와 바이트 수 출력
select bookname "도서명",length(bookname) 글자수,lengthb(bookname)"바이트수" from book
where publisher like '해냄';

--고객중 같은 성을 가진 사람이 몇명인지 성씨별 인원수 출력
select substr(name,1,1) "성씨", count(*) "인원수" from customer
group by substr(name,1,1);

--서점의 주문확정일은 주문일로부터 10일후이다. 주문번호,주문일,주문확정일 출력
select orderid 주문번호,orderdate 주문일, orderdate+ 10 주문확정일 from orders order by orderid;

--23년 8월 28일 주문받은 주문번호, 주문일 ,고객번호, 도서번호를 모두 출력하시오
--단 , 주문일은 yyyy년 mm dd 같은 format 으로 표시
select orderid 주문번호, orderdate 주문일, custid 고객번호, bookid 도서번호
from orders
where orderdate = to_date('20230828','yyyymmdd');

select orderid 주문번호,to_char(orderdate, 'yyyy-mm-dd')주문일, custid 고개번호,bookid 도서번호
from orders
where orderdate = to_date('20230828','yyyymmdd');

--23년 8월 28일 주문받은 주문번호, 주문일 ,고객명, 도서명을 모두 출력하시오
--단 , 주문일은 yyyy년 mm dd 같은 format 으로 표시
select orderid 주문번호,to_char(orderdate, 'yyyy-mm-dd')주문일, name 고객명,bookname 도서명
from orders o,customer c, book b
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date('20230828','yyyymmdd');

-- db 서버의 설정된 날짜와 시간 요일을 출력
-- 실제 반환된 날짜와 형식을 지정한(년도4자리/월2자리/일2자리 간략한 요일, 시:분:초) 날짜와 시간 2가지 모두 출력
select sysdate 원래반환된값, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') 지정형식날짜및시간 from dual;
