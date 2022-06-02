CREATE TABLE t_board (
    no  number(5) primary key,
    title varchar2(200) not null,
    writer varchar2(50) not null,
    content varchar2(4000) not null,
    view_cnt  number(5) default 0,
    reg_date date default sysdate

);

CREATE sequence seq_t_board_no;


-- 1������ ���������� �̰� ���� ��!


SELECT *
FROM t_board;

insert into t_board(no, title, writet, content) values(seq_t_board_no.nextval, '�����Դϴ�!', 'ȫ�浿', '�����Դϴ�!');
insert into t_board(no, title, writet, content) values(seq_t_board_no.nextval, '�����Դϴ�##', 'ȫ�浿', '�����Դϴ�##');


commit;

ALTER TABLE t_board RENAME COLUMN writet to writer;

commit;