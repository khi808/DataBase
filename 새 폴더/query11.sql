# 산술연산 +,-,*,/
# select 식1, 식2,... from 테이블명
create table sam34(
no int primary key auto_increment,
price int,
qty int
);

insert into sam34(price,qty) values(100,230);
insert into sam34(price,qty) values(230,24);
insert into sam34(price,qty) values(1980,1);

# select된 결과값을 연산할수 있음
select *, #* - 모든항목
      price*qty '가격' # 곱셈연산자
  from sam34;
  
create table sam34Tot as
select *, #* - 모든항목
      price*qty '가격' # 곱셈연산자
  from sam34;
  
select * from sam34tot;

select *, #* - 모든항목
      price*qty '가격' # 곱셈연산자
  from sam34
 where price*qty >=2000; # where절에서도 연산자가 사용
 
 create table sam35(
 amount double
 );
 
 insert into sam35 values(596.60);
 insert into sam35 values(2138.40);
 insert into sam35 values(1080.00);
 
 
 select * from sam35;
 # round(칼럼값, 양수) -소수점, round(칼럼값,음수) - 정수 반올림
 # 반올림 함수 -소수점 1자리에서 반올림하여 정수로 만듬
 select amount, round(amount) from sam35;
 # 반올림 함수 -소수점 2자리에서 반올림하여 소수점 1자리로 만듬
 select amount,round(amount,1) from sam35;
 # 정수 두자리에서 반올림하여 100자리맞춤
 select amount,round(amount,-2) from sam35;
 
 #문자열 결합
 # concat substring trim charecter_length
 create table sam36(
 no int primary key auto_increment,
 price int,
 qty int,
 unit varchar(10)
 );
 insert into sam36(price,qty,unit) values(100,10,'개');
 insert into sam36(price,qty,unit) values(230,24,'캔');
 insert into sam36(price,qty,unit) values(1980,1,'장');
 
 #결합연산자 concat(앞의 열, 뒤의 열) 
 select concat(qty,unit) from sam36;
 #substring(시작,갯수)
 select substring('201711281553',1,4); 
 select substring('201711281553',5,2);
 select substring('201711281553',7,2);
 select substring('201711281553',9,2);
 select substring('201711281553',11,2); 
 
 # trim()함수
 select trim('ABC ') ;
 select trim('  ABC');
 select trim('A B C');
 
 #select character_length; - ascii,unicode상관없이 무조건 문자의 갯수를 반환
 select character_length('한국인');
 select character_length('abc');
 #length - ascii기준으로 되어어서 문자의 길이가 달라짐
 select length('한국인');
 select length('abc');
 
 # 날짜 연산
 #current_timestamp, current_date interval
 select current_timestamp;
 select current_date;#현재 날짜
 select current_date + interval +1 day; # 현재날짜 + 1일 
 select datediff('2017-11-28','2017-11-29');# 날짜 기간 조회
 # oralce - select to_date('2017/11/28','yyyy/mm/dd');
 
 
 # group 함수, sum(),avg(),max(),min(), count()
 create table sam51(
 no int primary key auto_increment,
 name varchar(10),
 qty int 
 );
 insert into sam51(name,qty) values('A',1);
 insert into sam51(name,qty) values('A',2);
 insert into sam51(name,qty) values('B',10);
 insert into sam51(name,qty) values('C',3);
 insert into sam51(name,qty) values(NULL,NULL);

 SELECT * FROM SAM51;#테이블명은 대/소문자 구분없음
 select count(name) from sam51;# null값은 집계에서 제외됨.
 select count(qty) from sam51;
 select count(*) from sam51; # * -전체 항목 - 집계함수사용시 (*)를 사용하면 전체 건수를 확인할수있음.
 
 # sub쿼리 - 쿼리의 결과 다른 쿼리의 일부가 되는 쿼리
 create table sam54(
 no int primary key auto_increment,
 a int
 );
 insert into sam54(a) values(100);
 insert into sam54(a) values(900);
 insert into sam54(a) values(80);
 select * from sam54;
 select min(a) from sam54;#전체에서 최소값 하나출력 - 스칼라값
 select max(a) from sam54;
 select min(a),max(a) from sam54;
 
 #sub쿼리 - 스칼라값이 sub쿼리로 사용
 select
   (select count(*) FROM sam51) as sq1,
   (select count(*) from sam54) as sq2;
  
  # from 절에 사용된 sub쿼리
select * 
  from (select * from sam54)sq; 
 
# 상관서브쿼리
# exists (select문)
create table sam55(
no int primary key auto_increment,
a varchar(10)
);
insert into sam55(a) values(NULL);
select * from sam55;
create table sam56(
no int
);
insert into sam56 values(3); 
insert into sam56 values(5);
 select * from sam56;

update sam55 
   set a = '있음'
 where exists (select * from sam56 where sam56.no=sam55.no);
 
 select * from sam55;
 
 update sam55 
   set a = '없음'
 where not exists (select * from sam56 where sam56.no=sam55.no);
 
 # in (값1,값2,,,,,)
 
 select * from sam55 where no in(3,5);
 select * from sam55 where no in (select no from sam56); # sub쿼리의 결과가 두개이상(스칼라값이 아님),
 select * from sam55 where no not in (select no from sam56);   
 
 # union union all
 # 두개이상의 쿼리 결과를 합쳐서 출력하는 쿼리문
 create table sam71(
 a int 
 );
 
 insert into sam71(a) values(1);
 insert into sam71(a) values(2);
 insert into sam71(a) values(3);
 select * from sam71;
 
 create table sam72(
 a int 
 );
 
 insert into sam72(a) values(2);
 insert into sam72(a) values(10);
 insert into sam72(a) values(11);
 
 #union 쿼리문에서 출력되는 항목이 중복되면 union뒤의 중복된 항목은 제외
 select * from sam71
 union
 select * from sam72;
 #union all 모두 출력
select * from sam71
 union all
 select * from sam72;
 
 select * from sam71 order by a;
 select * from sam72 order by a;
 
 #mysql에서는 가능
 select 1, 'A' from dual
 union all
 select 'A', 2 from dual;
 
 # order by 절이 있으면 마지막 쿼리문에만 사용한다.
 select * from sam71
 union
 select * from sam72 order by a;
 
 select * from sam71 aa
 union all
 select * from sam72 bb
 union all
 select * from sam71 cc 
 union all
 select * from sam72 dd  order by a
 ;
 
 
 
 
 
 
 
 



  
  