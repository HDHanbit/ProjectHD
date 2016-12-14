select * from PRODUCT order by prio
delete from PRODUCT
insert into product values('JP_O_35_A_18',	'오키나와 3박 5일 즐기기',	'일본',	'오키나와',	356000,	4,	20,	'3박5일',	5	,'아시아나항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-18',	'JPO35A18.png',	'JPO35A18tb.png',	null,	4.5,null,	1);
insert into product values('JP_O_35_A_30',	'오키나와 3박 5일 즐기기',	'일본',	'오키나와',	356000,	4,	20,	'3박5일',	5	,'아시아나항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-30',	'JPO35A30.png',	'JPO35A30tb.png',	null,	4.5,null,	1);
insert into product values('JP_O_35_P_30',	'오키나와 3박 5일 즐기기',	'일본',	'오키나와',	356000,	4,	20,	'3박5일',	5	,'PEACH항공',	'오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성오키나와 온천여행 3박5일 일정 여행 상세내역작성입니다작성작성',	'2017-01-30',	'JPO35P30.png',	'JPO35P30tb.png',	10,	3.5,1,	2);

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

insert into cat values('HD','핫딜');
insert into cat values('KR','국내');
insert into cat values('GL','해외');
insert into cat values('HU','휴양지');
insert into cat values('FM','가족여행');
insert into cat values('FO','맛집탐방');
insert into cat values('OD','당일치기');

insert into loc values('OK','일본-오키나와','GL');
insert into loc values('TO','일본-도쿄','GL');
insert into loc values('OS','일본-오사카','GL');
insert into loc values('KU','일본-큐슈','GL');
insert into loc values('JE','제주도','KR');
insert into loc values('GU','군산','KR');
insert into loc values('YE','여수','KR');

select * from cat
select * from loc
