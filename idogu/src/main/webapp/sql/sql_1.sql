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
   m_tel varchar2(20) NOT NULL,
   m_email varchar2(50) NOT NULL,
   PRIMARY KEY (m_id)
);

drop table mem purge; 
drop table board purge;

-- board와 member 관계 설정
ALTER TABLE board
   ADD FOREIGN KEY (b_id)
   REFERENCES mem (m_id)
;

alter table board 
add foreign key(b_id)
references mem(m_id) 
on delete cascade;


insert into mem values(1, 1, 1, 1, 1);
insert into mem values('admin', 100, 100, 100, 100);

delete from mem where m_id = '1';
select * from mem where m_id = '1';
