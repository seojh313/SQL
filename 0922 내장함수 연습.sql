-- abs �Լ��� ������ ��ȯ�մϴ�. -15�� ������ 15�Դϴ�.
select abs(-15) from dual;

-- ceil �Լ��� �־��� ���ڸ� �ø��մϴ�. 15.7�� �ø��ϸ� 16�� �˴ϴ�.
select ceil(15.7) from dual;

-- cos �Լ��� �־��� ������ �ڻ��� ���� ��ȯ�մϴ�. ���⼭�� ������(��)�� �ڻ��� ���� ��ȯ�մϴ�.
select cos(3.141592) from dual;

-- floor �Լ��� �־��� ���ڸ� �����մϴ�. 15.7�� �����ϸ� 15�� �˴ϴ�.
select floor(15.7) from dual;

-- log �Լ��� �־��� ���ڸ� �־��� ��(base)���� �α׸� ���� ���� ��ȯ�մϴ�. ���⼭�� 100�� 10�� ������ �α׸� ���� ���� ��ȯ�մϴ�.
select log(10,100) from dual;

-- mod �Լ��� �������� ��ȯ�մϴ�. 11�� 4�� ���� �������� 3�Դϴ�.
select mod(11,4) from dual;

-- power �Լ��� �־��� ���ڸ� �־��� ������ ������ ���� ��ȯ�մϴ�. 3^2�� 9�Դϴ�.
select power(3,2) from dual;

-- round �Լ��� �־��� ���ڸ� �ݿø��մϴ�. 15.7�� �ݿø��ϸ� 16�� �˴ϴ�.
select round(15.7) from dual;

-- sign �Լ��� ������ ��ȣ�� ��ȯ�մϴ�. -15�� ��ȣ�� ����(-1)�Դϴ�.
select sign(-15) from dual;

-- trunc �Լ��� �־��� ���ڸ� ����(�Ҽ� �κ��� ����)�մϴ�. 15.7�� �����ϸ� 15�� �˴ϴ�.
select trunc(15.7) from dual;

-- chr �Լ��� ASCII �ڵ带 ������� ���ڸ� ��ȯ�մϴ�. ASCII �ڵ� 67�� �빮�� 'C'�Դϴ�.
select chr(67) from dual;

-- concat �Լ��� ���ڿ��� �����մϴ�. 'HAPPY'�� 'Birthday'�� �����ϸ� 'HAPPYBirthday'�� �˴ϴ�.
select concat('HAPPY','Birthday') from dual;

-- lower �Լ��� ���ڿ��� ��� �ҹ��ڷ� ��ȯ�մϴ�. 'Birthday'�� �ҹ��ڷ� ��ȯ�ϸ� 'birthday'�� �˴ϴ�.
select lower('Birthday') from dual;

-- lpad �Լ��� ���ڿ��� �־��� ���̸�ŭ ���ʿ� Ư�� ���ڷ� ä��ϴ�. 'Page 1'�� ���� 15�� ����� ���ʿ� '" '�� �߰��մϴ�.
select lpad('Page 1', 15, '" ') from dual;

-- ltrim �Լ��� ���ڿ��� ���ʿ��� �־��� ���ڸ� �����մϴ�. 'Page 1'���� 'a'�� 'e'�� �����ϸ� 'P g 1'�� �˴ϴ�.
select ltrim('Page 1', 'ae') from dual;

-- replace �Լ��� ���ڿ����� Ư�� ���ڳ� ���ڿ��� �ٸ� ���ڳ� ���ڿ��� ��ü�մϴ�. 'JACK'���� 'J'�� 'BL'�� ��ü�ϸ� 'BLACK'�� �˴ϴ�.
select replace('JACK', 'J', 'BL') from dual;

-- rpad �Լ��� ���ڿ��� �־��� ���̸�ŭ �����ʿ� Ư�� ���ڷ� ä��ϴ�. 'Page 1'�� ���� 15�� ����� �����ʿ� '" '�� �߰��մϴ�.
select rpad('Page 1', 15, '" ') from dual;

-- rtrim �Լ��� ���ڿ��� �����ʿ��� �־��� ���ڸ� �����մϴ�. 'Page 1'���� 'a'�� 'e'�� �����ϸ� 'Pag 1'�� �˴ϴ�.
select rtrim('Page 1', 'ae') from dual;

