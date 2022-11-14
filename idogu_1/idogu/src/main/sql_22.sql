
/* Drop Tables */

DROP TABLE board CASCADE CONSTRAINTS purge;
DROP TABLE book CASCADE CONSTRAINTS purge;
DROP TABLE room CASCADE CONSTRAINTS purge;
DROP TABLE mem CASCADE CONSTRAINTS purge;
DROP TABLE notice CASCADE CONSTRAINTS purge;

drop table board ;



/* Create Tables */

CREATE TABLE board
(
   -- 게시글 기본 넘버 
   b_num  number NOT NULL,
   -- 커뮤니티 글 제목 
   b_sub varchar2(50) NOT NULL,
   -- 커뮤니티 내용 
   b_content varchar2(1000) NOT NULL,
   --  커뮤니티 게시글 작성 날짜 
   b_date date DEFAULT sysdate,
   b_readcount number,
   -- 회원 아이디 
   m_id varchar2(20) NOT NULL,
   b_re_ref number,
   b_re_lev number,
   b_re_seq number,
   PRIMARY KEY (b_num )
);

select * from board;

CREATE TABLE book
(
   -- 예약번호 
   k_num number NOT NULL,
   -- 예약 날짜 
   k_date date NOT NULL,
   -- 금액 
   k_cost number,
   k_content varchar2(500),
   k_dog varchar2(50),
   k_kg number,
   K_cos varchar2(100),
   K_dogname varchar2(50),
   K_age number,
   -- 카페 리스트 식별자 
   r_num number NOT NULL,
   PRIMARY KEY (k_num)
);


CREATE TABLE mem
(
   -- 회원 아이디 
   m_id varchar2(20) NOT NULL,
   -- 맴버 비밀번호 
   m_pw varchar2(20) NOT NULL,
   -- 사용자 이름 
   m_name varchar2(30) NOT NULL,
   -- 전화번호 
   m_tel number(20) NOT NULL,
   -- 이메일
   m_email varchar2(50) NOT NULL,
   PRIMARY KEY (m_id)
);

select * from mem;

insert into mem (m_id, m_pw, m_name, m_tel, m_email)  values('korea' , '123' ,'홍길동', '01077777777', 'ko_aver.com');

insert into mem 





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




CREATE TABLE room
(
   -- 룸 리스트 식별자 
   r_num number NOT NULL,
   r_name varchar2(50) NOT NULL,
   r_content varchar2(1000) NOT NULL,
   -- 추천수 
   r_cost number DEFAULT 0,
   -- 회원 아이디 
   m_id varchar2(20) NOT NULL,
   PRIMARY KEY (r_num)
);



/* Create Foreign Keys */

ALTER TABLE board
   ADD FOREIGN KEY (m_id)
   REFERENCES mem (m_id)
;


ALTER TABLE room
   ADD FOREIGN KEY (m_id)
   REFERENCES mem (m_id)
;


ALTER TABLE book
   ADD FOREIGN KEY (r_num)
   REFERENCES room (r_num)
;


ALTER TABLE notice
   ADD FOREIGN KEY (m_id)
   REFERENCES mem (m_id)
;



alter table mem modify m_tel varchar2(20);

delete from mem where m_id = 'korea';
