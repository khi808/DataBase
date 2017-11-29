# 게시글 테이블
create table board(
no int primary key auto_increment,
title varchar(50),
content longtext,
writer  varchar(30),
readcount int default 0,
regdate datetime default current_timestamp,
favor  int default 0
);
  
desc board; 

create table reply(
no int primary key auto_increment,
repno int,
content text,
writer varchar(30),
regdate datetime default current_timestamp
); 

desc board;
# 11-27 과제
# 1.게시글 10개 입력(insert)
# 2. 댓글 1게시글당 1~3개씩 입력.(insert)
# 3. 게시글의 좋아요 칼럼에 10~15씩 카운트 입력(update)
# 4. 게시글의 readcount 3~10씩 카운트 입력(update)
# 5. 출력: 게시글번호, 제목, 내용, 작성자, 댓글내용, 읽은횟수, 좋아요 횟수,
#           등록일시,댓글 작성자,  댓글 내용, 댓글 등록 일시,
#1.
insert into board(title,content,writer) values ('게시글1','게시글내용1','일지매');
insert into board(title,content,writer) values ('게시글2','게시글내용2','이순신');
insert into board(title,content,writer) values ('게시글3','게시글내용3','삼돌이');
insert into board(title,content,writer) values ('게시글4','게시글내용4','홍길동');
insert into board(title,content,writer) values ('게시글5','게시글내용5','김길동');
insert into board(title,content,writer) values ('게시글6','게시글내용6','이길동');
insert into board(title,content,writer) values ('게시글7','게시글내용7','임꺽정');
insert into board(title,content,writer) values ('게시글8','게시글내용8','팔득이');
insert into board(title,content,writer) values ('게시글9','게시글내용9','구봉서');
insert into board(title,content,writer) values ('게시글10','게시글내용10','열하나');
insert into board(title,content,writer) values ('게시글11','게시글내용11','열두리');
insert into board(title,content,writer) values ('게시글12','게시글내용12','열서희');
insert into board(title,content,writer) values ('게시글13','게시글내용13','열세명');
insert into board(title,content,writer) values ('게시글14','게시글내용14','일지매');
insert into board(title,content,writer) values ('게시글15','게시글내용15','이순신');
insert into board(title,content,writer) values ('게시글16','게시글내용16','홍길동');

#2.
alter table reply add constraint fk_reply_1 foreign key(repno)
references board(no) on delete cascade; 

