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
DROP SEQUENCE SEQ_STORY_NO;
DROP TABLE TA_STORY;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_MY_DIBS;
DROP SEQUENCE SEQ_MY_MEMO;
DROP SEQUENCE SEQ_MY_PURCHASE;
DROP SEQUENCE SEQ_MYCALENDAR;
DROP SEQUENCE SEQ_FSTUDY;
DROP SEQUENCE SEQ_PSTUDY;
DROP SEQUENCE SEQ_QandA;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE DEC_FAQ;

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
DROP TABLE QANDA;
DROP TABLE ADMIN_FAQ;
DROP TABLE DECLARATION;
DROP TABLE ta_point_content;
DROP TABLE MY_PURCHASE;
DROP TABLE MY_DIBS;
DROP TABLE MY_MEMO;
DROP TABLE TODO_LIST;
DROP TABLE MY_CALENDAR;
DROP TABLE F_STUDY;
DROP TABLE P_STUDY;
DROP TABLE category_s;
DROP TABLE category_m;
DROP TABLE CATEGORY_B;

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
    menu_url varchar2(100) not null, -- �̵���ų ���
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
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ܱ���', '/madang/studyMadangList?mCategory=�ܱ���', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','���α׷���', '/madang/studyMadangList?mCategory=���α׷���', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','������', '/madang/studyMadangList?mCategory=������', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ڰ���', '/madang/studyMadangList?mCategory=�ڰ���', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','����غ�', '/madang/studyMadangList?mCategory=����غ�', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�Ϲ�', '/madang/studyMadangList?mCategory=�Ϲ�', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='���θ���'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ܱ���', '/madang/shareMadangList?mCategory=�ܱ���', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','���α׷���', '/madang/shareMadangList?mCategory=���α׷���', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','������', '/madang/shareMadangList?mCategory=������', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ڰ���', '/madang/shareMadangList?mCategory=�ڰ���', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','����غ�', '/madang/shareMadangList?mCategory=����غ�', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�Ϲ�', '/madang/shareMadangList?mCategory=�Ϲ�', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ܱ���', '/madang/boastMadangList?mCategory=�ܱ���', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','���α׷���', '/madang/boastMadangList?mCategory=���α׷���', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','������', '/madang/boastMadangList?mCategory=������', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ڰ���', '/madang/boastMadangList?mCategory=�ڰ���', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','����غ�', '/madang/boastMadangList?mCategory=����غ�', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�Ϲ�', '/madang/boastMadangList?mCategory=�Ϲ�', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='�ڶ�����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ܱ���', '/madang/questionMadang?mCategory=�ܱ���', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','���α׷���', '/madang/questionMadang?mCategory=���α׷���', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','������', '/madang/questionMadang?mCategory=������', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�ڰ���', '/madang/questionMadang?mCategory=�ڰ���', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','����غ�', '/madang/questionMadang?mCategory=����غ�', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','�Ϲ�', '/madang/questionMadang?mCategory=�Ϲ�', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='��������'));

--���� �޴� 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','������', '/AdminInqueryList', default, default, 1, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','����Ʈ ����', '/AdminPointManage', default, default, 2, default); 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','1:1���� ����', '/AdminQandAList', default, default, 3, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','���� ����', '/AdminPayManage', default, 'Y', 4, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','���� ��û ����', '/AdminPSManage', default, default, 5, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','���͵� ����', '/AdminStudyManage', default, 'Y', 6, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','���� ���͵�', '/AdminStudyManage', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='���͵� ����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','�Ϲ� ���͵�', '/AdminStudyFreeManage', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='���͵� ����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin', '�α��� �α�', '/AdminLoginLog', default, default, 7, default);

insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','���� ����', '/AdminPayManageList', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='���� ����'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','��� ����', '/AdminPayManageCancleList', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='���� ����'));

INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '���� ���� ����', '/AdminBoardFAQ', DEFAULT, DEFAULT, 1, DEFAULT);
INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '�� ��', '/AdminBoardStory', DEFAULT, DEFAULT, 2, DEFAULT);

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

