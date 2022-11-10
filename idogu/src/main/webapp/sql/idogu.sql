/* 회원 */
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

SELECT * FROM mem;



/* 공지사항 게시판 */
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

SELECT * FROM notice;



/* Create Foreign Keys */
ALTER TABLE notice
   ADD FOREIGN KEY (m_id)
   REFERENCES mem (m_id)
;



/* Drop Tables */
DROP TABLE mem CASCADE CONSTRAINTS;
DROP TABLE Notice CASCADE CONSTRAINTS;