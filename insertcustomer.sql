create or replace procedure insertcustomer(
    p_custid in number,
    p_name in varchar2,
    p_address in varchar2,
    p_phone in varchar2)
as
begin
    insert into customer(custid,name,address,phone)
    values(p_custid,p_name,p_address,p_phone);
end;

exec insertcustomer(6,'서지환','서울','010-1111-1111');