--���տ�����  : ������(union) ������(minus) ������(intersect)
--������ ������ ���
--������ �ֹ��������� ���� �̸��� ���ÿ�

select name from customer;

select distinct custid from orders;

--������ ������ ���
select name from customer
minus
select name from customer
where custid in(select distinct custid from orders);
--���� ������ �̻��
select name from customer 
where custid not in(select distinct custid from orders);

--exists: ���������� ����� �����ϴ� ��쿡 true
--�ֹ��� �ִ� ���� �̸��� �ּ� ���

--in ������ ���
select name, address from customer
where custid in(select distinct custid from orders);
--�������ΰ� �ߺ��� ����
select distinct name,address from customer c,orders o 
where c.custid = o.custid;
--exists ���
select name,address from customer c
where exists(select * from orders o 
            where c.custid = o.custid);

--1.���缭���� ���� �䱸�Ѵ� ���� ������ ���� sql ���� �ۼ��Ͻÿ�
--5)�������� ������ ������ ���ǻ� ��
SELECT COUNT(DISTINCT publisher)
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE name = '������';

--6)�������� ������ ������ �̸�,����,������ �ǸŰ����� ����
SELECT bookname,
       price,
       saleprice
       ,price - saleprice
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE name = '������';

--7)�������� ������������ ������ �̸�
SELECT bookname
FROM book
MINUS
SELECT B.bookname
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
WHERE C.name = '������';

--2. ���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� sql�� �ۼ�
--8) �ֹ����� ���� ���� �̸� ( �μ����� ���)
SELECT name
FROM customer
WHERE custid NOT IN (
    SELECT DISTINCT custid
    FROM orders );
--9) �ֹ��ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) from orders;
select avg(saleprice) from orders;
--10) ���� �̸��� ���� ���ž�
SELECT C.name, SUM(saleprice)
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
GROUP BY C.name;
--11) ���� �̸��� ���� ������ �������
SELECT name, bookname
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN book B ON O.bookid = B.bookid
GROUP BY name
order by name;

--12) ������ ����(book ���̺�)�� �ǸŰ���(orders ���̺�)�� ���̰� ���� ���� �ֹ�
select * from book b,orders o
where b.bookid = o.bookid
and price-saleprice=(select max(price-saleprice)
                                from book sb,orders so
                                where sb.bookid = so.bookid);
--13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
SELECT name
FROM customer C
JOIN orders O ON C.custid = O.custid
JOIN (
    SELECT AVG(B.saleprice) AS avg_saleprice
    FROM book B
) AS avg_sales ON 1=1
GROUP BY C.customer_name
HAVING AVG(O.quantity * B.saleprice) > avg_sales.avg_saleprice;


--ddl (data defination language) : ������ ���Ǿ�
--create table/alter table/drop table
--���̺� ���� ����1
create table newbook1(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
--���̺� ���� ����2
--primary key ������� 1
create table newbook2(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number ,
    primary key(bookid)
);
    
    --primary key ������� 2
create table newbook3(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number 
);

--bookname �÷� : null���� ���� �� ����
--publisher �÷� : ���ϰ� ���� �� ����
--price �÷� : ������ �ԷµǾ� ���� ������ �⺻���� 10000, �Էµɶ��� 1000�ʰ��� �Էµǰ� �Ѵ�.
--bookname,publisher �÷��� ����Ű�� 
create table newbook4(
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price> 1000),
    primary key(bookname,publisher)
);