create table useraccount (
   userid varchar2(10) primary key,
   password varchar2(15),
   username varchar2(20),
   phoneno varchar2(20),
   add1 varchar2(7),
   add2 varchar2(100),
   add3 varchar2(100),
   email varchar2(50),
   birthday date
);
DROP TABLE useraccount CASCADE CONSTRAINTS;
select * from useraccount