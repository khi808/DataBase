# 1.category
insert into category(catid,categoryname)
      values(1,'식품');
insert into category(catid,categoryname)
      values(2,'생활용품');
select * from category;     
      
# 2.maker
insert into maker(makercd,name) 
values(5001,'농심');
insert into maker(makercd,name) 
values(6001,'휘슬러');
insert into maker(makercd,name)
values(7001,'부루스타');
select * from maker;
# 3.goods
#칼럼명 변경 - 
alter table goods change priccate price int;
alter table goods change egory category int;
#상품정보 입력
insert into goods(id,name,price,category,maker_makercd)
values(1001,'새우깡',1000,1,5001);
insert into goods(id,name,price,category,maker_makercd)
values(1002,'감자깡',1000,1,5001);
insert into goods(id,name,price,category,maker_makercd)
values(1003,'고구마깡',1000,1,5001);
insert into goods(id,name,price,category,maker_makercd)
values(1004,'냄비',5000,2,6001);
insert into goods(id,name,price,category,maker_makercd)
values(1005,'젓가락',1000,2,6001);
insert into goods(id,name,price,category,maker_makercd)
values(1006,'휴대용버너',20000,2,7001);

select * from goods;

# 4.stock
insert into stock(goods_id,seq,stockday,qty) values(1001,1,'2017-06-05',100);
insert into stock(goods_id,seq,stockday,qty) values(1002,1,'2017-06-06',50);
insert into stock(goods_id,seq,stockday,qty) values(1003,1,'2017-06-07',200);
insert into stock(goods_id,seq,stockday,qty) values(1004,1,'2017-05-05',50);
insert into stock(goods_id,seq,stockday,qty) values(1005,1,'2017-06-09',300);
insert into stock(goods_id,seq,stockday,qty) values(1006,1,'2017-06-10',100);
insert into stock(goods_id,seq,stockday,qty) values(1002,1,'2017-06-12',107);
insert into stock(goods_id,seq,stockday,qty) values(1003,1,'2017-06-13',108);
insert into stock(goods_id,seq,stockday,qty) values(1005,1,'2017-08-10',300);
insert into stock(goods_id,seq,stockday,qty) values(1006,2,'2017-08-12',100);
insert into stock(goods_id,seq,stockday,qty) values(1006,3,'2017-08-12',100);

select * from stock;
truncate table stock;
alter table stock drop primary key;

alter table stock add constraint pkey_stock primary key(goods_id,seq,stockday);

# 집계상태의 데이타를 볼경우 - 집계함수, sum(),avg(),max(),min() - group by 기준;
# 세부항목의 데이타를 볼겨우 
# 상품코드(기준), 상품명, 제조사명, 가격, 전체재고 -집계(sum)
create view goodsinf as
select goods.id '상품코드',
       max(goods.name) '상품명',
       max(maker.name) '제조사명',
       max(goods.price) '가격',
       sum(qty) '전체재고'
  from goods,
       maker,
	   stock
 where goods.id = stock.goods_id
   and goods.maker_makercd = maker.makercd
 group by goods.id # 집계기준 
 ;
  
#view - 데이타가 없는 가상의 테이블
# - 자주조회하는 데이타쿼리를 미리 만들어서 사용하면 편리.
# 보안
select   * from goodsinf;

# create view 뷰명 as select 문;
create view goodsInfoDetail as
select goods.id '상품코드',
       goods.name '상품명',
       maker.name'제조사명',
       goods.price '가격',
       qty '재고'
  from goods,
       maker,
	   stock
 where goods.id = stock.goods_id
   and goods.maker_makercd = maker.makercd
 ;
 
 select * from goodsINfoDetail;
 
 # view의 용도
 create view empInfo as
 select emp.empno,
        emp.ename,
        dept.deptname
   from emp,
        dept
 where emp.deptno = dept.deptno
 ;
 
 # 보여주기 어려운 항목들을 제외한 나머지 항목으로
 # view를 만들어 보여줌.
 select * from empInfo;
 

 
 
   
   
   
   
   
   


