#데이타베이스 사용
use mydatabase01;
#테이블생성
#사원테이블: emp 
#속성:           empno,       ename, sal,deptno,  deptname
# 데이타타입:   int(4), varchar(20), int,int(1),   varchar(20)
# 옵션(제약조건):key(자동증가)           ,not null,  
create table emp(
empno         int(4) primary key auto_increment,
ename    varchar(20),
sal           int,#11자리
deptno        int(1) not null,
deptname varchar(20)
);

show tables;
desc emp;# emp테이블의구조(메타데이타)
#데이타 입력
insert into emp(empno,ename,sal,deptno,deptname)
         values(2001,'홍길동',15000,1,'기획');
select empno,ename,sal,deptno,deptname 
  from emp;        
insert into emp(ename,sal,deptno,deptname)
         values('임꺽정',20000,1,'기획');
insert into emp(ename,sal,deptno,deptname)
         values('일지매',18000,2,'영업');
insert into emp(ename,sal,deptno,deptname)
         values('김길동',23000,2,'영업');         
insert into emp(ename,sal,deptno,deptname)
         values('임거정',20000,3,'재무');         
insert into emp(ename,sal,deptno,deptname)
         values('이순신',25000,3,'재무');
         
# 현재 만들어진 테이블의 속성 중
# deptno로 deptname을 유추할수있는 상황
# 이럴때 유추가능한 속성을 따로 분리하여
# 테이블로 만들고 두 테이블의 관계를 연결.
# 정규화         
select empno,ename,sal,deptno,deptname from emp; 
#dept 테이블 생성
# 속성:    deptno,    deptname, location
# 타입:    int(1), varchar(20), varchar(50)
# 제약조건: key(자동증가)
create table dept(
deptno int(1) primary key auto_increment,
deptname varchar(20),
location varchar(50)
);
# 부서테이블에 데이타 입력
insert into dept(deptname,location)
		  values('기획','서울시');
insert into dept(deptname,location)
		  values('영업','인천시');
insert into dept(deptname,location)
		  values('재무','수원시');          

# 칼럼 삭제 - alter table 테이블명 drop 칼럼명;
alter table emp drop deptname;

# emp테이블의 속성과 dept테이블의 속성을
# 함께 출력
select emp.empno, emp.ename, emp.sal,
	   emp.deptno, dept.deptname, dept.location
  from emp,
       dept
 where emp.deptno = dept.deptno;

# 서로 연결(join)되는 테이블의 속성들이
# 중복되지 않으면 속성명만 표시 가능, 
select empno, ename, sal,
	   emp.deptno, deptname, location
  from emp,
       dept
 where emp.deptno = dept.deptno;

# 별칭(alias) - 칼럼 다음에 별칭을 부여가능
# 칼럼 as 별칭(영어는 그대로, 한글은 ' '로 묶어서 표시)
select empno as'사번', ename as '사원명', sal '급여',
	   emp.deptno '부서코드', deptname '부서명', location '위치'
  from emp,
       dept
 where emp.deptno = dept.deptno;
 
 # 테이블의 속성의 모든 경우의 값 : 도메인(domain)
 select deptno,deptname,location from dept;
 
 #테이블 삭제전 데이타 삭제
 # DDL문에서의 데이타 삭제
 # tabel구조는 그대로 있고, 데이타만 삭제됨
 # DML문의 delete와 비슷함
 # DML문의 delete는 rollback을 할수 있으나,
 # DDL문의 truncate는 rollack자체가 없음.
 truncate table dept;
 select * from dept;
 truncate table emp;
 select * from emp;
 
 # SQL 문의 종류
 # DDL - CREATE, ALTER, DROP, TRUNCATE
 # DML - insert, update, delete, select
 # DCL - grant, revoke
 
 drop table emp;
 drop table dept;
 
 # foreign key
 # 두 테이블이 연관되는 속성을 가진경우
 # 속성의 주테이블(Parent) 의 속성값이
 # 참조하는 테이블의 속성으로 부여된는 경우
 # 부모-자식의 관계라고 하고,
 # 부모테이블의 주key(primary key)가 자식의
 # 주key(primary key)로 부여되는 경우 - 식별관계
 # 자식의 일반속성으로 부여된는 경우 - 비식별관계
 create table dept(
 deptno int(1) primary key auto_increment,
 deptname varchar(20),
 location varchar(20)
 );
 #테이블 생성시 외래키부여
 # constraint 외래키명 forein key(칼럼명)
 #  references 참조테이블명(참조칼럼) on delete cascade;
 create table emp(
 empno int(4) primary key auto_increment,
 ename varchar(20),
 sal   int,
 deptno int(1),
 constraint fk_deptno foreign key(deptno) 
      references dept(deptno) on delete cascade#외래키 부여
 );
 #  on delete cascase: 부모키가 삭제되면 참조하는 모든 자식테이블에서 키를 삭제
 # on delete [rectict|cascade|set null| no action|set default]
 # restrict- 부모키가 삭제되어도 참조하는 자식키들은 삭제하지않음
 # set null -         "       참조하는 자식키는 모드 null로 변환
 # no caction - 무시
 # set default -      "  자식키들은 default로 대체
 
 #테이블 삭제
 drop table emp;
 create table emp(
 empno int(4) primary key auto_increment,
 ename varchar(20),
 sal   int,
 deptno int(1)
 );
 
