## 데이타 정의의(DDL) -Data Definition Language
# create, alter, drop

#데이타 처리어(DML)-Data Manipulation Language
# insert, update, delete, select
use myworld;
desc member;
#테이블에 데이타 입력하기
insert into 
member(id,username,dept,birth,email,tel)
values(201301,'홍길동','기술','1992-10-23','hong@naver.com','010-111-1234');
#데이타 조회하기
select id,username,dept,birth,email,tel
  from member;
#데이타 수정 
update member
   set tel = '010-1234-5678'#수정할 값
 where id = 201301;# 조건
#데이타 삭제
delete from member where id = 201301; 
 
#테이블 생성
create table emp(
id int primary key,
username varchar(20),
deptno int(1),
hiredate date,
sal int
); 
insert into emp values(201701,'홍길동',1,'2012-01-10',15000);
insert into emp values(201702,'임꺽정',1,'2012-01-11',20000);
insert into emp values(201703,'일지매',3,'2012-01-12',15000);
insert into emp values(201704,'이순신',2,'2012-01-13',30000);
insert into emp values(201705,'유관순',3,'2012-01-14',10000);
insert into emp values(201706,'김길동',1,'2012-01-15',20000);
insert into emp values(201707,'이지매',2,'2012-01-16',30000);
# 데이타 조회시 모든 칼럼을 보고싶을때 *
select * from emp;
 
 
 