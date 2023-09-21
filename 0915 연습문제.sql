--�������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸��� ���

--�������� ������ ������ ���ǻ��̸��� ���
select publisher from customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid= bs.bookid
and name like '������';

--
select name from
customer cs, orders os, book bs
where cs.custid = os.custid and os.bookid = bs.bookid
and name not like'������'
and publisher in(
    select publisher from customer cs, orders os, book bs
    where cs.custid = os.custid and os.bookid = bs.bookid
    and name like'������'
);

-- �ΰ� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸��� ����Ͻÿ�
select name from customer cm
where (select count(distinct publisher) from customer c, orders o,book b
where c.custid = o.custid and o.bookid = b.bookid
and name like cm.name)>=2;

--��ü���� 30% �̻� ������ ���� ���
select bookname from book bm
where(select count(b.bookid) from book b, orders o
        where b.bookid = o.bookid and b.bookid =bm.bookid)
        >= (select count(*) from customer)*0.3;
        
--���ο��(������ ����,���ѹ̵��,10000��)�� �԰�Ǿ���.
--�������� �߰�
--���Ե����ʴ´ٸ� ������ ������ Ȯ��
insert into book values(11,'������ ����','���ѹ̵��',10000);

--���̿� ���ǻ翡�� ������ ������ ����
delete from book
where publisher like '���̿�';

select * from book;

--�س� ���ǻ翡�� ������ ���� ����
--���� �������� �ʴ´ٸ� �����޼��� Ȯ��
delete from book
where publisher like '�س�';
--���Ἲ ���������� ����, �ڽķ��ڵ� �߰�-orders ���̺���. 
--���� �س� ���ǻ� ���������� ������ �� ����

--���ǻ�'���ѹ̵��'��  '�������ǻ�'�� �̸��� ����
update book set publisher = '�������ǻ�'
where publisher like '���ѹ̵��';