-- substr �Լ��� ���ڿ����� Ư�� ��ġ���� �־��� ���̸�ŭ�� �κ� ���ڿ��� �����մϴ�. 'ABCDEFG'���� 3��° ��ġ���� ���� 4�� �κ� ���ڿ��� �����ϸ� 'CDEF'�� �˴ϴ�.
select substr('ABCDEFG', 3, 4) from dual;

-- trim �Լ��� ���ڿ��� �� ������ �־��� ���ڸ� �����մϴ�. '00AA00'���� ������ '0'�� �����ϸ� 'AA00'�� �˴ϴ�.
select trim(LEADING '0' FROM '00AA00') from dual;

-- upper �Լ��� ���ڿ��� ��� �빮�ڷ� ��ȯ�մϴ�. 'birthday'�� �빮�ڷ� ��ȯ�ϸ� 'BIRTHDAY'�� �˴ϴ�.
select upper('birthday') from dual;

-- ascii �Լ��� ������ ASCII �ڵ� ���� ��ȯ�մϴ�. 'A'�� ASCII �ڵ� ���� 65�Դϴ�.
select ascii('A') from dual;

-- instr �Լ��� ���ڿ����� Ư�� �κ� ���ڿ��� ��ġ�� ã���ϴ�. 'CORPORATE FLOOR'���� 'OR'�� 3��° ��ġ���� �� ��°�� ã���� 12�� �˴ϴ�.
select instr('CORPORATE FLOOR', 'OR', 3, 2) from dual;

-- length �Լ��� ���ڿ��� ���̸� ��ȯ�մϴ�. 'BIRTHDAY'�� ���̴� 8�Դϴ�.
select length('BIRTHDAY') from dual;

-- add_months �Լ��� ��¥�� ���� �߰��մϴ�. '14/05/21'�� 1������ �߰��ϸ� '14/06/21'�� �˴ϴ�.
select add_months('14/05/21', 1) from dual;

-- last_day �Լ��� �־��� ��¥�� �ش� ���� ������ ��¥�� ��ȯ�մϴ�. ���� ��¥�� �ش� �� ������ ��¥�� ��ȯ�մϴ�.
select last_day(sysdate) from dual;

-- next_day �Լ��� �־��� ��¥ ���ķ� ���� ����� Ư�� ������ ��¥�� ��ȯ�մϴ�. ���� ��¥�κ��� ���� ȭ������ ��¥�� ��ȯ�մϴ�.
select next_day(sysdate, 'ȭ') from dual;

-- round �Լ��� ��¥�� ���� ����� ������ �ݿø��մϴ�. ���� ��¥�� �ð��� �ݿø��� ���Դϴ�.
select round(sysdate) from dual;

-- sysdate �Լ��� ���� ��¥�� �ð��� ��ȯ�մϴ�.
select sysdate from dual;

-- to_char �Լ��� ��¥�� ���ڿ��� ��ȯ�մϴ�. ���� ��¥�� �ð��� ���ڿ��� ��ȯ�մϴ�.
select to_char(sysdate) from dual;

-- to_char �Լ��� ���ڸ� ���ڿ��� ��ȯ�մϴ�. 123�� ���ڿ� '123'���� ��ȯ�մϴ�.
select to_char(123) from dual;

-- to_date �Լ��� ���ڿ��� ��¥�� ��ȯ�մϴ�. '12 05 2014'�� 'DD MM YYYY' �������� �ؼ��Ͽ� ��¥�� ��ȯ�մϴ�.
select to_date('12 05 2014', 'DD MM YYYY') from dual;

-- to_number �Լ��� ���ڿ��� ���ڷ� ��ȯ�մϴ�. '12.3'�� ���� 12.3���� ��ȯ�մϴ�.
select to_number('12.3') from dual;

-- decode �Լ��� ���ǿ� ���� �ٸ� ���� ��ȯ�մϴ�. 1�� 1�� �����Ƿ� 'aa'�� ��ȯ�մϴ�.
select decode(1, 1, 'aa', 'bb') from dual;

-- nullif �Լ��� �� ���� ������ NULL�� ��ȯ�ϰ�, �ٸ��� ù ��° �� ��ȯ�մϴ�. 123�� 345�� �ٸ��Ƿ� 123�� ��ȯ�մϴ�.
select nullif(123, 345) from dual;

-- nvl �Լ��� ù ��° ���� NULL�̸� �� ��° ������ ��ü�մϴ�. ù ��° ���� NULL�̹Ƿ� 123���� ��ü�˴ϴ�.
select nvl(null, 123) from dual;
