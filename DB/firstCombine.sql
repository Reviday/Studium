-- ���̺�/������ �� ���� �ʱ�ȭ �ܰ�
drop sequence FBOARD_SEQ;
drop sequence TA_SIDEMENU_SEQ;
drop sequence STM_LIKE_SEQ;
drop sequence STMADANG_CMT_SEQ;
drop sequence FMADANG_CMT_SEQ;
drop sequence SMADANG_SEQ;
drop sequence MLL_SEQ;
drop sequence SMADANG_CMT_SEQ;
drop sequence STMADANG_QUESTION_SEQ;
drop sequence BMADANG_SEQ;
drop sequence STMADANG_SEQ;
drop sequence BMADANG_CMT_SEQ;
drop sequence MEM_SEQ;
drop sequence FMADANG_SEQ;
drop table TA_MEMBER_LOGIN_LOG;
drop table TA_SIDEMENU_ELEMENTS;
drop table TA_STMADANG_CMT;
drop table TA_FMADANG_CMT;
drop table TA_FREE_MADANG;
drop table TA_STUDY_MADANG_QUESTION;
drop table TA_STUDY_MADANG CASCADE CONSTRAINT;
drop table TA_STMADANG_LIKE;
drop table TA_FMADANG_REP;
drop table TA_SMADANG_REP;
drop table TA_BOAST_MADANG CASCADE CONSTRAINT;
drop table TA_SHARE_MADANG CASCADE CONSTRAINT;
drop table TA_BMADANG_CMT;
drop table TA_SMADANG_CMT;
drop table TA_MEMBER;




-- ��¥ ���������� �������� �ٲ۴�. ex) 2019.01.01 13:00:00
-- �Ʒ��� �������� ������ Studium ������Ʈ���� ���Ǵ� ��¥ ���������� ����� �� ����.
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 




-- ���̺� �� ������ ����
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
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N','P')), -- �ش� ȸ�� ���� ����(�⺻�� N/ �������� P) 
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
    mem_photo varchar2(1000), -- ȸ�� ������ ���� ���
    mem_status char(1) default 'Y' constraint mem_status_ck check (mem_status in ('Y','N')), -- ȸ�� ���� ����
    mem_withdrawal_date date default null, -- ȸ�� Ż�� �Ͻ�
    mem_denied_date date default null -- ȸ�� ���� �Ͻ�
);

/* ȸ���ѹ��� ������ */
create sequence mem_seq 
start with 10000
increment by 1
maxvalue 999999;


