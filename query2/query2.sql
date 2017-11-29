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
   set tel = '010-1234-5678'
 where id = 201301;
 
  