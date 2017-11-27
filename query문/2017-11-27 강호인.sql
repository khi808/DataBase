# 게시글 테이블
create table board(
	no int primary key auto_increment,
    title varchar(50),
    content longtext,
    writer varchar(30),
    readcount int default 0,
    regdate datetime default current_timestamp,
    favor int default 0
);

desc board;
 
create table reply(
	no int primary key auto_increment,
    repno int,
    content text,
    writer varchar(30),
    regdate datetime default current_timestamp
);
  
desc reply; 
# 11-27 과제
# 1. 게시글 10개 입력 (insert)
insert into board(title,content,writer) 
	values('게시글1입니다','내용입니다!@#','글쓴이1');
insert into board(title,content,writer) 
	values('게시글2입니다','내용입니다!@#','글쓴이2');
insert into board(title,content,writer) 
	values('게시글3입니다','내용입니다!@#','글쓴이3');
insert into board(title,content,writer) 
	values('게시글4입니다','내용입니다!@#','글쓴이4');
insert into board(title,content,writer) 
	values('게시글5입니다','내용입니다!@#','글쓴이5');
insert into board(title,content,writer) 
	values('게시글6입니다','내용입니다!@#','글쓴이6');
insert into board(title,content,writer) 
	values('게시글7입니다','내용입니다!@#','글쓴이7');
insert into board(title,content,writer) 
	values('게시글8입니다','내용입니다!@#','글쓴이8');
insert into board(title,content,writer) 
	values('게시글9입니다','내용입니다!@#','글쓴이9');
insert into board(title,content,writer) 
	values('게시글10입니다','내용입니다!@#','글쓴이10');
select * from board;
# 2. 댓글 1게시글당 1~3개씩 입력. (insert)
insert into reply(repno, content, writer)
	values(1,'댓글1','댓글쓴이1');
insert into reply(repno, content, writer)
	values(2,'댓글2','댓글쓴이2');
insert into reply(repno, content, writer)
	values(2,'댓글3','댓글쓴이4');
insert into reply(repno, content, writer)
	values(3,'댓글4','댓글쓴이3');
insert into reply(repno, content, writer)
	values(3,'댓글5','댓글쓴이6');
insert into reply(repno, content, writer)
	values(4,'댓글6','댓글쓴이8');
insert into reply(repno, content, writer)
	values(5,'댓글72','댓글쓴이7');
insert into reply(repno, content, writer)
	values(6,'댓글8123','댓글쓴이10');
insert into reply(repno, content, writer)
	values(6,'댓글934','댓글쓴이5');
insert into reply(repno, content, writer)
	values(7,'댓글01','댓글쓴이5');
insert into reply(repno, content, writer)
	values(8,'댓글091','댓글쓴이9');
insert into reply(repno, content, writer)
	values(9,'댓글3421','댓글쓴이1');
insert into reply(repno, content, writer)
	values(10,'댓글133','댓글쓴이3');
select * from reply;
# 3. 게시글의 좋아요 칼럼에 10~15씩 카운트 입력 (update)
update board set favor = 11 where no = 1;
update board set favor = 10 where no = 2;
update board set favor = 13 where no = 3;
update board set favor = 12 where no = 4;
update board set favor = 13 where no = 5;
update board set favor = 14 where no = 6;
update board set favor = 10 where no = 7;
update board set favor = 15 where no = 8;
update board set favor = 12 where no = 9;
update board set favor = 11 where no = 10;
# 4. 게시글의 readcount 3~10씩 카운트 입력 (update)
update board set readcount = 5 where no = 1;
update board set readcount = 4 where no = 2;
update board set readcount = 3 where no = 3;
update board set readcount = 7 where no = 4;
update board set readcount = 9 where no = 5;
update board set readcount = 6 where no = 6;
update board set readcount = 4 where no = 7;
update board set readcount = 3 where no = 8;
update board set readcount = 5 where no = 9;
update board set readcount = 10 where no = 10;
# 5. 출력: 게시글번호, 제목, 내용, 작성자, 읽은 횟수, 좋아요 횟수,
# 		    등록일시, 댓글 작성자, 댓글 내용, 댓글 등록 일시
select b.no as '게시글번호', title '제목', b.content '내용',
	   b.writer '작성자', readcount '읽은 횟수',
	   favor '좋아요', b.regdate '등록일시', r.writer '댓글작성자',
       r.content '댓글 내용', r.regdate '댓글 등록일시'
  from board b, reply r
 where b.no = r.repno;
