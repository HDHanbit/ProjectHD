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


CREATE TABLE customer(
id varchar2(20),
pw varchar2(20),
name varchar2(20),
phone number,
cash number,
tcash number,
grade varchar2(20)
);

drop table custest
insert into customer values('user1','12341234','유저1',01012341234,12000,1200000,'프로썸러');
insert into customer values('iuser1','12341234','아이유저1',01012341234,20000,3000000,'카사노바');
insert into customer values('user2','12341234','유저2',01012341234,0,0,'프로썸러');
insert into customer values('iuser2','12341234','아이유저2',01012341234,7120,712000,'프로썸러');
insert into customer values('admin','12341234','관리자',01012341234,0,0,'흙흙모쏠');

delete from customer 
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
drop table notice

create table notice(
notid varchar2(20),
notitle varchar2(100),
notcontent varchar2(1000),
notfile varchar2(50),
notday date
)

insert into notice values('pop1', '팝업',null,'popup.png',sysdate);
insert into notice values('notice1', '신규오픈 공지사항입니다.',
'greenlight 여행사가 신규오픈하게 되었습니다. 가입하셔서 다양한 즐거움을 누리시길 바랍니다.',null,sysdate);
select * from notice

 CREATE TABLE "SCOTT"."QNA" 
   (	"NUM" VARCHAR2(1111 BYTE) NOT NULL ENABLE, 
	"LIST" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"NALJA" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "SYSTEM" ;


create table voc(
vocid varchar2(20),
voctitle varchar2(100),
voccontent varchar2(1000),
customid varchar2(100),
answer varchar2(1000),
proid varchar2(30)
)

select * from product

  
1:1문의
insert into voc values('us아이7','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','user1',null,null);
insert into voc values('1','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','user1',null,null);
insert into voc values('us환불4','환불하고 싶어요.','환불환불환불환불환불환불환불예에~','user1','환불신청을 하시면 환불해 드립니다~',null);
insert into voc values('iu아이7','아이디를 바꾸고 싶어요.','아이디를 바꾸고 싶은데 어떻게 하나요?','iuser1',null,null);
insert into voc values('adte2','testtesttest','테스트중입니다.','admin','test',null);
상품문의
insert into voc values('us오키9','오키나와 패키지에 대해 문의드립니다.','오키나와 패키지 안에는 무엇이 있나요?','user1',null,'GL일본아시183');
insert into voc values('iu오키3','오키나와 가격이요','가격이 왜케 비싸나요?','iuser1','고객님께 저렴한 상품으로 다가가겠습니다. 감사합니다.','GL일본아시183');
faq
insert into voc values('FAQ_3_N','회원가입은 어떻게 하나요?','회원가입을 하고 싶은데 회원가입을 어떻게 해야 하나요?',null,
'회원가입 버튼을 누른 후 회원가입 페이지에서 회원가입을 진행하시면 됩니다.',null);
insert into voc values('FAQ_4_Y','회원탈퇴는 어떻게 하나요?','회원탈퇴 하고 싶은데 회원가입을 어떻게 해야 하나요?',null,
'로그인 후 회원 탈퇴버튼을 누르면 회원탈퇴 신청이 됩니다. 관리자에서 확인 후 회원 탈퇴가 가능합니다. 탈퇴 후에는 고객님의 모든 정보를 삭제합니다.',null);


select * from voc where proid is not null
select * from voc where customid is not null and proid is null
select * from voc where vocid like 'FAQ%'
delete from voc where vocid like 'FAQ%'
delete from voc















  