--������ ��� -------------------------------------------------



--����Ķ����
create sequence seq_mycalendar
start with 1
increment by 1;
--Ķ����
create table my_calendar(
    edit_no number primary key, --������ �ѹ� 
    mem_no number,  --ȸ����ȣ 
    mem_name varchar(20) , --ȸ�� �̸�
    edit_title varchar(30), --���� �̸� 
    edit_start Date,  --���۳�¥
    edit_end Date, --����¥ 
    edit_color varchar(20), --���� 
    edit_desc varchar(2000) --�󼼼���
);
--fsutdy
create sequence seq_fstudy
start with 1
increment by 1
maxvalue 999;

create table f_study(
    f_no number constraint fstudy_pk primary key, --���͵� ��ȣ
    f_title varchar2(100), --���͵� Ÿ��Ʋ
    f_name varchar2(100), --���͵� �̸�
    f_area varchar2(100), --���͵� ����
    f_day  varchar2(100), --���͵� ����,�ָ�
    f_studyperson number, --���͵� �ο�
    f_category varchar2(100),--���͵� ī�װ�
    f_intro1 varchar2(1000), --���͵� �Ұ� 1
    f_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    f_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    f_img1 varchar2(255), --�̹��� 1
    f_img2 varchar2(255), --�̹��� 2
    f_img3 varchar2(255), --�̹��� 3
    f_timestart varchar(100), --���͵� �ð� ����
    f_timeend varchar(100), --���͵� �ð� ��
    f_datestart date default sysdate not null, --���� ��¥
    f_dateend date not null, --����¥
    f_like number default 0, --���ƿ�
    f_readername varchar(100) default null, --���� �̸� 
    f_status varchar(20) default 'Y', --���̴� �뵵 delete �Ⱦ�  
    f_studyMember number default 0,--���͵� ���� Ȯ�� ��� �ѹ� 
    f_teacherno number --���͵� ���� �ѹ�
);


--���罺�͵�
create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;

create table p_study(
    p_no number primary key, --���͵� ��ȣ
    p_title varchar2(100), --���͵� Ÿ��Ʋ
    p_name varchar2(100), --���͵� �̸�
    p_area varchar2(100), --���͵� ����
    P_day  varchar2(100), --���͵� ����,�ָ�
    p_studyperson number, --���͵� �ο�
    p_price number, --���͵� ����
    p_category varchar2(100),--���͵� ī�װ�
    p_intro1 varchar2(1000), --���͵� �Ұ� 1
    p_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    p_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    p_img1 varchar2(255), --�̹��� 1
    p_img2 varchar2(255), --�̹��� 2
    p_img3 varchar2(255), --�̹��� 3
    p_timestart varchar(100), --���͵� �ð� ����
    P_timeend varchar(100), --���͵� �ð� ��
    p_datestart date default sysdate not null, --���� ��¥
    p_dateend date not null, --����¥
    p_like number default 0, --���ƿ�
    p_teachername varchar(100) default null, --���� �̸� 
    p_status varchar(20) default 'Y', --���̴� �뵵 delete �Ⱦ� 
    p_studyMember number default 0,--���͵� ���� Ȯ�� ��� �ѹ� 
    p_teacherno number --���͵� ���� �ѹ�
);


--���ĵ��---------------------------------------------------



--���丮 ������
 CREATE SEQUENCE SEQ_STORY_NO
   START WITH 1 
   INCREMENT BY 1 
   NOMINVALUE 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE; 
--���丮 ���̺�
CREATE TABLE TA_STORY(
    "STORY_NO" NUMBER PRIMARY KEY, 
     "mem_no" number references ta_member(mem_no), -- ������ ȸ�� ��ȣ
    "p_no" number references p_study(p_no), -- ������ ���罺�͵� ��ȣ
      "STORY_STUDENT_PICTURE" VARCHAR2(100), 
      "STORY_WRITE" VARCHAR2(30), 
      "STORY_CONTENT" VARCHAR2(3000),
      "STORY_TIME" TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
       "STORY_TEACHER_NAME" VARCHAR2(30),
      "STORY_TEACHER_PICTUER" VARCHAR2(100),
      "STORY_SUBJECT" VARCHAR2(40),
      "STORY_STAR" number
      );



