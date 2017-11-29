use myworld;
#database 리스트 조회
show databases;
#database 환경설정
show variables;
#user생성
create user user02@localhost identified by 'user02';
create user user02@'%' identified by 'user03';
#권한부여
grant select,insert,update on 테이블 to user;
#권한 회수
revoke select,insert,update on 테이블 from user;

#테이블 생성
# 이 칼럼은 비어있으면 안됨.식별자
create table member(
 id int not null primary key,
 username varchar(20),
 dept     varchar(7),
 birth     date,
 email     varchar(40)
 
);
# 테이블 구조-데이타가 저장되는 구조를 정의 - create table
desc member;
#테이블 구조 변경 - 데이타의 저장구조을 변경
alter table member add(tel varchar(30) not null);
alter table member modify username varchar(10);
alter table member drop primary key;
# 데이타 정의의 (DDL) 
#테이이블 삭제 - 데이타가 저장될 구조를 삭제
drop table member;









