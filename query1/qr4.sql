create user myuser01@'%' identified by 'myuser01';
grant select,insert,update,delete on myworld.emp to myuser01@localhost identified by 'myuser01';
 flush privileges;
 grant all on myworld.emp to myuser01@localhost identified by 'myuser01';
 flush privileges;
 revoke select on myworld.emp from myuser01@localhost;
 revoke all on myworld.emp from myuser01@localhost;
flush privileges;

show grants for myuser01@localhost;
##
 select * from sample412;
#+----+------+------------+
#| no | a    | b          |
#+----+------+------------+
#|  3 | def  | 2017-11-24 |
#|  6 | ABC  | 2017-11-24 |
#|  8 | def  | 2017-11-24 |
#| 10 | def  | 2017-11-24 |
#| 12 | def  | 2017-11-24 |
#| 14 | def  | 2017-11-24 |
#+----+------+------------+
#6 rows in set (0.02 sec)

# MySql은 서로 다른 session으로 접속하더라도
# 테이블의  변경내용을 commit; 전에 조회가능하다.
# Oracle이나 다른 DBMS처럼
# thread-safe하게 처리하기위해서는
# 작업하기 전에 start transaction 처리를 하고
# 변경 작업 완료 후 commit;을
# 하면 다른 session에서도 변경사항을 조회 할수 있다.
 
 start transaction;
 
 update sample412
    set a='XXX'
  where no = 3;

 select * from sample412;

 commit;
