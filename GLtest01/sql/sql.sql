select * from PRODUCT order by prio
delete from PRODUCT
insert into product values('JP_O_35_A_18',	'��Ű���� 3�� 5�� ����',	'�Ϻ�',	'��Ű����',	356000,	4,	20,	'3��5��',	5	,'�ƽþƳ��װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-18',	'JPO35A18.png',	'JPO35A18tb.png',	null,	4.5,null,	1);
insert into product values('JP_O_35_A_30',	'��Ű���� 3�� 5�� ����',	'�Ϻ�',	'��Ű����',	356000,	4,	20,	'3��5��',	5	,'�ƽþƳ��װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-30',	'JPO35A30.png',	'JPO35A30tb.png',	null,	4.5,null,	1);
insert into product values('JP_O_35_P_30',	'��Ű���� 3�� 5�� ����',	'�Ϻ�',	'��Ű����',	356000,	4,	20,	'3��5��',	5	,'PEACH�װ�',	'��Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ���Ű���� ��õ���� 3��5�� ���� ���� �󼼳����ۼ��Դϴ��ۼ��ۼ�',	'2017-01-30',	'JPO35P30.png',	'JPO35P30tb.png',	10,	3.5,1,	2);

select * from guest

insert into guest values(8888,'888',sysdate,88)

update product set discount=0.1 where proid='JP_O_35_P_30'

create table cat(
code varchar(20),
name varchar(40)
);
create table loc(
loccode varchar(20),
locname varchar(40),
catcode varchar(20)
);

insert into cat values('HD','�ֵ�');
insert into cat values('KR','����');
insert into cat values('GL','�ؿ�');
insert into cat values('HU','�޾���');
insert into cat values('FM','��������');
insert into cat values('FO','����Ž��');
insert into cat values('OD','����ġ��');

insert into loc values('OK','�Ϻ�-��Ű����','GL');
insert into loc values('TO','�Ϻ�-����','GL');
insert into loc values('OS','�Ϻ�-����ī','GL');
insert into loc values('KU','�Ϻ�-ť��','GL');
insert into loc values('JE','���ֵ�','KR');
insert into loc values('GU','����','KR');
insert into loc values('YE','����','KR');

select * from cat
select * from loc