--MyPage DB------------------------------------------------------------------------


--�����̺� db
create table my_dibs(
    dibs_id number primary key,--���ȣ
    mem_no number constraint mem_no_fk references ta_member(mem_no), -- ȸ�� ��ȣ
    p_no number default null constraint p_study_fk references p_study(p_no), -- ���罺�͵� ��ȣ
    f_no number default null constraint f_study_fk references f_study(f_no), -- �Ϲݽ��͵� ��ȣ
    scr_datetime date --���� ��¥
);
--�����̺� ������
create sequence seq_my_dibs
start with 1
increment by 1;

--����,��û���̺�
CREATE TABLE MY_PURCHASE(
    PUR_ID NUMBER PRIMARY KEY,--���Ź�ȣ
    mem_no number constraint PUR_mem_no_fk references ta_member(mem_no), -- ������ ȸ�� ��ȣ
    f_no number default null constraint PUR_f_study_fk references f_study(f_no), -- ��û�� ���ὺ�͵� ��ȣ
    p_no number default null constraint PUR_p_study_fk references p_study(p_no), -- ������ ���罺�͵� ��ȣ
    PURCHASE_DATE DATE, --����,��û ��¥
    PURCHASE_CANCEL_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CANCEL_STATUS_CK CHECK (PURCHASE_CANCEL_STATUS IN ('N','Y')), --��ҿ���
    CANCEL_DATE DATE, --��� ��¥
    PURCHASE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CK CHECK (PURCHASE_STATUS IN ('N','Y')),--���͵� ���࿩��/������Y, �Ϸ�N
    SUBMIT_FILE CHAR(1) DEFAULT 'N' CONSTRAINT SUBMIT_FILE_CK CHECK (SUBMIT_FILE IN ('N','Y'))--���⼭���߱�����/������Y,�������N
);

--���Ž�����
create sequence seq_my_purchase
start with 1
increment by 1;

--TODOLIST���̺�
CREATE TABLE TODO_LIST(
    TODO_ID NUMBER PRIMARY KEY,--�ؾ����� ���̵�
    mem_no number constraint TODO_MEM_FK references ta_member(mem_no), -- ���������� ȸ���� ��ȣ
    TODO_TITLE varchar2(100) constraint TODO_TITLE_NN not null, -- �� ����
    TODO_CONTENTS clob constraint TODO_CONTENTS_NN not null, -- �� ����
    TODO_URL VARCHAR2(100) CONSTRAINT TODO_URL_NN NOT NULL, --�˸�Ŭ���� �̵��ּ�
    TODO_DATETIME DATE CONSTRAINT TODO_DATE_NN NOT NULL,--���������Ͻ�
    DATE_DEADLINE DATE CONSTRAINT DATE_DEADLINE_NN NOT NULL,--���������Ͻ�
    TODO_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT TODO_STATUS_CK CHECK (TODO_STATUS IN ('N','Y')),--�������� �Ϸ�Y,�̿Ϸ�N
    TODO_DATE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT TODO_DATE_STATUS_CK CHECK (TODO_DATE_STATUS IN ('N','Y'))--���������� ���������� ���� ����
);


--My Memo ���̺�
create table my_memo(
    MEMO_ID NUMBER PRIMARY KEY,--�޸� ��Ű
    MEM_NO number constraint MEMO_MEM_FK references ta_member(mem_no), --�޸� ���� ȸ���� ��ȣ
    MEMO_FRONT_ID NUMBER CONSTRAINT MEMO_FRONT_ID_NN NOT NULL,--����Ʈ ȭ�鿡�� ������ ID��
    MEMO_CONTENTS clob , -- �޸𳻿�
    MEMO_LEFT NUMBER NOT NULL,-- �޸� ��ǥ LEFT
    MEMO_TOP NUMBER NOT NULL, --�޸��� ��ǥ TOP
    MEMO_DELETE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMO_STATUS_CK CHECK (MEMO_DELETE_STATUS IN ('N','Y'))--�޸� ����Y,
);