#테이블 생성 후 외래키 제약조건 부여하기
alter table emp add foreign key(deptno) references dept(deptno)
on delete cascade; 

# dept와 emp테이블의 부모-자식관계 설정 후 데이타 입력하기
insert into dept(deptname,location) values('기획','서울시');
insert into dept(deptname,location) values('영업','인천시');
insert into dept(deptname,location) values('재무','수원시'); 
insert into dept(deptname,location) values('연구','수원시'); 
# DEPT테이블의 DEPTNO속성은 (1,2,3)<=나올수 있는 도메인의 값(1,2,3)
insert into emp(ename,sal,deptno)
         values('임꺽정',20000,1);
insert into emp(ename,sal,deptno)
         values('일지매',18000,2);
insert into emp(ename,sal,deptno)
         values('김길동',23000,2);         
insert into emp(ename,sal,deptno)
         values('임거정',20000,3);  
#부모테이블의 도메인은 (1,2,3)인데, 자식테이블에서
#도메인 외의 속성값을 입력하려는 경우 오류발생 - 정합성오류  
#자식테이블에는 외래키인 경우 -null값이 올수 있음.(이 칼럼을 not null로 하면 안됨)       
insert into emp(ename,sal,deptno)
         values('이순신',25000,NULL);

update emp
   set deptno = 3 # null ->3으로 변경
 where empno = 6;

#부모테이블의 속성값 삭제 후의 자식테이블의 속성값 변화
delete from dept where deptno = 3;

#외래키 삭제
alter table emp drop foreign key emp_ibfk_1;

#부모테이블의 속성값을 삭제후 자식테이블의 속성값을 null로
#하기 위한 외래키 생성 옵션을 이용하여 외래키를 재생성
alter table emp add foreign key(deptno) references dept(deptno)
on delete set null; 
#부모테이블(dept)에 도메인 3이 없음
insert into emp(empno,ename,sal,deptno)
         values(4,'임거정',20000,null); 
insert into dept(deptno,deptname,location)
          values(3,'재무','수원시');
update emp set deptno = 3 where empno=4;
delete from dept where deptno=3;
insert into dept(deptno,deptname,location)
          values(3,'재무','수원시');

#제약조건이 걸려있어서 수정 불가.
update dept set deptno=5 where deptno=3;

#테이블 생성시 primary key 설정(제약조건:constraint),
create table sample31(
a integer not null, #not null조건
b integer not null unique,# not null, unique => primary key
c varchar(30)
);
insert into sample31(a,b,c) values(1,1,'값1');
insert into sample31(a,b,c) values(1,1,'값2');# column b가 중복 오류 발생

# 복수열에 primary key 제약조건 추가 생성
# 복합키(두개이상의 속성으로 키를 만듦)
create table sample632(
no integer not null, # 키의 후보
sub_no integer not null,# 키의 후보
name varchar(30),
primary key (no, sub_no) #primary key명이 없음
);
insert into sample632(no,sub_no,name) values(1,1,'값1');
insert into sample632(no,sub_no,name) values(1,2,'값2');
insert into sample632(no,sub_no,name) values(1,1,'값3');

drop table sample632;
create table sample632(
no integer not null, # 키의 후보
sub_no integer not null,# 키의 후보
name varchar(30),
constraint  pkey_sam632 primary key(no, sub_no) #primary key명있음
);
# 테이블 생성 후 제약 조건 추가하기
create table sample633(
no integer not null, # 키의 후보
sub_no integer not null,# 키의 후보
name varchar(30)
);
#primary key 제약조건 추가하기
#alter table 테이블명 add contstraint pkey_명 primary key(칼럼);
alter table sample633 
   add constraint pkey_sam633 primary key(no,sub_no);
# primary key 제약 조건 삭제
# alter table 테이블명 drop priamry key;
alter table sample633 drop primary key;#mySQL인 경우

# 상품테이블, 제조사 테이블, 재고,
# 상품테이블:goods
# 속성: goodsno,   goodsname, price, prodno
# 타입:     int, varchar(20),   int, int
# 제약조건: key(자동증가),           fk_goods_1
create table goods(
goodsno int primary key,
goodsname varchar(20),
price int,
prodno int,
constraint fk_goods_1 foreign key(prodno) 
      references maker(prodno) on delete cascade
);

