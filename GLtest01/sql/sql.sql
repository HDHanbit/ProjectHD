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

insert into product values('GLOK��18',	'��Ű���� 3�� 5�� ����',	'GL',	'�Ϻ�-��Ű����',	356000,	4,	20,	'3��5��',	'�ƽþƳ��װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-18',	'GLOK��18.png',	'GLOK��18tb.png',	null,	4.5,null,	1);
insert into product values('GLOK��30',	'��Ű���� 3�� 5�� ����',	'GL',	'�Ϻ�-��Ű����',	356000,	4,	20,	'3��5��',	'�ƽþƳ��װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-30',	'GLOK��30.png',	'GLOK��30tb.png',	null,	4.5,null,	1);
insert into product values('GLOKP30',	'��Ű���� 3�� 5�� ����',	'GL',	'�Ϻ�-��Ű����',	356000,	4,	20,	'3��5��',	'PEACH�װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-30',	'GLOKP30.png',	'GLOKP30tb.png',	0.1,	3.5,1,	2);

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
select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305'
SELECT product.proid,  maxp  FROM oder INNER JOIN product ON oder.proid=product.proid where oder.proid='KR���ֺλ�305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305') where proid='KR���ֺλ�305'
select * from (SELECT product.proid, maxp  FROM oder INNER JOIN product ON oder.proid=product.proid), (select sum(goperson) as cnt from oder where oder.proid='KR���ֺλ�305') where proid='KR���ֺλ�305'
SELECT price, orderid FROM oder INNER JOIN product ON oder.proid=product.proid where orderid='k_i_9'
select * from oder where cancel =0 or cancel = 1
update oder set cancel=0 where cancel=2
select * from oder
insert into cat values('HD','�ֵ�');
insert into cat values('KR','����');
insert into cat values('GL','�ؿ�');
insert into cat values('HU','�޾���');
insert into cat values('FM','��������');
insert into cat values('FO','����Ž��');
insert into cat values('OD','����ġ��');

insert into loc values('�Ϻ�-��Ű����','GL');
insert into loc values('�Ϻ�-����','GL');
insert into loc values('�Ϻ�-����ī','GL');
insert into loc values('�Ϻ�-ť��','GL');
insert into loc values('���ֵ�','KR');
insert into loc values('����','KR');
insert into loc values('����','KR');

select * from cat
select * from loc

select * from loc inner join CAT on loc.catcode = cat.code where cat.name='�ؿ�';

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
insert into event values('openEvent_1','�����̺�Ʈ!', 'openEvent.png','�����̺�Ʈ �� �ؿ�ī�װ� 10% ����'
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

insert into ODER values('k_u_9','KR���ֺλ�302','user1',1200000,'2016-12-01',4,0);
insert into ODER values('k_i_9','KR���ֺλ�302','iuser1',300000,'2016-12-10',1,0);
insert into ODER values('G_u_1','GL�Ϻ�Pe301','user2',0,null,3,0);
insert into ODER values('G_i_4','GL�Ϻ��ƽ�183','iuser2',712000,'2016-12-16',2,1);
insert into ODER values('F_i_9','FMȯ������024','iuser2',16000,'2016-12-30',2,0);

select * from custest


delete from oder

update oder set cancel=1 where customid='iuser2'

GL�Ϻ��ƽ�183


�� ���̺�

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
insert into customer values('user1','12341234','����1',01012341234,12000,1200000,'���ν淯');
insert into customer values('iuser1','12341234','��������1',01012341234,20000,3000000,'ī����');
insert into customer values('user2','12341234','����2',01012341234,0,0,'���ν淯');
insert into customer values('iuser2','12341234','��������2',01012341234,7120,712000,'���ν淯');
insert into customer values('admin','12341234','������',01012341234,0,0,'������');

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

insert into notice values('pop1', '�˾�',null,'popup.png',sysdate);
insert into notice values('notice1', '�űԿ��� ���������Դϴ�.',
'greenlight ����簡 �űԿ����ϰ� �Ǿ����ϴ�. �����ϼż� �پ��� ��ſ��� �����ñ� �ٶ��ϴ�.',null,sysdate);
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

  
1:1����
insert into voc values('us����7','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','user1',null,null);
insert into voc values('1','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','user1',null,null);
insert into voc values('usȯ��4','ȯ���ϰ� �;��.','ȯ��ȯ��ȯ��ȯ��ȯ��ȯ��ȯ�ҿ���~','user1','ȯ�ҽ�û�� �Ͻø� ȯ���� �帳�ϴ�~',null);
insert into voc values('iu����7','���̵� �ٲٰ� �;��.','���̵� �ٲٰ� ������ ��� �ϳ���?','iuser1',null,null);
insert into voc values('adte2','testtesttest','�׽�Ʈ���Դϴ�.','admin','test',null);
��ǰ����
insert into voc values('us��Ű9','��Ű���� ��Ű���� ���� ���ǵ帳�ϴ�.','��Ű���� ��Ű�� �ȿ��� ������ �ֳ���?','user1',null,'GL�Ϻ��ƽ�183');
insert into voc values('iu��Ű3','��Ű���� �����̿�','������ ���� ��γ���?','iuser1','���Բ� ������ ��ǰ���� �ٰ����ڽ��ϴ�. �����մϴ�.','GL�Ϻ��ƽ�183');
faq
insert into voc values('FAQ_3_N','ȸ�������� ��� �ϳ���?','ȸ�������� �ϰ� ������ ȸ�������� ��� �ؾ� �ϳ���?',null,
'ȸ������ ��ư�� ���� �� ȸ������ ���������� ȸ�������� �����Ͻø� �˴ϴ�.',null);
insert into voc values('FAQ_4_Y','ȸ��Ż��� ��� �ϳ���?','ȸ��Ż�� �ϰ� ������ ȸ�������� ��� �ؾ� �ϳ���?',null,
'�α��� �� ȸ�� Ż���ư�� ������ ȸ��Ż�� ��û�� �˴ϴ�. �����ڿ��� Ȯ�� �� ȸ�� Ż�� �����մϴ�. Ż�� �Ŀ��� ������ ��� ������ �����մϴ�.',null);


select * from voc where proid is not null
select * from voc where customid is not null and proid is null
select * from voc where vocid like 'FAQ%'
delete from voc where vocid like 'FAQ%'
delete from voc















  