insert into reply(repno,content,writer) values(1,'댓글11','일지매');
insert into reply(repno,content,writer) values(1,'댓글12','홍길동');
insert into reply(repno,content,writer) values(1,'댓글13','이순신');
insert into reply(repno,content,writer) values(2,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(2,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(2,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(3,'댓글31','일지매');
insert into reply(repno,content,writer) values(3,'댓글32','홍길동');
insert into reply(repno,content,writer) values(3,'댓글33','이순신');
insert into reply(repno,content,writer) values(2,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(2,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(2,'댓글43','고길동'); 
insert into reply(repno,content,writer) values(1,'댓글11','일지매');
insert into reply(repno,content,writer) values(1,'댓글12','홍길동');
insert into reply(repno,content,writer) values(1,'댓글13','이순신');
insert into reply(repno,content,writer) values(2,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(2,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(2,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(3,'댓글31','일지매');
insert into reply(repno,content,writer) values(3,'댓글32','홍길동');
insert into reply(repno,content,writer) values(3,'댓글33','이순신');
insert into reply(repno,content,writer) values(4,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(4,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(4,'댓글43','고길동');   
insert into reply(repno,content,writer) values(5,'댓글11','일지매');
insert into reply(repno,content,writer) values(5,'댓글12','홍길동');
insert into reply(repno,content,writer) values(5,'댓글13','이순신');
insert into reply(repno,content,writer) values(6,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(6,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(6,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(7,'댓글31','일지매');
insert into reply(repno,content,writer) values(7,'댓글32','홍길동');
insert into reply(repno,content,writer) values(7,'댓글33','이순신');
insert into reply(repno,content,writer) values(8,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(8,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(8,'댓글43','고길동');  

insert into reply(repno,content,writer) values(9,'댓글11','일지매');
insert into reply(repno,content,writer) values(9,'댓글12','홍길동');
insert into reply(repno,content,writer) values(9,'댓글13','이순신');
insert into reply(repno,content,writer) values(10,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(10,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(10,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(11,'댓글31','일지매');
insert into reply(repno,content,writer) values(11,'댓글32','홍길동');
insert into reply(repno,content,writer) values(12,'댓글33','이순신');
insert into reply(repno,content,writer) values(12,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(12,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(13,'댓글43','고길동'); 
insert into reply(repno,content,writer) values(13,'댓글11','일지매');
insert into reply(repno,content,writer) values(13,'댓글12','홍길동');
insert into reply(repno,content,writer) values(14,'댓글13','이순신');
insert into reply(repno,content,writer) values(14,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(14,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(15,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(15,'댓글31','일지매');
insert into reply(repno,content,writer) values(15,'댓글32','홍길동');
insert into reply(repno,content,writer) values(16,'댓글33','이순신');
insert into reply(repno,content,writer) values(16,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(16,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(16,'댓글43','고길동');   
insert into reply(repno,content,writer) values(5,'댓글11','일지매');
insert into reply(repno,content,writer) values(5,'댓글12','홍길동');
insert into reply(repno,content,writer) values(5,'댓글13','이순신');
insert into reply(repno,content,writer) values(6,'댓글21','임꺽정'); 
insert into reply(repno,content,writer) values(6,'댓글22','김기동'); 
insert into reply(repno,content,writer) values(6,'댓글23','고길동'); 
insert into reply(repno,content,writer) values(7,'댓글31','일지매');
insert into reply(repno,content,writer) values(7,'댓글32','홍길동');
insert into reply(repno,content,writer) values(7,'댓글33','이순신');
insert into reply(repno,content,writer) values(8,'댓글41','임꺽정'); 
insert into reply(repno,content,writer) values(8,'댓글42','김기동'); 
insert into reply(repno,content,writer) values(8,'댓글43','고길동'); 

select * from reply;

update board set readcount = 10 where no =1;
update board set readcount = 10 where no =2;
update board set readcount = 10 where no =3;
update board set readcount = 10 where no =4;
update board set readcount = 10 where no =6;
update board set readcount = 10 where no =7;
update board set readcount = 10 where no =9;
update board set readcount = 10 where no =10;
update board set readcount = 10 where no =11;
update board set readcount = 10 where no =12;
update board set readcount = 10 where no =13;
update board set readcount = 10 where no =14;
update board set readcount = 10 where no =15;


update board set favor = 10 where no =1;
update board set favor = 11 where no =2;
update board set favor = 12 where no =3;
update board set favor = 13 where no =4;
update board set favor = 10 where no =6;
update board set favor = 5 where no =7;
update board set favor = 10 where no =9;
update board set favor = 9 where no =10;
update board set favor = 5 where no =11;
update board set favor = 10 where no =12;
update board set favor = 10 where no =13;
update board set favor = 3 where no =14;
update board set favor = 10 where no =15;

select * from board;

#게시글번호, 제목, 내용, 작성자, 댓글내용, 읽은횟수, 좋아요 횟수,
#           등록일시,댓글 작성자,  댓글 내용, 댓글 등록 일시
 
select boardno,
       max(boardtitle) btitle,
       max(boardcontent)bcontent,
       max(boardwriter) bwriter,
       case max(boardreadcount) when 0 then '' else max(boardreadcount) end as bcount,
       case max(boardfavor) when 0 then '' else max(boardfavor) end favor,
       max(boardregdate) bregdate,
       case replyno when 0 then '' else replyno end as repno,
       max(replywriter) repwriter,
       max(replycontent) repcount,
       coalesce(max(replyregdate),'',max(replyregdate)) repregdate
from
(select no boardno, title boardtitle, content boardcontent, writer boardwriter,
               readcount boardreadcount, favor boardfavor, regdate boardregdate, 
	           0 replyno, '' replywriter,'' replycontent,
                null replyregdate
  from board  
	
    union # 합집합

select board.no boardno, '' boardtitle, '' boardcontent, '' boardwriter,
                 0 boardreadcount, 0 boardfavor, '' boardregdate, 
				 reply.no replyno,reply.writer replywriter,reply.content replycontent,
                reply.regdate replyregdate
  from board,
	   reply
 where board.no = reply.repno)a # sub쿼리- 다른쿼리의 부품
 group by boardno,replyno
 ;
 