-- ���θ���
create table ta_study_madang(
    madang_no number constraint stmadang_no_pk primary key, -- �۹�ȣ
    madang_writer_uid number, -- �۾��� uid
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint stmadang_title_nn not null, -- �� ����
    madang_level number, -- ���� ���̵�(Level 1~5)
    madang_content clob constraint stmadang_content_nn not null, -- �� ����
    madang_main_category varchar2(100), -- ��з�(������ ����)
    madang_category varchar2(100), -- �ߺз�(������ ����)
    madang_sub_category varchar2(100), -- �Һз�(����� ����)
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_updated_datetime date default null, -- �� ���� �Ͻ�
    madang_updated_ip varchar2(20), -- �� ���� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_fork_count number default 0, -- �� ��ũ ��
    madang_answer_count number default 0, -- �� �亯(Ǯ��) �� 
    madang_status char(1) default 'Y' constraint stmadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- ���θ���
create sequence stmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- ���θ��� Ǯ��
create table ta_study_madang_question(
    question_no number primary key,-- ������ pk
    madang_no number references ta_study_madang(madang_no), -- �ش� �۹�ȣ
    question_writer_uid number, -- �۾��� uid
    question_writer_email varchar2(20), -- �۾��� �̸���
    question_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    question_content clob, -- �� ����
    question_main_category varchar2(100), -- ��з�(������ ����) => ����
    question_category varchar2(100), -- �ߺз�(������ ����)
    question_sub_category varchar2(100), -- �Һз�(����� ����)
    question_register_datetime date, -- �� �ۼ� �Ͻ�
    question_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    question_updated_datetime date default null, -- �� ���� �Ͻ�
    question_updated_ip varchar2(20), -- �� ���� ip �ּ�
    question_rec_count number default 0, -- �� ��õ ��(recommand)
    question_rep_count number default 0, -- �� ��� ��
    question_status char(1) default 'Y' check(question_status in ('Y','N')) -- ���� ����
);

-- ���θ��� Ǯ�� ������
create sequence stmadang_question_seq 
start with 1
increment by 1
maxvalue 999999;


-- ��������
create table ta_share_madang(
    madang_no number constraint smadang_no_pk primary key, -- �۹�ȣ
    madang_parent number default null, -- ����� �޾��� ��, ������ �۹�ȣ�� ����
    madang_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    madang_writer_uid number, -- �۾��� uid
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint smadang_title_nn not null, -- �� ����
    madang_content clob constraint smadang_content_nn not null, -- �� ����
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_updated_datetime date default null, -- �� ���� �Ͻ�
    madang_updated_ip varchar2(20), -- �� ���� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_fork_count number default 0, -- �� ��ũ ��    
    madang_file_presence char(1) default 'N' constraint smadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint smadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint smadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- ��������
create sequence smadang_seq 
start with 1
increment by 1
maxvalue 999999;


-- ��������
create table ta_free_madang(
    madang_no number constraint fmadang_no_pk primary key, -- �۹�ȣ
    madang_parent number default null, -- ����� �޾��� ��, ������ �۹�ȣ�� ����
    madang_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    madang_writer_uid number, -- �۾��� uid
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint fmadang_title_nn not null, -- �� ����
    madang_content clob constraint fmadang_content_nn not null, -- �� ����
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_updated_datetime date default null, -- �� ���� �Ͻ�
    madang_updated_ip varchar2(20), -- �� ���� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_file_presence char(1) default 'N' constraint fmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint fmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint fmadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- ��������
create sequence fmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- �ڶ�����
create table ta_boast_madang(
    madang_no number constraint bmadang_no_pk primary key, -- �۹�ȣ
    madang_parent number default null, -- ����� �޾��� ��, ������ �۹�ȣ�� ����
    madang_order number default 0, -- ����� �޷��� ��, �ش� �Խñ��� ������ �����ֱ� ���� ������ȣ
    madang_writer_uid number, -- �۾��� uid
    madang_writer_email varchar2(20), -- �۾��� �̸���
    madang_writer_name varchar2(20), -- �۾��� �̸�(�̸����� ǥ��)
    madang_title varchar2(100) constraint bmadang_title_nn not null, -- �� ����
    madang_content clob constraint bmadang_content_nn not null, -- �� ����
    madang_register_datetime date, -- �� �ۼ� �Ͻ�
    madang_register_ip varchar2(20), -- �� �ۼ� ip �ּ�
    madang_updated_datetime date default null, -- �� ���� �Ͻ�
    madang_updated_ip varchar2(20), -- �� ���� ip �ּ�
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_file_presence char(1) default 'N' constraint bmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint bmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint bmadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- �ڶ�����
create sequence bmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- ��� ���̺� => �� �Խ��Ǵ� �� ���� ���̺� ���� => ��� ���̺��� ���������� ����!
-- �������� ��� ���̺�
create table ta_fmadang_cmt (
    cmt_no number primary key, -- ��� ������ �ѹ�
    cmt_parent number, -- �θ� ����� ��ȣ�� ����. �θ�� null
    cmt_sort number default 0, -- ��� ���� (�⺻�� 0����, ���� ������� 1�� ����)
    cmt_madang_no number references ta_free_madang(madang_no), -- �Խñ� ��ȣ(�ַ�Ű)
    cmt_content clob, -- ��� ����
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- ���� ���� ����
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- ��� ��� ���� // �ϴ� ���� ������� ���� ����
    cmt_writer_uid number not null references ta_member(mem_no), -- ��� �ۼ��� uid(�����ѹ�)
    cmt_writer varchar2(30) not null, -- ��� �ۼ��� �̸��� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_writer_name varchar2(30) not null, -- ��� �ۼ��� �̸� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_register_datetime date, -- ��� �ۼ� �Ͻ�
    cmt_updated_datetime date, -- ��� �ֱ� ���� �Ͻ�
    cmt_register_ip varchar2(20), -- ��� �ۼ� ip �ּ�
    cmt_updated_ip varchar2(20), -- ��� �ֱ� ���� ip �ּ�
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- ��� ���� ����(�θ� ����� ���� ó���� ��, ���۵� ��� N���� ó��)
    cmt_blame number default 0, -- �Ű� Ƚ��
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- �Ű� ���������� ������ �Ǵ� �Ͽ� ������ġ�� ���. ("�����ڿ��� ���� ����ó���� ����Դϴ�." ǥ��//�ϴ� �׳� ����ó���� �����ϰ�)
);

-- �������� ��� ������
create sequence fmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;


-- ���θ��� ��� ���̺� 
create table ta_stmadang_cmt (
    cmt_no number primary key, -- ��� ������ �ѹ�
    cmt_parent number, -- �θ� ����� ��ȣ�� ����. �θ�� null
    cmt_sort number default 0, -- ��� ���� (�⺻�� 0����, ���� ������� 1�� ����)
    cmt_madang_no number references ta_study_madang(madang_no), -- �Խñ� ��ȣ(�ַ�Ű)
    cmt_content clob, -- ��� ����
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- ���� ���� ����
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- ��� ��� ���� // �ϴ� ���� ������� ���� ����
    cmt_writer_uid number not null references ta_member(mem_no), -- ��� �ۼ��� uid(�����ѹ�)
    cmt_writer varchar2(30) not null, -- ��� �ۼ��� �̸��� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_writer_name varchar2(30) not null, -- ��� �ۼ��� �̸� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_register_datetime date, -- ��� �ۼ� �Ͻ�
    cmt_updated_datetime date, -- ��� �ֱ� ���� �Ͻ�
    cmt_register_ip varchar2(20), -- ��� �ۼ� ip �ּ�
    cmt_updated_ip varchar2(20), -- ��� �ֱ� ���� ip �ּ�
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- ��� ���� ����(�θ� ����� ���� ó���� ��, ���۵� ��� N���� ó��)
    cmt_blame number default 0, -- �Ű� Ƚ��
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- �Ű� ���������� ������ �Ǵ� �Ͽ� ������ġ�� ���. ("�����ڿ��� ���� ����ó���� ����Դϴ�." ǥ��//�ϴ� �׳� ����ó���� �����ϰ�)
);

-- ���θ��� ��� ������
create sequence stmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;



-- �������� ��� ���̺� 
create table ta_smadang_cmt (
    cmt_no number primary key, -- ��� ������ �ѹ�
    cmt_parent number, -- �θ� ����� ��ȣ�� ����. �θ�� null
    cmt_sort number default 0, -- ��� ���� (�⺻�� 0����, ���� ������� 1�� ����)
    cmt_madang_no number references ta_share_madang(madang_no), -- �Խñ� ��ȣ(�ַ�Ű)
    cmt_content clob, -- ��� ����
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- ���� ���� ����
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- ��� ��� ���� // �ϴ� ���� ������� ���� ����
    cmt_writer_uid number not null references ta_member(mem_no), -- ��� �ۼ��� uid(�����ѹ�)
    cmt_writer varchar2(30) not null, -- ��� �ۼ��� �̸��� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_writer_name varchar2(30) not null, -- ��� �ۼ��� �̸� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_register_datetime date, -- ��� �ۼ� �Ͻ�
    cmt_updated_datetime date, -- ��� �ֱ� ���� �Ͻ�
    cmt_register_ip varchar2(20), -- ��� �ۼ� ip �ּ�
    cmt_updated_ip varchar2(20), -- ��� �ֱ� ���� ip �ּ�
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- ��� ���� ����(�θ� ����� ���� ó���� ��, ���۵� ��� N���� ó��)
    cmt_blame number default 0, -- �Ű� Ƚ��
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- �Ű� ���������� ������ �Ǵ� �Ͽ� ������ġ�� ���. ("�����ڿ��� ���� ����ó���� ����Դϴ�." ǥ��//�ϴ� �׳� ����ó���� �����ϰ�)
);

-- �������� ��� ������
create sequence smadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;


-- �ڶ����� ��� ���̺� 
create table ta_bmadang_cmt (
    cmt_no number primary key, -- ��� ������ �ѹ�
    cmt_parent number, -- �θ� ����� ��ȣ�� ����. �θ�� null
    cmt_sort number default 0, -- ��� ���� (�⺻�� 0����, ���� ������� 1�� ����)
    cmt_madang_no number references ta_boast_madang(madang_no), -- �Խñ� ��ȣ(�ַ�Ű)
    cmt_content clob, -- ��� ����
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- ���� ���� ����
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- ��� ��� ���� // �ϴ� ���� ������� ���� ����
    cmt_writer_uid number not null references ta_member(mem_no), -- ��� �ۼ��� uid(�����ѹ�)
    cmt_writer varchar2(30) not null, -- ��� �ۼ��� �̸��� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_writer_name varchar2(30) not null, -- ��� �ۼ��� �̸� (�⺻������ ��ۿ� ������ ����ֱ� ����)
    cmt_register_datetime date, -- ��� �ۼ� �Ͻ�
    cmt_updated_datetime date, -- ��� �ֱ� ���� �Ͻ�
    cmt_register_ip varchar2(20), -- ��� �ۼ� ip �ּ�
    cmt_updated_ip varchar2(20), -- ��� �ֱ� ���� ip �ּ�
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- ��� ���� ����(�θ� ����� ���� ó���� ��, ���۵� ��� N���� ó��)
    cmt_blame number default 0, -- �Ű� Ƚ��
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- �Ű� ���������� ������ �Ǵ� �Ͽ� ������ġ�� ���. ("�����ڿ��� ���� ����ó���� ����Դϴ�." ǥ��//�ϴ� �׳� ����ó���� �����ϰ�)
);

-- �ڶ����� ��� ������
create sequence bmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;



-- ���̵� �޴� �� ��Ҹ� ���� ���̺�
create table ta_sidemenu_elements (
    menu_id number constraint menu_id_pk primary key, -- �⺻Ű
    menu_category varchar2(30) not null, -- �޴��� ���� ��ġ
    menu_name varchar2(30) not null, -- �޴� �̸�
    menu_url varchar2(30) not null, -- �̵���ų ���
    menu_class varchar2(50) default null, -- �޴��� ������ class (������ ������//�����޴��� null)
    use_down char(1) default 'N' constraint use_down_ck check(use_down in ('Y','N')), -- ���� �޴� ��� ����
    sort_no number not null, -- ���� ����
    parent_id number default null -- �θ� �޴��� id
);

-- ��� ������
create sequence ta_sidemenu_seq 
start with 1
increment by 1
maxvalue 9999;

-- ���̵� �޴� ��� �ʼ� ������(����)
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang', '����Ұ�', '/madang/introMadang', 'fas fa-tachometer-alt fa-lg', default, 1, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','���θ���', '/madang/studyMadangList', 'fab fa-studiovinari fa-lg', 'Y', 2, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��������', '/madang/freeMadangList', 'fab fa-fort-awesome-alt fa-lg', default, 3, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��������', '/madang/shareMadangList', 'fab fa-pagelines fa-lg', 'Y', 4, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ڶ�����', '/madang/boastMadangList', 'fas fa-user-tie fa-lg', 'Y', 5, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��������', '/madang/questionMadang', 'fa fa-users fa-lg', 'Y', 6, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�1', '/madang/studyMadangList', default, default, 7, 2);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�2', '/madang/studyMadangList', default, default, 8, 2);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�3', '/madang/studyMadangList', default, default, 9, 2);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�1', '/madang/shareMadangList', default, default, 10, 4);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�2', '/madang/shareMadangList', default, default, 11, 4);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�3', '/madang/shareMadangList', default, default, 12, 4);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�1', '/madang/questionMadang', default, default, 13, 6);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�2', '/madang/questionMadang', default, default, 14, 6);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�3', '/madang/questionMadang', default, default, 15, 6);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�1', '/madang/boastMadangList', default, default, 16, 5);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�2', '/madang/boastMadangList', default, default, 17, 5);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','��з�3', '/madang/boastMadangList', default, default, 18, 5);


-- �α��� �α� db
create table ta_member_login_log (
    mll_no number primary key, -- ������ PK 
    mll_success char(1) check (mll_success in ('Y','N')), -- �α��� ���� ����
    mll_mem_no number, -- �α��� �� ȸ�� PK (ã�ƿ��� ���� ��, null(0��)�� ���� �����ε�, �ܷ�Ű�� �θ�Ű�� ã�� �� ���ٰ� �������� ������ ������.) references ta_member(mem_no) 
    mll_user_email varchar2(30), -- �α��� �õ��� ���� �Է��� �̸���
    mll_datetime date, -- �α��� �Ͻ�
    mll_ip varchar2(20), -- �α��� �� IP
    mll_reason varchar2(500), -- �α��� ����/���н� ����
    mll_useragent varchar2(500), -- �α����� �������� user agent
    mll_url varchar2(500), -- �α����� ������ �ּ�
    mll_referer varchar2(500) -- ���� ������ �ּ�
);

-- �α��� �α� ������
create sequence mll_seq 
start with 1
increment by 1
maxvalue 999999999;

-- ���ƿ�(��õ ���̺�)
-- �� ���̺�� ó���ϰ� �;��µ�, �ܷ�Ű ���������� ���縶�� �������� �� �ʹ�..
create table ta_stmadang_like (
    like_no number primary key, -- ������ pk
    madang_no number references ta_study_madang(madang_no), -- ���� ��ȣ fk
    mem_no number references ta_member(mem_no), -- ȸ�� ��ȣ fk
    like_datetime date default sysdate, -- ���ƿ�(��õ) �Ͻ�
    like_ip varchar2(20), -- ���ƿ�(��õ) ip
    unique (madang_no, mem_no)
);

create sequence stm_like_seq  
start with 1
increment by 1
maxvalue 999999999;












commit;





























