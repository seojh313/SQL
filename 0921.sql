--abs : ���񰪱��ϴ� �Լ�
select abs(-33) , abs(33) from dual;

--5.657�� �Ҽ� ù°�ڸ����� �ݿø��� ��
select round(5.657,1) from dual;

--���� ��� �ֹ��ݾ��� ������� �ݿø� ��

select custid "����ȣ", round(avg(saleprice),-2) "��ձݾ�" from orders
group by custid;

--������ '����'�� ���Ե� ������ '����'���� �����Ͽ� �������� ���
-- ���� book ���̺� ���������� ���� X
select bookid, replace(bookname,'����','����') bookname, publisher,price from book;
select * from book;

--���ǻ簡 '�س�'�� �������� ���� ���� ����Ʈ �� ���
select bookname "������",length(bookname) ���ڼ�,lengthb(bookname)"����Ʈ��" from book
where publisher like '�س�';

--���� ���� ���� ���� ����� ������� ������ �ο��� ���
select substr(name,1,1) "����", count(*) "�ο���" from customer
group by substr(name,1,1);

--������ �ֹ�Ȯ������ �ֹ��Ϸκ��� 10�����̴�. �ֹ���ȣ,�ֹ���,�ֹ�Ȯ���� ���
select orderid �ֹ���ȣ,orderdate �ֹ���, orderdate+ 10 �ֹ�Ȯ���� from orders order by orderid;

--23�� 8�� 28�� �ֹ����� �ֹ���ȣ, �ֹ��� ,����ȣ, ������ȣ�� ��� ����Ͻÿ�
--�� , �ֹ����� yyyy�� mm dd ���� format ���� ǥ��
select orderid �ֹ���ȣ, orderdate �ֹ���, custid ����ȣ, bookid ������ȣ
from orders
where orderdate = to_date('20230828','yyyymmdd');

select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy-mm-dd')�ֹ���, custid ����ȣ,bookid ������ȣ
from orders
where orderdate = to_date('20230828','yyyymmdd');

--23�� 8�� 28�� �ֹ����� �ֹ���ȣ, �ֹ��� ,����, �������� ��� ����Ͻÿ�
--�� , �ֹ����� yyyy�� mm dd ���� format ���� ǥ��
select orderid �ֹ���ȣ,to_char(orderdate, 'yyyy-mm-dd')�ֹ���, name ����,bookname ������
from orders o,customer c, book b
where c.custid = o.custid and b.bookid = o.bookid
and orderdate = to_date('20230828','yyyymmdd');

-- db ������ ������ ��¥�� �ð� ������ ���
-- ���� ��ȯ�� ��¥�� ������ ������(�⵵4�ڸ�/��2�ڸ�/��2�ڸ� ������ ����, ��:��:��) ��¥�� �ð� 2���� ��� ���
select sysdate ������ȯ�Ȱ�, to_char(sysdate, 'yyyy/mm/dd dy hh24:mi:ss') �������ĳ�¥�׽ð� from dual;
