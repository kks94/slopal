CREATE TABLE receive --입고db
(
	id number NOT NULL,   -- 입고 id
	incnt number,
	indate date,
	itemName varchar2(30) NOT NULL, --상품 이름
	itemQuality varchar2(10) NOT NULL --상품 품질
);
select * from receive
DROP TABLE receive CASCADE CONSTRAINTS; 