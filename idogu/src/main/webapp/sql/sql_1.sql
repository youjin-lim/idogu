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
   PRIMARY KEY (b_num )
);


CREATE TABLE mem(
   m_id varchar2(20) NOT NULL,
   m_pw varchar2(20) NOT NULL,
   m_name varchar2(30) NOT NULL,
   m_tel number(20) NOT NULL,
   m_email varchar2(50) NOT NULL,
   PRIMARY KEY (m_id)
);

-- board와 member 관계 설정
ALTER TABLE board
   ADD FOREIGN KEY (b_id)
   REFERENCES mem (m_id)
;

