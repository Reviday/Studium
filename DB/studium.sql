

/*
[ù ȸ������ �� - 1��]
- ȸ�� ���̵�
- ȸ�� ��й�ȣ
- ȸ�� �̸�
- ȸ�� �������
- ȸ�� ����

[ù ȸ�����Խ� - 2��]
- ȸ�� �̸��� 
- ȸ�� ��й�ȣ
(- ȸ�� �г���&�̸�)
 => �� �� ������ �߰����� �Է�����
    ù ȸ�� ���Խ� �Է¹޴� �����鸸 ��(not null ����)

[���͵� �̿�� �߰� ���� �Է� => 1,2�� �� ������ ������]
- 

*/

drop table ta_member;
drop sequence mem_seq;
update ta_member set mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==';
insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','������','M','1990/01/01','','M',99999999,'A','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');

-- ��¥ ���������� �������� �ٲ۴�. ex) 2019.01.01 13:00:00
-- �Ʒ��� �������� ������ Studium ������Ʈ���� ���Ǵ� ��¥ ���������� ����� �� ����.
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 


/*�ش� ������ ��� ���̺� �ʿ��� ������ */
create table ta_member ( -- ȸ������ ���̺�(���: ���� ù ȸ�����Խ� �ݵ�� �Է¹��� ����)
    mem_no number constraint mem_no_pk primary key, -- ȸ���ѹ�(�������ѹ��� �ο�)
--  mem_userid varchar2(20) constraint mem_userid_nn not null constraint mem_userid_uq unique, -- ȸ�� ID(��) 
    mem_email varchar2(30) not null, -- ȸ�� �̸���(�߰����� or ù ���Խ�)
    mem_password varchar2(300) constraint mem_password_nn not null , -- ȸ�� psssword(��)
    mem_name varchar2(50) constraint mem_name_nn not null, -- ȸ�� �̸�(��)
    mem_code char(1) constraint mem_code_ck check (mem_code in ('M','T','R','A')), -- ȸ�����(Manager, Teacher, Regular, Associate)
    mem_birth date, -- ȸ�� �������(��)
    mem_phone varchar2(11), -- ȸ�� ��ȭ��ȣ(���� ��� ����ȭ/ '-' ���� �Է¹޴´�.),
    mem_gender char(1) default 'U' constraint mem_gender_ck check (mem_gender in ('M','F','U')), -- ȸ�� ����(��)(U-Undefined)
    mem_point number default 0, -- ȸ�� ����Ʈ
    mem_category1 varchar2(30), -- ȸ�� ��ȣ ī�װ�(�ִ� 3��)
    mem_category2 varchar2(30), 
    mem_category3 varchar2(30), 
    
    -- ���ּ� �Է� API ����, 2~3�� // ������ 1���� 
    mem_zipcode varchar2(10), -- �����ȣ (�ڸ����� �����ؼ� 10)
    mem_address1 varchar2(100), -- ȸ�� �ּ� �պκ�
    mem_address2 varchar2(100), -- ȸ�� ���ּ�
    -----------------------------
    
    -- ���ϴ� �ΰ�����
    mem_receive_email char(1) default 'N' constraint mem_receive_email_ck check (mem_receive_email in ('Y','N')), -- �̸��� ���ſ���(�⺻�� N)
    mem_use_note char(1) default 'N' constraint mem_use_note_ck check (mem_use_note in ('Y','N')), -- ���� ��뿩��(�⺻�� N)
    mem_receive_sms char(1) default 'N' constraint mem_receive_sms_ck check (mem_receive_sms in ('Y','N')), -- ���� ���� ����(�⺻�� N)
    mem_open_profile char(1) default 'N' constraint mem_open_profile_ck check (mem_open_profile in ('Y','N')), -- ������ ���� ����(�⺻�� N)
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N')), -- �ش� ȸ�� ���� ����(�⺻�� N)
    mem_email_cert char(1) default 'N' constraint mem_email_cert_ck check (mem_email_cert in ('Y','N')), -- �̸��� ���� ����(�⺻�� N)
    mem_enroll_datetime date , -- ȸ�� ������(�ð� ����)
    mem_enroll_ip varchar2(20), -- ȸ�� ���� ip(ip �޾ƿ��°� �����ϸ� ������ ����)
    mem_lastlogin_datetime date , -- ������ ������ 
    mem_lastlogin_ip varchar2(20), -- ������ ���� ip
    mem_profile_content varchar2(300), -- �ڱ�Ұ�(�����ʿ�, 100��)
    mem_adminmemo varchar2(1000),   -- ȸ���� ���� �����ڿ� �޸�
--  mem_following number default 0, -- ģ����
--  mem_followed number default 0, -- ȸ���� ģ���� ����� ȸ�� �� => �̰� ���� ���̺� ���� �ϴ°� ������ �ϴ�.
    mem_icon varchar2(1000), -- ȸ�� ������ ���(��� ����Ҷ� �̹��� ����?, ��θ� ��� ���� ������ �־������ ���� 1000)
    mem_photo varchar2(1000) -- ȸ�� ������ ���� ���
);


