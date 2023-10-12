create or replace function func_interest(price number)
return int 
is 
    myInterest number;
begin
    if price >= 30000 then
        myInterest := price * 0.1;
    else
        myInterest := price * 0.05;
    end if;
    return myInterest;
end;

--실행할때 블럭설정하고 실행해 주세요
select custid, orderid, saleprice, func_interest(saleprice) 이익금 from orders;
