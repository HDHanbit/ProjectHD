select * from PRODUCT order by prio
delete from PRODUCT where proname=null
drop table product
create table product(
proid varchar2(30),
proname varchar2(100),
cat varchar2(20),
loc varchar2(50),
price number,
minp number,
maxp number,
peris varchar2(50),
trans varchar2(50),
exp varchar2(1000),
startd varchar2(30),
img varchar2(30),
thumb varchar2(30),
discount number,
point number,
prio number,
event number
)

insert into product values('GLOK아18',	'오키나와 3박 5일 즐기기',	'GL',	'일본-오키나와',	356000,	4,	20,	'3박5일',	'아시아나항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-18',	'GLOK아18.png',	'GLOK아18tb.png',	null,	4.5,null,	1);
insert into product values('GLOK아30',	'오키나와 3박 5일 즐기기',	'GL',	'일본-오키나와',	356000,	4,	20,	'3박5일',	'아시아나항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-30',	'GLOK아30.png',	'GLOK아30tb.png',	null,	4.5,null,	1);
insert into product values('GLOKP30',	'오키나와 3박 5일 즐기기',	'GL',	'일본-오키나와',	356000,	4,	20,	'3박5일',	'PEACH항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-30',	'GLOKP30.png',	'GLOKP30tb.png',	0.1,	3.5,1,	2);

select * from guest

insert into guest values(8888,'888',sysdate,88)

update product set discount=0.1 where proid='JP_O_35_P_30'
update product set cat='GL'

create table cat(
code varchar(20),
name varchar(40)
);
create table loc(
locname varchar(40),
catcode varchar(20)
);

SELECT * FROM LOC INNER JOIN CAT ON LOC.CATCODE = CAT.CODE
SELECT * FROM product INNER JOIN CAT ON product.CAT = CAT.code
select sum(goperson) as cnt from oder where oder.proid='KR제주부산305'
SELECT product.proid,  maxp  FROM oder INNER JOIN product ON oder.proid=product.proid where oder.proid='KR제주부산305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR제주부산305') where proid='KR제주부산305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR제주부산305') where proid='KR제주부산305'
SELECT price, orderid FROM oder INNER JOIN product ON oder.proid=product.proid where orderid='k_i_9'
select * from oder where cancel =0 or cancel = 1
update oder set cancel=0 where cancel=2
select * from oder
insert into cat values('HD','핫딜');
insert into cat values('KR','국내');
insert into cat values('GL','해외');
insert into cat values('HU','휴양지');
insert into cat values('FM','가족여행');
insert into cat values('FO','맛집탐방');
insert into cat values('OD','당일치기');

insert into loc values('일본-오키나와','GL');
insert into loc values('일본-도쿄','GL');
insert into loc values('일본-오사카','GL');
insert into loc values('일본-큐슈','GL');
insert into loc values('제주도','KR');
insert into loc values('군산','KR');
insert into loc values('여수','KR');

select * from cat
select * from loc

select * from loc inner join CAT on loc.catcode = cat.code where cat.name='해외';

drop table loc;


create table event(
eid varchar2(30),
ename varchar2(50),
eimg varchar2(50),
eexp varchar2(500),
eurl varchar2(100),
eprio number,
eduring varchar2(30)
)
insert into event values('openEvent_1','오픈이벤트!', 'openEvent.png','오픈이벤트 전 해외카테고리 10% 할인'
, 'www.naver.com',null,'2016-12-30');

select * from event
select * from product
select * from oder
drop table oder
create table oder(
orderid varchar2(30),
proid varchar2(30),
customid varchar2(20),
paycash number,
payd varchar2(20),
goperson number,
cancel number
)

insert into ODER values('k_u_9','KR제주부산302','user1',1200000,'2016-12-01',4,0);
insert into ODER values('k_i_9','KR제주부산302','iuser1',300000,'2016-12-10',1,0);
insert into ODER values('G_u_1','GL일본Pe301','user2',0,null,3,0);
insert into ODER values('G_i_4','GL일본아시183','iuser2',712000,'2016-12-16',2,1);
insert into ODER values('F_i_9','FM환불지하024','iuser2',16000,'2016-12-30',2,0);

select * from custest


delete from oder

update oder set cancel=1 where customid='iuser2'

GL일본아시183


고객 테이블

create table custest(
id varchar2(20),
cash number,
tcash number
)


CREATE TABLE custest(
id varchar2(20),
pw varchar2(20),
name varchar2(20),
phone number,
cash number,
tcash number,
grade varchar2(20)
);
insert into custest values('user1','1234','유저1',01012341234,12000,1200000,'프로썸러');
insert into custest values('iuser1','1234','아이유저1',01012341234,20000,3000000,'카사노바');
insert into custest values('user2','1234','유저2',01012341234,0,0,'프로썸러');
insert into custest values('iuser2','1234','아이유저2',01012341234,7120,712000,'프로썸러');
delete from custest where id='iuser2'
select * from custest
select * from custest where id like '%i%'


CREATE TABLE "SCOTT"."CUSTOMER" 
   (   "ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
   "PW" VARCHAR2(20 BYTE), 
   "NAME" VARCHAR2(20 BYTE), 
   "PHONE" NUMBER(20,0), 
   "CASH" NUMBER, 
   "GRADE" VARCHAR2(20 BYTE), 
   "TCASH" NUMBER, 
    CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;

  
  create table coupon(
  cupid varchar2(30),
  cupname varchar2(50),
  percent number,
  customid varchar2(20),
  cupperi varchar2(20)  
  )
  select * from coupon
drop table custest



