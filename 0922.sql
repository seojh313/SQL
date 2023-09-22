--���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�( ��, ��ȭ��ȣ�� ���� ���� ����ó���� ���� ���)
select name �̸�, phone ��ȭ��ȣ from customer;
select name �̸�, nvl(phone,'����ó����') ��ȭ��ȣ from customer;

--����Ͽ��� ����,����ȣ,�̸� ,��ȭ��ȣ�� ���� �θ� ���
select rownum ����,custid,name,phone from customer;
select rownum ����,custid,name,phone from customer
where rownum<= 2;








--mybook ���̺� ����
create table mybook(
    bookid number not null primary key,
    pirce number
);
-- ������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

select bookid,nvl(pirce,0) from mybook;










DROP TABLE mybook; -- �� ���̺� price�� pirce�� �ۼ���

create table mybook(
    bookid number not null primary key,
    price number
);

insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

select * from mybook;

--���缭���� ���� rownum ����, ������ ���������� ������ 
--1
select * from book;

--2
select * from book
where rownum <=5;

--3
select * from book
where rownum <= 5
order by price;

--4  3������ ���̴�?
select * from (select * from book order by price)b
where rownum<= 5;

--5 3���� ����
select * from (select * from book where rownum<=5) b 
order by price;

--6 ����� ����?
select * from (select * from book where rownum<=5 order by price) b;






-- �μ�����

--��� �Ǹűݾ� ������ ���ֹ��� ���� �ֹ���ȭ�� �Ǹűݾ��� ���
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select avg(saleprice) from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice <= (select avg(saleprice) from orders);

--�� ���� ����Ǹ� �ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݾ��� ���
select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid); 

-- ���￡ �����ϴ� ������ �Ǹ��� ������ �� �Ǹűݾ��� ���
select sum(saleprice) ���Ǹž� from orders;

--���￡ �����ϴ� ����� ����ȣ
select custid from customer 
where address like'%����%';

select sum(saleprice) ���Ǹž� from orders
where custid in (select custid from customer 
where address like '%����%');
-- ���������ʴ� ����� �� �Ǹž�
select sum(saleprice) ���Ǹž� from orders
where custid not in (select custid from customer 
where address like '%����%');

--3������ �ֹ��� ������ �ְ�ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� 
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice >all(select saleprice from orders where custid=3);

--���￡ �����Ѵ� ������ �Ǹ��� ������ �� �Ǹž� ( ��, exist ������ ��밡��)
select sum(saleprice) ���Ǹž� from orders mo
where exists(
    select * from customer c 
    where address like '%����%' and mo.custid = c.custid
    );
    
--���� �Ǹűݾ��� �հԸ� ���( ����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

--���� �Ǹűݾ��� �հԸ� ���( ����, �Ǹ��հ�)
select (select name from customer c
        where c.custid = o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o 
group by o.custid;

--�ֹ���Ͽ� å�̸��� ������ �� �ִ� �÷� �߰�
alter table orders add bookname varchar2(40);
-- �÷�ũ�Ⱑ ��������ʾ� ����
 ALTER TABLE orders MODIFY (bookname VARCHAR2(2000));

update orders o set bookname = (select bookname from book b where b.bookid=o.bookid);

--����ȣ�� 2������ ����ȣ�� �̸� �ߤ̤���
select custid ����ȣ, name �̸� from customer
where custid<=2;

-- ����ȣ�� 2������ ���� �Ǹűݾ� ���( ���̸��� ���� �Ǹž� ���)
select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from ( select custid, name from customer -- �ζ��� ��
where custid <=2) c , orders o
where c.custid = o.custid
group by name; 

select name ���̸�, sum(saleprice) �Ǹ��Ѿ�
from customer c, orders o
where c.custid=o.custid
group by name;





-- �μ����� ����
--1 �־��� SQL ������ ��Į�� ���������� ����ϰ� �ֽ��ϴ�, ���⼭�� SELECT ������ customer ���̺��� ���������� ����ϰ� ������, 
--�� ���������� od.custid�� ���õ� address ���� ��ȯ�մϴ�.
select custid,(select address from customer cs
                where cs.custid = od.custid) "address",
                sum(saleprice) "total"
from orders od
group by od.custid;
