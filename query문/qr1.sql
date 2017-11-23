## 데이터 정의어(DLL) - Data Definition Language
# create, alter, drop

#데이터 처리어 (DML) - Data Manipulation Language
# insert, update, delete, select
desc member;
#테이블에 데이터 입력하기
insert into member(id,username,dept,birth,email,tel)
values(201301,'홍길동','기술','1992-10-23','hong@naver.com','010-1234-5678');
#데이터 조회하기
select id,username,dept,birth,email,tel
  from member;
#데이터 수정
update member
   set tel = '010-111-1234'
 where id = 201301;
 
#데이터 삭제
delete from member where id = 201301;

create table emp(
	id int primary key,
    username varchar(20),
    deptno int,
    hiredate date,
    sal int
);
select id,username,deptno,hiredate,sal from emp;
insert into emp(id,username,deptno,hiredate,sal)
values(201701,'홍길동',1,'2012-01-10',1500000);
insert into emp values(201702,'임꺽정',1,'2012-01-11',2000000);
insert into emp values(201703,'일지매',3,'2012-01-12',1500000);
insert into emp values(201704,'이순신',2,'2012-01-13',3000000);
insert into emp values(201705,'유관순',3,'2012-01-14',1000000);
insert into emp values(201706,'김길동',1,'2012-01-15',2000000);
insert into emp values(201707,'이지매',2,'2012-01-16',3000000);