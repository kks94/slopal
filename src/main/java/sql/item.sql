DROP TABLE WISH CASCADE CONSTRAINTS; 
DROP TABLE ITEM CASCADE CONSTRAINTS; 
DROP TABLE RECEIVE CASCADE CONSTRAINTS; 
DROP TABLE sale CASCADE CONSTRAINTS; 
DROP TABLE saleitem CASCADE CONSTRAINTS; 
select * from item;
select * from item where name='iPhone 14'

create table item
(
   id number NOT NULL,   -- 상품id
   name varchar2(30) NOT NULL, -- 상품 이름
   price number,  -- 상품 가격
   pictureUrl varchar2(100), -- 상품 사진 url
   description varchar2(100), -- 상품 정보
   quality varchar2(10) NOT NULL,  -- 상품 품질 =>  1:S, 2:A, 3:B
   tag varchar2(20), -- 상품 종류 
   grp int,               --이름이 같은 상품은 grp 같도록 
   PRIMARY KEY (name, quality)
);

CREATE TABLE wish --위시db
(
	id number NOT NULL,
	userid varchar2(15) NOT NULL, --사용자 아이디
	itemName varchar2(30) NOT NULL,   -- 아이템 이름
	itemQuality varchar2(10) NOT NULL,  -- 아이템 품질
	PRIMARY KEY (id, userid, itemName, itemQuality)
);
select * from wish;


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


CREATE TABLE sale ( --주문정보
	saleid number PRIMARY KEY, --주문번호
	userid varchar2(10) NOT NULL, --사용자 아이디
	saledate date --주문일자
);

select * from sale;
-- saleid  seq
--	 1		1
--	 1		2
--	 1		3
--> 1번에 해당하는 주문에 상품이 3개 있는 것임


-->references 안먹혀서 이 table로 함.
CREATE TABLE saleitem ( --주문상품
	saleid number REFERENCES sale(saleid), 			--주문번호
	seq number,                   					--주문상품번호 
	--itemid number REFERENCES item(id), 	   		--주문상품아이디.
	itemName varchar2(30), 	 	--주문상품 이름
	itemQuality varchar2(10),  --주문상품 품질
	price number,                          			--가격
	quantity number,             					--주문수량
	PRIMARY KEY (saleid, seq)              --기본키 : saleid + seq
);
select * from saleitem;