# 제조사 테이블: maker
# 속성: prodno, prodname
# 타입:    int, varchar(30)
# 제약조건: key(자동증가)
create table maker(
prodno int primary key auto_increment,
prodname varchar(30)
);

# 재고 테이블: stock
# 속성:     no,          goodsno,    qty
# 타입:     int,             int,     int
# 제약조건: key(자동증가), fk_stock_1(외래키)
create table stock(
no int primary key auto_increment,
goodsno int,
qty int,
constraint fk_stock_1 foreign key(goodsno) 
      references goods(goodsno) on delete cascade
);

# relationship으로 연결된 테이블들간의 데이타 입력은
# 참조되는 부모테이블의 데이타가 먼저 입력된 후 
# 자식테이블의 데이타가 입력되어야함.
# 부모테이블이 도메인 범위냉의 값만 허용
insert into maker(prodname) values('삼성');
insert into maker(prodname) values('LG');
insert into maker(prodname) values('대우'); 

#상품테이블에 값 입력
insert into goods values (1001,'갤럭시s8',1000000,1);
insert into goods values (1002,'V30', 990000,2);
insert into goods values (1003,'세탁기1',800000,3);
#재고 테이블에 값 입력
insert into stock(goodsno,qty) values(1001,100);
insert into stock(goodsno,qty) values(1002,100);
insert into stock(goodsno,qty) values(1003,200);

# select 
# 상품코드,상품명, 제조사명, 재고수량
# 조회순서 where -> select -> order by  
# 한글은 예외
select goods.goodsno as goodsNo, goodsname as '상품명', 
       prodname '제조사명', qty '수량'
  from goods,
	   maker,
	   stock
 where goods.prodno = maker.prodno # equal 조인
   and goods.goodsno = stock.goodsno # equal조인 
 order by goodsNo asc;# 정렬 기준 (default 오름차순) 
 
insert into stock(goodsno,qty) values(1001,300);
insert into stock(goodsno,qty) values(1002,50);
insert into stock(goodsno,qty) values(1003,100); 
insert into stock(goodsno,qty) values(1001,100);
insert into stock(goodsno,qty) values(1002,150);
insert into stock(goodsno,qty) values(1003,100); 
 
 select * from stock;
 
select goods.goodsno as goodsNo, goodsname as '상품명', 
       prodname '제조사명', qty '수량'
  from goods,
	   maker,
	   stock
 where goods.prodno = maker.prodno # equal 조인
   and goods.goodsno = stock.goodsno # equal조인 
 order by goodsNo asc;

#집계함수 - mysql에서 제공해주는 내장함수
# sum(),avg(),count(), max(),min()
# 이러한 집계 함수는 반드시 group by절과 함께사용.
#stock테이블에서 상품코드별 재고 수량 
select goodsno, sum(qty)
  from stock
 group by goodsno # 집계 함수는 group by와 함께 사용
 ;
 
 # 상품테이블, 제고사 테이블 - 변화가 없는 테이블 (마스타성테이블)
 # 재고테이블은 변화가 자주일어난 테이블(transactional테이블)
 #### 집계함수의 쿼리순서
 #### where 구 -> group by 구 -> select 구 -> order by 구 
 select goods.goodsno as goodsNo, max(goodsname) as '상품명', 
       min(prodname) '제조사명', sum(qty) '수량'
  from goods,
	   maker,
	   stock
 where goods.prodno = maker.prodno # equal 조인
   and goods.goodsno = stock.goodsno # equal조인 
 group by goods.goodsno #집계단위의 기준
 order by goodsNo asc;

# group by 기준속성 으로 집계한 데이타의 조건으로
# 수량이 400개 이상인 상품의 코드,상품명, 제조사명, 수량 
#쿼리순서 
#where 구 -> group by 구 -> having 구 -> select 구 -> order by구
select goods.goodsno as goodsNo, max(goodsname) as '상품명', 
       min(prodname) '제조사명', sum(qty) as sumQty
  from goods,
	   maker,
	   stock
 where goods.prodno = maker.prodno # equal 조인
   and goods.goodsno = stock.goodsno # equal조인 
 group by goods.goodsno #집계단위의 기준
having sumQty >=400  # group by 기준 다음에 조건으로 having절이 옴. 
 order by goodsNo asc;
 
# stock테이블에서 재고를 반출
# 1001 -100, 1002 - 100, 1003 - 50
# update 말고 insert로 재고를 등록하세요
insert into stock(goodsno,qty) values(1001,-100);
insert into stock(goodsno,qty) values(1002,-100);
insert into stock(goodsno,qty) values(1003,-50);

# 집계함수를 사용하여 
# 코드(기준)별 총 재고수량을출력하세요
# 단, 재고량이 400개 이상인 것(집계데이타 조건)만 출력


#
  





 

  
 








 
 
 
 
 


         