--MYMEMO ������
create sequence seq_my_memo
start with 1
increment by 1;



-- category ��з� ���̺�
CREATE TABLE CATEGORY_B(
    CATEGORY_B_ID VARCHAR2(10) PRIMARY KEY, --ī�װ����̵�
    TITLE_B VARCHAR2(30) DEFAULT 'N' NOT NULL--ī�װ� �̸�
);
--�ߺз� ���̺�
CREATE TABLE CATEGORY_M(
    CATEGORY_M_ID VARCHAR2(10) PRIMARY KEY, --ī�װ����̵�
    CATEGORY_B_ID VARCHAR2(10) REFERENCES CATEGORY_B(CATEGORY_B_ID),--��з����̺�����
    TITLE_M VARCHAR2(30) DEFAULT 'N' NOT NULL --ī�װ� �̸�
);

--�Һз� ���̺�
CREATE TABLE CATEGORY_S(
    CATEGORY_S_ID NUMBER PRIMARY KEY, --ī�װ����̵�
    CATEGORY_M_ID VARCHAR2(10) REFERENCES CATEGORY_M(CATEGORY_M_ID),--�ߺз� ���̺� ����
    TITLE_S VARCHAR2(30) DEFAULT 'N' NOT NULL UNIQUE --ī�װ� �̸�
);
--�Һз� ���̺� ������
CREATE SEQUENCE SEQ_CATEGORY
START WITH 1
INCREMENT BY 1;


--��з� ������
INSERT INTO CATEGORY_B VALUES('CB1','�ܱ���');
INSERT INTO CATEGORY_B VALUES('CB2','���α׷���');
INSERT INTO CATEGORY_B VALUES('CB3','������');
INSERT INTO CATEGORY_B VALUES('CB4','�ڰ���');
INSERT INTO CATEGORY_B VALUES('CB5','����غ�');

--CB1 (�ܱ��� ������)
INSERT INTO CATEGORY_M VALUES('CM1','CB1','����');
INSERT INTO CATEGORY_M VALUES('CM2','CB1','�߱���');
INSERT INTO CATEGORY_M VALUES('CM3','CB1','�Ϻ���');
INSERT INTO CATEGORY_M VALUES('CM4','CB1','�����ξ�');
INSERT INTO CATEGORY_M VALUES('CM5','CB1','��������');
INSERT INTO CATEGORY_M VALUES('CM6','CB1','��Ÿ���');


--CB2 (���α׷��� ������)
INSERT INTO CATEGORY_M VALUES('CM7','CB2','��޾��');
INSERT INTO CATEGORY_M VALUES('CM8','CB2','���޾��');
INSERT INTO CATEGORY_M VALUES('CM9','CB2','�����ͺ��̽�');
INSERT INTO CATEGORY_M VALUES('CM10','CB2','�ü��');
INSERT INTO CATEGORY_M VALUES('CM11','CB2','�ڷᱸ��');
INSERT INTO CATEGORY_M VALUES('CM12','CB2','�˰���');
--CB3 (������������)
INSERT INTO CATEGORY_M VALUES('CM13','CB3','������');
INSERT INTO CATEGORY_M VALUES('CM14','CB3','������');
INSERT INTO CATEGORY_M VALUES('CM15','CB3','������');
--CB4 (�ڰ��� ������)
INSERT INTO CATEGORY_M VALUES('CM16','CB4','��������ڰ���');
INSERT INTO CATEGORY_M VALUES('CM17','CB4','�ΰ��ڰ���');
--CB5 (����غ� ������)
INSERT INTO CATEGORY_M VALUES('CM18','CB5','������');
INSERT INTO CATEGORY_M VALUES('CM19','CB5','NCS');
INSERT INTO CATEGORY_M VALUES('CM20','CB5','����');
INSERT INTO CATEGORY_M VALUES('CM21','CB5','����');