/* ȸ���ѹ��� ������ */
create sequence mem_seq 
start with 10000
increment by 1
maxvalue 999999;


select * from ta_member;
update ta_member set mem_email='admin@studium.com';
commit;
select * from ta_member where mem_email='admin@studium.com' and mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==';
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '�ƹ���','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '�ƹ���','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');
/*
���̺��̸� (tb_board)
1. ������ȣ(b_idx) : �ڵ������� ����� ���� ȸ���� ������ȣ
2. �ۼ�����ȣ(b_num) : �� ������ ǥ���ϱ� ���� ��ȣ
3. ��ۼ����� �ܰ�(b_reply) : ��۵��� ���� �� �ܰ踦 ���� ����, 3�ܰ���� �����ϰ� ��, (A-Z)���� 26������ ��� ����
4. �۾��� ���̵�(m_id) : �۾����� ���̵� ����մϴ�.
5. �۾��� �̸�(m_name) : �۾����� �̸��� ����մϴ�.
6. ��������(b_title) : �������Դϴ�.(255�ڱ��� ����)
7. �۳���(b_contents)
8. �ۼ��Ͻ�(b_regdate)

*/

/*
- �Խ���(���θ���(�������°Խ���), ��������(��ũ), ��������(�����Խ���))

  �Խù� ��ȣ(primary key), ī�װ�, ����, ����, �ۼ���, ��ȸ��, 

  �ۼ���¥, (��õ), ��۳���, ��������
*/


/* �Խñۿ� ���̺�*/
/*
 ��� �ִ� �Խ��� ��������? 
 �Խ��Ǹ��� �� ���� ���̺��� �ο�?
 
 Q) �Խñۿ� �̹����� ������ ���, ��� ó���ؾ��ϴ���?
*/

-- ���θ���(or Ǯ�̸���)
/* �۾��̰� ������ Ż���Ѵٰ� �Խñ��� �����Ǵ� ��쵵 �幰�⿡ �ܷ�Ű ���� �� �� */
create table ta_qborad(
    board_no number constraint board_no_pk primary key, -- �۹�ȣ
    board_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    /* 0������ ���������� �ο�, board_no�� ������������ �����س��� ���¸�,
    board_order�� ������������ 2�� �����ϸ� ���ϴ� �� ������ ��µȴ�.
    board_order�� 0�� �ƴ� ���� ��۷� �Ǵ��ϸ� �� ��.*/
    board_writer_id varchar2(20), -- �۾��� ���̵�
    board_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    board_title varchar2(100) constraint board_title_nn not null, -- �� ����
    board_content clob constraint board_content_nn not null, -- �� ����
    board_register_datetime date, -- �� �ۼ� �Ͻ�
--  board_register_ip varchar2(20) -- �� �ۼ� ip �ּ�
    board_rec_count number default 0, -- �� ��õ ��(recommand)
    board_fork_count number default 0, -- �� ��ũ �� 
    board_que_count number default 0 -- �� Ǯ�� ��
);


