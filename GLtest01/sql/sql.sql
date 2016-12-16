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




