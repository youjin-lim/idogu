
/*게시판 */
CREATE TABLE board(
   b_num  number NOT NULL,
   b_sub varchar2(50) NOT NULL,
   b_content varchar2(1000) NOT NULL,
   b_date date DEFAULT sysdate,
   b_readcount number,
   b_pw varchar2(20), 
   b_id varchar2(20) NOT NULL,
   b_re_ref number,
   b_re_lev number,
   b_re_seq number,
   PRIMARY KEY (b_num)
);


select * from mem;
select * from board;


alter table board 
add foreign key(b_id)
references mem(m_id) 
on delete cascade;

select * from mem;

drop table book purge


/*공지사항*/


CREATE TABLE notice
(
   n_num number(10) NOT NULL,
   m_id varchar2(20) NOT NULL,
   n_sub varchar2(50) NOT NULL,
   n_content varchar2(1000) NOT NULL,
   n_file varchar2(50),
   n_readcount number,
   n_date date DEFAULT sysdate,
   PRIMARY KEY (n_num)
);

drop table book purge;


CREATE TABLE book
(
   -- 예약번호 
   k_num number NOT NULL ,
   -- 예약 날짜 
   r_num number NOT NULL,
   -- 금액 
   k_in varchar2(30),
   k_out varchar2(30),
   k_dog varchar2(50),
   k_dogname varchar2(50),
   k_age varchar2(50),
   k_kg number,
 k_small number default 0,
 k_medium number default 0,
 k_big number default 0,
 k_total number,
k_course varchar2(100),
k_content varchar2(500),
 m_id varchar2(20) NOT NULL,
   PRIMARY KEY (k_num)
)

alter table book modify k_content varchar2(500) default ' ';

drop table book purge;

select * from board;

insert into book values(1,101,'11/20','11/22','푸들','콩순이','3',5,1,0,0,75000,'산책 간식','따듯한물 주세요','korea');


CREATE TABLE room
(
   -- 룸 리스트 식별자 
   r_num number NOT NULL,
   r_name varchar2(50) NOT NULL,
   r_cost number DEFAULT 0,
   r_content varchar2(1000) NOT NULL,
   r_count number(5),
   PRIMARY KEY (r_num)
)

drop table room purge;
select * from mem;

insert into room values(1,'디럭스', 50000,'중/소형견 전용',3);
insert into room values(2,'슈퍼리어', 70000,'중/소형견 전용', 3);
insert into room values(3,'스위트',100000,'대형견 전용', 3);
insert into room values(4,'로얄 스위트', 150000,'대형/중소형 모두 가능',3);

select * from room;
delete from room where r_num = 5;

