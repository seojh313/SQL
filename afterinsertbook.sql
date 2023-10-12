create or replace trigger afterinsertbook
after insert on book for each row
declare
    average number;
begin
    insert into book_log
    values(:new.bookid, :new.bookname, :new.publisher, :new.price);
    DBMS_output.put_line('삽입 행을 book_log 테이블에 백업했다');
END;

insert into book values(16,'과학좋아요','과학미디어',25000);

select * from book where bookid=16;
select * from book_log where bookid_l=16;