-- ��������
create table ta_share_madang(
    madang_no number constraint smadang_no_pk primary key, -- �۹�ȣ
    madang_parent number default null, -- ����� �޾��� ��, ������ �۹�ȣ�� ����
    madang_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint smadang_title_nn not null, -- �� ����
    madang_content clob constraint smadang_content_nn not null, -- �� ����
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_fork_count number default 0, -- �� ��ũ ��    
    madang_file_presence char(1) default 'N' constraint smadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint smadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint smadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);


-- ��������(��ũ ����)
create table ta_free_madang(
    madang_no number constraint fmadang_no_pk primary key, -- �۹�ȣ
    madang_parent number default null, -- ����� �޾��� ��, ������ �۹�ȣ�� ����
    madang_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint fmadang_title_nn not null, -- �� ����
    madang_content clob constraint fmadang_content_nn not null, -- �� ����
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_file_presence char(1) default 'N' constraint fmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint fmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint fmadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);
drop table ta_free_madang;
drop sequence fboard_seq;

/* �Խñ۳ѹ��� ������ */

-- ���θ���(Ǯ�̸���)
create sequence qboard_seq 
start with 1
increment by 1
maxvalue 999999;

-- ��������
create sequence sboard_seq 
start with 1
increment by 1
maxvalue 999999;

-- ��������
create sequence fboard_seq 
start with 1
increment by 1
maxvalue 999999;


select * from ta_free_madang;
select * from ta_free_madang where madang_status='Y' ORDER BY DECODE(madang_parent,NULL,madang_no,madang_parent) DESC, madang_no DESC;
SELECT * FROM TA_FREE_MADANG WHERE MADANG_STATUS='Y' ORDER BY DECODE(MADANG_PARENT,NULL,MADANG_NO,MADANG_PARENT) DESC, MADANG_NO DESC;
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.1', '�׽�Ʈ �� �Դϴ�.1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.2', '�׽�Ʈ �� �Դϴ�.2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.3', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.4', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.5', '�׽�Ʈ �� �Դϴ�.4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.6', '�׽�Ʈ �� �Դϴ�.5',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.7', '�׽�Ʈ �� �Դϴ�.6',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8', '�׽�Ʈ �� �Դϴ�.7',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.9', '�׽�Ʈ �� �Դϴ�.8',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10', '�׽�Ʈ �� �Դϴ�.10',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.11', '�׽�Ʈ �� �Դϴ�.11',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.12', '�׽�Ʈ �� �Դϴ�.12',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.13', '�׽�Ʈ �� �Դϴ�.13',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.14', '�׽�Ʈ �� �Դϴ�.14',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.15', '�׽�Ʈ �� �Դϴ�.15',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.16', '�׽�Ʈ �� �Դϴ�.16',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.17', '�׽�Ʈ �� �Դϴ�.17',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.18', '�׽�Ʈ �� �Դϴ�.18',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.19', '�׽�Ʈ �� �Դϴ�.19',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.20', '�׽�Ʈ �� �Դϴ�.20',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.21', '�׽�Ʈ �� �Դϴ�.21',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.22', '�׽�Ʈ �� �Դϴ�.22',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.23', '�׽�Ʈ �� �Դϴ�.23',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.24', '�׽�Ʈ �� �Դϴ�.24',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.25', '�׽�Ʈ �� �Դϴ�.25',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.26', '�׽�Ʈ �� �Դϴ�.26',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.27', '�׽�Ʈ �� �Դϴ�.27',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.28', '�׽�Ʈ �� �Դϴ�.28',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.29', '�׽�Ʈ �� �Դϴ�.29',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.30', '�׽�Ʈ �� �Դϴ�.39',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, 8, 1,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���1', '�׽�Ʈ �� �Դϴ�.8-���1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 2,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���2', '�׽�Ʈ �� �Դϴ�.8-���2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 3,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���3', '�׽�Ʈ �� �Դϴ�.8-���3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 4,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���4', '�׽�Ʈ �� �Դϴ�.8-���4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 1,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���1', '�׽�Ʈ �� �Դϴ�.10-���1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 2,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���2', '�׽�Ʈ �� �Դϴ�.10-���2',sysdate, null, default,default, default, default, default, default);
commit;


insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.1', '�׽�Ʈ �� �Դϴ�.1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.2', '�׽�Ʈ �� �Դϴ�.2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.3', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.4', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.5', '�׽�Ʈ �� �Դϴ�.4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.6', '�׽�Ʈ �� �Դϴ�.5',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.7', '�׽�Ʈ �� �Դϴ�.6',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8', '�׽�Ʈ �� �Դϴ�.7',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.9', '�׽�Ʈ �� �Դϴ�.8',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10', '�׽�Ʈ �� �Դϴ�.10',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.11', '�׽�Ʈ �� �Դϴ�.11',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.12', '�׽�Ʈ �� �Դϴ�.12',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.13', '�׽�Ʈ �� �Դϴ�.13',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.14', '�׽�Ʈ �� �Դϴ�.14',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.15', '�׽�Ʈ �� �Դϴ�.15',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.16', '�׽�Ʈ �� �Դϴ�.16',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.17', '�׽�Ʈ �� �Դϴ�.17',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.18', '�׽�Ʈ �� �Դϴ�.18',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.19', '�׽�Ʈ �� �Դϴ�.19',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.20', '�׽�Ʈ �� �Դϴ�.20',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.21', '�׽�Ʈ �� �Դϴ�.21',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.22', '�׽�Ʈ �� �Դϴ�.22',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.23', '�׽�Ʈ �� �Դϴ�.23',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.24', '�׽�Ʈ �� �Դϴ�.24',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.25', '�׽�Ʈ �� �Դϴ�.25',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.26', '�׽�Ʈ �� �Դϴ�.26',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.27', '�׽�Ʈ �� �Դϴ�.27',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.28', '�׽�Ʈ �� �Դϴ�.28',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.29', '�׽�Ʈ �� �Դϴ�.29',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.30', '�׽�Ʈ �� �Դϴ�.39',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, 8, 1,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���1', '�׽�Ʈ �� �Դϴ�.8-���1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 2,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���2', '�׽�Ʈ �� �Դϴ�.8-���2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 3,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���3', '�׽�Ʈ �� �Դϴ�.8-���3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 4,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���4', '�׽�Ʈ �� �Դϴ�.8-���4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 1,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���1', '�׽�Ʈ �� �Դϴ�.10-���1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 2,'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���2', '�׽�Ʈ �� �Դϴ�.10-���2',sysdate, null, default,default, default, default, default, default, default);
commit;



create table free_madang_file (
    fmf_no number fmf_id_pk primary key,-- ���� ��ȣ 
    madang_no number constraint madang_no_fk references ta_free_madang(madang_no), -- ����� ��ȣ
    member_no number constraint member_no_fk references ta_member(mem_no), -- ȸ�� ��ȣ
    fmf_original_filename varchar2(100), -- ���� ���ε�� ���� ���ϸ�
    fmf_rename_filename varchar2(100), -- ���� ���ε�� ������ ����� ���ϸ�
    fmf_download_count number, -- �ٿ�ε� ȸ��
    fmf_filesize number, -- ���� ũ��
    fmf_is_image char(1) default 'N' constraint fmf_is_image_ck check(fmf_is_image in ('Y','N')), -- �̹������� ����
    fmf_width number default null, -- �̹����� ��� �̹��� ���ΰ�
    fmf_height number default null, -- �̹����� ��� �̹��� ���ΰ�
    fmf_type varchar2(20), -- ���� Ȯ����
    fmf_datetime date, -- �������
    fmf_ip varchar2(20) -- ��� ip
);






-- ��� ���̺�

