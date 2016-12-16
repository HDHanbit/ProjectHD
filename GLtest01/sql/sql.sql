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




