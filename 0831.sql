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
    
--book ���̺��� ������ 10000�� �̻� 15000�� ������ ������ �˻�
select * from book
    where price between 10000 and 15000;
    
--book ���̺��� ������ 10000�� �̻� 16000�̻��� ���� ������ �˻�, ��, between and�� ������� ���ÿ�
select * from book
    where price >=10000 and price <= 16000;
    
--book ���̺��� ���ǻ簡 ~~,~,~~�� ������ �˻�, ��, in ������ ���
select * from book
    where publisher in('��ũ�ν�','���̾𽺺Ͻ�');
    
-- '' in �����ڸ� ��������ʰ� �񱳿����ڿ� or �����ڸ� ���
select * from book
    where publisher = '��ũ�ν�' or publisher = '���̾𽺺Ͻ�';
    
--���ǻ簡 ��ũ�ν�, ���̾𽺺Ͻ��� �ƴ� ������  book ���̺��� , ��, not in ������ ���
select * from book
    where publisher not in ('��ũ�ν�','���̾𽺺Ͻ�');

-- ''�� not in �� ������� �ʰ� 
select * from book
    where publisher <> '�½�����' and publisher <>'��ũ�ν�';

-- book���̺��� �������� �౸�� ������ ���� �˻�
select * from book
    where bookname = '�౸�� ����';
select * from book
    where bookname like '�౸�� ����';
    
-- book ���̺��� �������� �౸��� ���ڿ��� ���Ե� ���� �˻�
select * from book
    where bookname like '%�౸%';
    
--book ���̺��� ������ �����̶�� ���ڿ��� ���Ե� ���� �˻��Ͻÿ�
select * from book
    where bookname like '%����%';
select * from book
    where bookname like '%����';
select * from book
    where bookname like '����%';
--book ���̺� ������ '��' �տ� ������ ���� ���ڰ� ���Ե� ���ڿ��� ���� ���� �˻�
select * from book
    where bookname like '______��%';