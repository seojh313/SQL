select * from book;
--book ���̺��� �����̶�� ���ڿ��� ����, ���������� 15000�̻��� ������ ��˻�
select * from book
    where bookname like '%����%' and price >=15000;
--book ���̺��� ���ǻ簡 �½����� �Ǵ� ��ũ�ν��� ���� �˻�
select * from book
    where publisher ='�½�����' or publisher='��ũ�ν�';
--���� in �����ڸ� ���
SELECT * FROM book
 WHERE publisher IN ('�½�����', '��ũ�ν�');

--book ���̺��� ������ �� �Է�
select * from book order by bookname;

--���� ��ȣ�� �˻�
select * from book order by bookid;

--book ���̺��� ���ݼ����� �˻�, ���� �����̸� �̸������� �˻�
select * from book order by price,bookname;

--book table, ���� �������� �˻�, ���� �����Ͻ� ���ǻ� ������ �˻�
select * from book order by price desc, publisher asc;
--orders ���̺��� ���� �ֹ��� ������ �� �Ǹž�
--�����Լ� sum ���
select sum(saleprice) as ���Ǹűݾ� from orders;

--order���̺��� ����ȣ�� 1�� ���� �ֹ��� ������ ���Ǹž��� ���Ͻÿ�
select sum(saleprice) as ���Ǹűݾ� from orders
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

--orders ���̺��� �Ǹž��� �԰�� ���, �ּ�,�ִ밪�� ���Ͻÿ�
select sum(saleprice) as  ���Ǳݾ�,
    avg(saleprice) as ����Ǹž�,
    min(saleprice) as ��������,
    max(saleprice) as �ִ밡��
from orders;
--orders ���̺��� �Ǹ��� ������ ������ ���Ͻÿ�
select sum(orderid) from orders; -- M
select count(*) from orders; -- T
--orders ���̺��� ���������� 13000�� �̻��� ������ ������ ���Ͻÿ�
--select saleprice>=13000 from orders; --M
select count(*) from orders where saleprice >= 13000;--T
--orders ���̺��� ����ȣ�� 1 �Ǵ� 3�� ���� �ֹ� ������ ���Ͻÿ� 
select count(*) from orders where custid in(1,3);

--orders ���̺��� ���� �ֹ��� ������ ������ ���հ踦 ���Ͻÿ�
--�׷�ȭ(�κ���) : group by
select count(*) �ֹ�����, sum(saleprice) �ֹ��Ѿ�
from orders
group by custid
order by custid;

--order ���̺��� �ǸŰ��� 8000�̻��� ������ ������ ���� ���� ���� �ֹ� ������ �� ����
--�� 2�� �̻� ������ ���� ���
select custid, count(*) as �������� from orders
where saleprice>=8000
group by custid
having count(*) >=2
order by custid; --group by �� having ���� ���� ���ǻ��� Ȯ��

--1�� ���� .���� ������ ���� �䱸�ϴ� ���� ������ ���� sql ���� �ۼ��Ͻÿ�. 195p
--1)������ȣ�� 1�� ������ �̸�
select * from book 
    where bookid =1;
--2) ������ 2���� �̻��� ������ �̸�
select * from book
    where price>=20000;
--3)�������� �� ���ž�(������ ���� ��ȣ�� 1������ ���� �ۼ�)
select sum(saleprice) as �ѱ��ž� from orders
    where custid=1;
--4)�������� ������ ������ �� (����ȣ 1)
select sum(orderid) from orders
    where custid=1;
    
--2�� ���� .���缭���� ��ڿ� �濵�ڰ� �䱸�ϴ� ���� ������ ���� SQL ���� �ۼ��Ͻÿ�
--1)���缭�� ������ �� ����
select count(*) from book;
--2)���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) from book;
--3)��� ���� �̸�, �ּ�
select name,address from customer;
--4) 2014 7/4~7/7 ���� �ֹ����� ������ �ֹ���ȣ
select orderid from orders
    where orderdate between '2020-07-04' and  '2020-07-07';
--5) '' �� ������ ������ �ֹ���ȣ
select orderid from orders
    where orderdate not between '2020-07-04' and  '2020-07-07';
--6)���� �� ���� ���� �̸��� �ּ�
select name,address from customer
    where name like '��%';
--7)���� �� ���̸� �̸��� �� �� ������ ���� �̸��� �ּ�
select name,address from customer
    where name like '��_��';