-- ���θ��� ��� ���̺�
-- ��� ��ȣ�� �������� �ʿ��ҵ�. 
-- �Խñ� ���� �� ��, �������� ����?
/*
    ���/����, ���� ���� ���
    1. parent�� null�� ���, cmt_no�� ������ �Ѵ�.
    2. parent�� null�� �ƴ� ���, parent�� �����Ѵ�.
    3. ù��° ���� ���ǿ��� ���� ���� ��� cmt_seq�� �����Ѵ�.
*/
create table ta_qboard_rep (
    board_no number constraint board_no_fk references ta_qborad(board_no), -- �Խñ� ��ȣ(�ܷ�Ű)
    cmt_no number constraint cmt_no_pk primary key, -- ��� ��ȣ(������)
    cmt varchar2(1000), -- ��� ����(�ִ� 300�ڱ��� ���� ����)
    parent number default null, -- ������ ��� ���Ǵ� ����, null�̸� �⺻���, ���� ������ ���� parent�� ���� �θ� ����� cmt_no
    cmt_seq number default 0 --�θ����� seq���� �⺻������ 0�� �ο�, ���� ������� 1,2,3 ... �ο�
);

-- �������� ��� ���̺�
create table ta_sboard_rep (
    board_no number constraint board_no_fk references ta_qborad(board_no), -- �Խñ� ��ȣ(�ܷ�Ű)
    cmt_no number constraint cmt_no_pk primary key, -- ��� ��ȣ(������)
    cmt varchar2(1000), -- ��� ����(�ִ� 300�ڱ��� ���� ����)
    parent number default null, -- ������ ��� ���Ǵ� ����, null�̸� �⺻���, ���� ������ ���� parent�� ���� �θ� ����� cmt_no
    cmt_seq number default 0 --�θ����� seq���� �⺻������ 0�� �ο�, ���� ������� 1,2,3 ... �ο�
);

-- �������� ��� ���̺�
create table ta_fmadang_rep (
    madang_no number constraint madang_no_fk references ta_free_madang(madang_no), -- �Խñ� ��ȣ(�ܷ�Ű)
    cmt_no number constraint cmt_no_pk primary key, -- ��� ��ȣ(������)
    cmt varchar2(1000), -- ��� ����(�ִ� 300�ڱ��� ���� ����)
    parent number default null, -- ������ ��� ���Ǵ� ����, null�̸� �⺻���, ���� ������ ���� parent�� ���� �θ� ����� cmt_no
    cmt_seq number default 0 --�θ����� seq���� �⺻������ 0�� �ο�, ���� ������� 1,2,3 ... �ο�
);

/*
������ ������ JDBC�� ����

-- ��� �ִ�ġ 9999
-- ����� �������� [�Խ������̺�]_rep_[�Խñ۹�ȣ]_seq �������� ����
create sequence qboard_rep_1_seq 
start with 1
increment by 1
maxvalue 9999;

-- ���� �ִ�ġ 999
-- ������ �������� [�Խ������̺�]_rep_[�Խñ۹�ȣ]_[parent]_req
create sequence qboard_rep_1_2_seq 
start with 1
increment by 1
maxvalue 999;

*/




-- �׽�Ʈ �׽�Ʈ!

-- ��� �ִ�ġ 9999
-- ����� �������� [�Խ������̺�]_rep_[�Խñ۹�ȣ]_seq �������� ����
create sequence qboard_rep_1_seq 
start with 1
increment by 1
maxvalue 9999;

-- ���� �ִ�ġ 999
-- ������ �������� [�Խ������̺�]_rep_[�Խñ۹�ȣ]_[parent]_req
create sequence qboard_rep_1_2_seq 
start with 1
increment by 1
maxvalue 999;

DROP sequence qboard_rep_1_seq;
DROP sequence qboard_rep_1_2_seq;

insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '�ȳ��ϼ���!!!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '�߳� �ݰ�����',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '��������!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '�̰� �����̿���!',2 , qboard_rep_1_2_seq.NEXTVAL);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '�׷�����! ���� �̱���!',2 , qboard_rep_1_2_seq.NEXTVAL);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM! ����1',4 , 1);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM! ����2',4 , 2);

SELECT * FROM ta_qboard_rep;

SELECT *
FROM ta_qboard_rep
ORDER BY DECODE(parent,NULL,cmt_no,parent), cmt_seq;

SELECT * FROM TABS;
SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM TA_FREE_MADANG WHERE MADANG_STATUS='Y' ORDER BY DECODE(MADANG_PARENT,NULL,MADANG_NO,MADANG_PARENT) DESC, MADANG_NO) A) WHERE RNUM BETWEEN 1 AND 10; 