--�Һз� ���̺� ������
--CM1(����)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOEICSPEAKING');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOEIC');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOFLE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','IELTS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','OPIC');
--CM2(�߱���)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM2','HSK');
--CM3(�Ϻ���)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM3','JSK');
--CM7(��޾��)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','JAVA');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','C');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','C++/C#');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','PYTHON');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','PHP');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','HTML/CSS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','JAVASCRIPT');
--CM8(�����)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM8','�������');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM8','����');
--CM9(�����ͺ��̽�)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','ORACLE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','MYSQL');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','POSTGRE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','������');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','ī����');
--CM10(�ü��)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','WINDOWS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','UNIX');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','LINUX');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','IOS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','ANDROID');

--���ֹ��� ���� �Խ��� �̸��� ����
--������
CREATE SEQUENCE SEQ_QandA 
START WITH 1
INCREMENT BY 1
NOCYCLE;
--���̺�
CREATE TABLE QANDA(
    NO NUMBER PRIMARY KEY, --���ǹ�ȣ
    EMAIL VARCHAR2(30) NOT NULL, --�亯���� �̸���
    CONTENT VARCHAR2(3000) NOT NULL, --���ǳ���
    ENROLL_DATE DATE, --������ �ð�
    QANDA_STATUS VARCHAR2(1) --���ǳ��� ó������
    );
    
--���ֹ��� ���� �Խ��� ���� ����
--������
create sequence SEQ_FAQ
start with 1
increment by 1;
--���̺�
CREATE TABLE ADMIN_FAQ(
    FAQ_NO NUMBER PRIMARY KEY,--������ȣ
    FAQ_TYPE VARCHAR2(100) NOT NULL, -- ��������
    FAQ_TITLE VARCHAR2(100) NOT NULL, -- ��������
    FAQ_CONTENT VARCHAR2(3000) NOT NULL -- �亯����
);

--�Խñ�/��� �Ű�
create sequence DEC_FAQ
start with 1
increment by 1;

CREATE TABLE DECLARATION(
    D_NO NUMBER PRIMARY KEY, --�Ű��ȣ
    R_NO NUMBER NOT NULL, --�Ű��� ��� ��ȣ
    P_NO NUMBER NOT NULL, --�Ű���� ��� ��ȣ
    D_TYPE CHAR(1) CONSTRAINT DECLARATION_TYPE_CK CHECK (D_TYPE IN ('G', 'D')), --�Ű�ī�װ�(G:�Խñ�, D:���)
    D_CATEGORY CHAR(1) CONSTRAINT DECLARATION_CATEGORY_CK CHECK (D_CATEGORY IN ('P','U', 'D', 'S', 'G')), 
    -- �Ű�ī�װ�(P:���������� ����, U:������/������ �Խñ�, D:���� �Խñ�/��� S:�������� ����/���Ȱ ħ�� G:�������� ����/���Ȱ ħ��)
    D_DATE DATE DEFAULT SYSDATE, --�Ű�ð�
    D_IP VARCHAR2(20) NOT NULL, --������
    D_CONTENT VARCHAR2(3000), --�Ű� ����
    D_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT DECLARATION_STATUS_CK CHECK (D_STATUS IN ('Y', 'N')) 
);

-- ����Ʈ���� ���̺�
create table ta_point_content (
    mem_id number not null, -- �⺻Ű
    mem_name varchar2(50) not null, -- ȸ�� �̸�
    mem_email varchar2(30) not null, --ȸ�� �̸���
    mem_point number default 0, -- ȸ�� ���� ����Ʈ 
    point_status char(1) check(point_status in ('Y','N')), -- y(����) n(����)
    point_enrolldate date -- ���� ����
);




commit;





























