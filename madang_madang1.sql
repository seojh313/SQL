select phone
from Customer
where name='�迬��';

select * from book;

select * from customer;


--book ���̺��� ������� ������ �˻��Ͻÿ� 
select bookname, price from book;
--book ���̺��� ���ݰ� �������� �˻��Ͻÿ�. �������
select price, bookname from book;
--book ���̺��� ������ȣ,������,���ǻ�,������ �˻��Ͻÿ�. ��� �÷��̹Ƿ� all from  ���
select bookid, bookname, publisher, price from book;
select * from book;

--book ���̺��� ��� ���ǻ縦 �˻�
select publisher from book;

--book ���̺��� ��� ���ǻ縦 �˻�, ��, �ߺ��Ǵ� ���ǻ�� ����
select distinct publisher from book;

--book ���̺��� ������ n�� �̸�/������ ������ �˻��Ͻÿ�
select * from book 
    where price <=12000;