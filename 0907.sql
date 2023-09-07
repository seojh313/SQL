-- ���� ����(equl join)
-- �������� ���̺��� �����Ҷ� Ư�� �÷� ���� ���� ��鸸 �˻��� �� ���
select * from book;

select * from customer,orders;
--���� ���� �ֹ��� ���� �����͸� ��� ����Ͻÿ�
select  * from customer, orders
where customer.custid = orders.custid;

--���� ���� �ֹ��� ���� �����͸� ��� ����ȣ �������� ���
select * from customer,orders
where customer.custid = orders.custid
order by customer.custid desc;

--���� �̸�, �ֹ��� ���� �ǸŰ����� �˻��Ͻÿ�
select name,saleprice from customer c ,orders o 
where customer.custid = orders.custid;
--where c.custid = o.custid; 

-- ���̸����� �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ���̸��� ����
select name, sum(saleprice) from customer,orders
where customer.custid = orders.custid
group by name
order by name;

--���� �̸��� �ֹ��� ������ �̸��� ���Ͻÿ�
-- 3���� ���̺����� ��������
select name, bookname from customer c, book b ,orders o 
where c.custid = o.custid and o.bookid = b.bookid
order by name;

--���� ������ 16000�� ������ �ֹ��� ���̸��� �����̸����
select name,bookname from book b,customer c,orders r
where c.custid = o.custid and o.bookid = b.bookid and price =16000;

--�ܺ����� (outer join)
--���������� �ϰԵǸ� ���� �������� ���� ���� ����������
--�ܺ������� �ϰԵǸ� ������ �Ǵ� ���̺��� �������� ���� ������ �൵ �����ؼ� ��°���

--������ ���������ʤ��� ���� �����Ͽ� ���̸��� �ֹ��� ������ �ǸŰ����� ����Ͻÿ�
select name,saleprice
from customer c left outer join orders o 
                    on c.custid = o.custid;
                    
--sub query �μ�����
--main query ���� query 

--���������� ���� ��� ����
select max(price) from book;
--�����̸�
select bookname from book;
--���������� ���� ��� �����̸��� ����Ͻÿ�
select bookname from book
where price = (select max(price) from book);

--���������� ���� �� ������ �̸��� ���� ���
select bookname,price from book
where price = (select min(price) from book);

--������ ������ ����� �ִ� ���� �̸� �˻�
select name from customer
where custid in (select distinct custid from orders);
--sub query : �ֹ��� �� �ִ� ����ȣ��
select distinct custid from orders;

--���������Ͽ콺���� ������ ������ ������ ���� �̸� ���
select name from customer;
select bookid, bookname from book
where publisher ='�ٻ�Ͻ�';
-- ������ ������ ����� ����ȣ
select distinct custid from orders; -- subquery�� �Ʒ� in�� ��ȣ�� 

select name from customer
where custid in(select custid from orders
                where bookid in(select bookid from book
                                where publisher = '�ٻ�Ͻ�')) --join �Ǵ� subquery ��� ����
