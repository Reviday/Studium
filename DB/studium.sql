-- ��¥ ���������� �������� �ٲ۴�. ex) 2019.01.01 13:00:00
-- �Ʒ��� �������� ������ Studium ������Ʈ���� ���Ǵ� ��¥ ���������� ����� �� ����.
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 

drop table ta_sidemenu_elements;
drop sequence ta_sidemenu_seq;
drop table ta_fmadang_cmt;
drop sequence fmadang_cmt_seq ;
drop table ta_free_madang CASCADE CONSTRAINT;
drop sequence fboard_seq;
drop table ta_share_madang;
drop sequence sboard_seq;
drop table ta_member CASCADE CONSTRAINT;
drop sequence mem_seq;

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

insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','������','M','1990/01/01','','M',99999999,'','','','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','studium_logo.png',default,default,default);
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '�ƹ���','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);


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
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_fork_count number default 0, -- �� ��ũ ��    
    madang_file_presence char(1) default 'N' constraint smadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint smadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint smadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- ��������
create sequence sboard_seq 
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
    madang_rec_count number default 0, -- �� ��õ ��(recommand)
    madang_rep_count number default 0, -- �� ��� ��
    madang_read_count number default 0, -- ��ȸ��
    madang_file_presence char(1) default 'N' constraint fmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- ������ �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_img_presence char(1) default 'N' constraint fmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- �̹����� �ִ��� ������(Listȭ�鿡�� ǥ�ÿ����� ���)
    madang_status char(1) default 'Y' constraint fmadang_status_ck check(madang_status in ('Y','N')) -- ���� ����
);

-- ��������
create sequence fboard_seq 
start with 1
increment by 1
maxvalue 999999;

-- �׽�Ʈ�� ���� ������(��������)
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.1', '�׽�Ʈ �� �Դϴ�.1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.2', '�׽�Ʈ �� �Դϴ�.2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.3', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.4', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.5', '�׽�Ʈ �� �Դϴ�.4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.6', '�׽�Ʈ �� �Դϴ�.5',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.7', '�׽�Ʈ �� �Դϴ�.6',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8', '�׽�Ʈ �� �Դϴ�.7',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.9', '�׽�Ʈ �� �Դϴ�.8',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10', '�׽�Ʈ �� �Դϴ�.10',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.11', '�׽�Ʈ �� �Դϴ�.11',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.12', '�׽�Ʈ �� �Դϴ�.12',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.13', '�׽�Ʈ �� �Դϴ�.13',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.14', '�׽�Ʈ �� �Դϴ�.14',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.15', '�׽�Ʈ �� �Դϴ�.15',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.16', '�׽�Ʈ �� �Դϴ�.16',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.17', '�׽�Ʈ �� �Դϴ�.17',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.18', '�׽�Ʈ �� �Դϴ�.18',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.19', '�׽�Ʈ �� �Դϴ�.19',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.20', '�׽�Ʈ �� �Դϴ�.20',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.21', '�׽�Ʈ �� �Դϴ�.21',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.22', '�׽�Ʈ �� �Դϴ�.22',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.23', '�׽�Ʈ �� �Դϴ�.23',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.24', '�׽�Ʈ �� �Դϴ�.24',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.25', '�׽�Ʈ �� �Դϴ�.25',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.26', '�׽�Ʈ �� �Դϴ�.26',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.27', '�׽�Ʈ �� �Դϴ�.27',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.28', '�׽�Ʈ �� �Դϴ�.28',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.29', '�׽�Ʈ �� �Դϴ�.29',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.30', '�׽�Ʈ �� �Դϴ�.39',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, 8, 1, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���1', '�׽�Ʈ �� �Դϴ�.8-���1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 2, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���2', '�׽�Ʈ �� �Դϴ�.8-���2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 3, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���3', '�׽�Ʈ �� �Դϴ�.8-���3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 4, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���4', '�׽�Ʈ �� �Դϴ�.8-���4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 1, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���1', '�׽�Ʈ �� �Դϴ�.10-���1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 2, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���2', '�׽�Ʈ �� �Դϴ�.10-���2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.31', '�׽�Ʈ �� �Դϴ�.31',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.32', '�׽�Ʈ �� �Դϴ�.32',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.33', '�׽�Ʈ �� �Դϴ�.33',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.34', '�׽�Ʈ �� �Դϴ�.34',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.35', '�׽�Ʈ �� �Դϴ�.35',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.36', '�׽�Ʈ �� �Դϴ�.36',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.37', '�׽�Ʈ �� �Դϴ�.37',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.38', '�׽�Ʈ �� �Դϴ�.38',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.39', '�׽�Ʈ �� �Դϴ�.39',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.40', '�׽�Ʈ �� �Դϴ�.40',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.41', '�׽�Ʈ �� �Դϴ�.41',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.42', '�׽�Ʈ �� �Դϴ�.42',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.43', '�׽�Ʈ �� �Դϴ�.43',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.44', '�׽�Ʈ �� �Դϴ�.44',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.45', '�׽�Ʈ �� �Դϴ�.45',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.46', '�׽�Ʈ �� �Դϴ�.46',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.47', '�׽�Ʈ �� �Դϴ�.47',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.48', '�׽�Ʈ �� �Դϴ�.48',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.49', '�׽�Ʈ �� �Դϴ�.49',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.50', '�׽�Ʈ �� �Դϴ�.50',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.51', '�׽�Ʈ �� �Դϴ�.51',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.52', '�׽�Ʈ �� �Դϴ�.52',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.53', '�׽�Ʈ �� �Դϴ�.53',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.54', '�׽�Ʈ �� �Դϴ�.54',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.55', '�׽�Ʈ �� �Դϴ�.55',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.56', '�׽�Ʈ �� �Դϴ�.56',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.57', '�׽�Ʈ �� �Դϴ�.57',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.58', '�׽�Ʈ �� �Դϴ�.58',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.59', '�׽�Ʈ �� �Դϴ�.59',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.60', '�׽�Ʈ �� �Դϴ�.60',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.61', '�׽�Ʈ �� �Դϴ�.61',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.62', '�׽�Ʈ �� �Դϴ�.62',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.63', '�׽�Ʈ �� �Դϴ�.63',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.64', '�׽�Ʈ �� �Դϴ�.64',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.65', '�׽�Ʈ �� �Դϴ�.65',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.66', '�׽�Ʈ �� �Դϴ�.66',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.67', '�׽�Ʈ �� �Դϴ�.67',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.68', '�׽�Ʈ �� �Դϴ�.68',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.69', '�׽�Ʈ �� �Դϴ�.69',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.70', '�׽�Ʈ �� �Դϴ�.70',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.71', '�׽�Ʈ �� �Դϴ�.71',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.72', '�׽�Ʈ �� �Դϴ�.72',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.73', '�׽�Ʈ �� �Դϴ�.73',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.74', '�׽�Ʈ �� �Դϴ�.74',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.75', '�׽�Ʈ �� �Դϴ�.75',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.76', '�׽�Ʈ �� �Դϴ�.76',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.77', '�׽�Ʈ �� �Դϴ�.77',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.78', '�׽�Ʈ �� �Դϴ�.78',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.79', '�׽�Ʈ �� �Դϴ�.79',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.80', '�׽�Ʈ �� �Դϴ�.80',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.81', '�׽�Ʈ �� �Դϴ�.81',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.82', '�׽�Ʈ �� �Դϴ�.82',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.83', '�׽�Ʈ �� �Դϴ�.83',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.84', '�׽�Ʈ �� �Դϴ�.84',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.85', '�׽�Ʈ �� �Դϴ�.85',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.86', '�׽�Ʈ �� �Դϴ�.86',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.87', '�׽�Ʈ �� �Դϴ�.87',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.88', '�׽�Ʈ �� �Դϴ�.88',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.89', '�׽�Ʈ �� �Դϴ�.89',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.90', '�׽�Ʈ �� �Դϴ�.90',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.91', '�׽�Ʈ �� �Դϴ�.91',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.92', '�׽�Ʈ �� �Դϴ�.92',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.93', '�׽�Ʈ �� �Դϴ�.93',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.94', '�׽�Ʈ �� �Դϴ�.94',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.95', '�׽�Ʈ �� �Դϴ�.95',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.96', '�׽�Ʈ �� �Դϴ�.96',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.97', '�׽�Ʈ �� �Դϴ�.97',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.98', '�׽�Ʈ �� �Դϴ�.98',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.99', '�׽�Ʈ �� �Դϴ�.99',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.100', '�׽�Ʈ �� �Դϴ�.100',sysdate, null, default,default, default, default, default, default);
commit;

-- �������� ���̵�����
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.1', '�׽�Ʈ �� �Դϴ�.1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.2', '�׽�Ʈ �� �Դϴ�.2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.3', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.4', '�׽�Ʈ �� �Դϴ�.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.5', '�׽�Ʈ �� �Դϴ�.4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.6', '�׽�Ʈ �� �Դϴ�.5',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.7', '�׽�Ʈ �� �Դϴ�.6',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8', '�׽�Ʈ �� �Դϴ�.7',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.9', '�׽�Ʈ �� �Դϴ�.8',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10', '�׽�Ʈ �� �Դϴ�.10',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.11', '�׽�Ʈ �� �Դϴ�.11',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.12', '�׽�Ʈ �� �Դϴ�.12',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.13', '�׽�Ʈ �� �Դϴ�.13',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.14', '�׽�Ʈ �� �Դϴ�.14',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.15', '�׽�Ʈ �� �Դϴ�.15',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.16', '�׽�Ʈ �� �Դϴ�.16',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.17', '�׽�Ʈ �� �Դϴ�.17',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.18', '�׽�Ʈ �� �Դϴ�.18',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.19', '�׽�Ʈ �� �Դϴ�.19',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.20', '�׽�Ʈ �� �Դϴ�.20',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.21', '�׽�Ʈ �� �Դϴ�.21',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.22', '�׽�Ʈ �� �Դϴ�.22',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.23', '�׽�Ʈ �� �Դϴ�.23',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.24', '�׽�Ʈ �� �Դϴ�.24',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.25', '�׽�Ʈ �� �Դϴ�.25',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.26', '�׽�Ʈ �� �Դϴ�.26',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.27', '�׽�Ʈ �� �Դϴ�.27',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.28', '�׽�Ʈ �� �Դϴ�.28',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.29', '�׽�Ʈ �� �Դϴ�.29',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.30', '�׽�Ʈ �� �Դϴ�.39',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.1',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.2',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.3',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default, 10000, 'admin@studium.com', '������', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4', '������ ���Դϴ�. ��µǸ� �ȵ˴ϴ�.4',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, 8, 1, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���1', '�׽�Ʈ �� �Դϴ�.8-���1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 2, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���2', '�׽�Ʈ �� �Դϴ�.8-���2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 3, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���3', '�׽�Ʈ �� �Դϴ�.8-���3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 4, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.8-���4', '�׽�Ʈ �� �Դϴ�.8-���4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 1, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���1', '�׽�Ʈ �� �Դϴ�.10-���1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 2, 10000, 'admin@studium.com', '������', '�׽�Ʈ �� �Դϴ�.10-���2', '�׽�Ʈ �� �Դϴ�.10-���2',sysdate, null, default,default, default, default, default, default, default);
commit;


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
-- �������� ��� ���̺�
create table ta_fmadang_rep (
    madang_no number constraint madang_no_fk references ta_free_madang(madang_no), -- �Խñ� ��ȣ(�ܷ�Ű)
    cmt_no number constraint cmt_no_pk primary key, -- ��� ��ȣ(������)
    cmt varchar2(1000), -- ��� ����(�ִ� 300�ڱ��� ���� ����)
    parent number default null, -- ������ ��� ���Ǵ� ����, null�̸� �⺻���, ���� ������ ���� parent�� ���� �θ� ����� cmt_no
    cmt_seq number default 0 --�θ����� seq���� �⺻������ 0�� �ο�, ���� ������� 1,2,3 ... �ο�
);


-- ��� ���̺� => �� �Խ��Ǵ� �� ���� ���̺� ���� => ��� ���̺��� ���������� ����!
create table ta_fmadang_cmt (
    cmt_no number primary key, -- ��� ������ �ѹ�
    cmt_group number, -- ��� ��ȣ �׷�(��۰� ������ �� �׷����� ��)
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

create sequence fmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;

insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '�׽�Ʈ ����Դϴ�.', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default,110, '�׽�Ʈ ����Դϴ�.2', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default,110, '�׽�Ʈ ����Դϴ�.3', 'Y', 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 3, 1, 110, '�׽�Ʈ �����Դϴ�.3-1', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '�׽�Ʈ ����Դϴ�.4', 'Y', 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 3, 2, 110, '�׽�Ʈ �����Դϴ�.3-2', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 5, 1, 110, '�׽�Ʈ �����Դϴ�.4-1', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '�׽�Ʈ ����Դϴ�.5', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '��µǸ� �ȵǴ� ����Դϴ�.', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, 'N', default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '��µǸ� �ȵǴ� ����Դϴ�.', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, 'N', default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '�Ű������� ������ ���.', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, 'Y');
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, fmadang_cmt_seq.currval, default, 110, '�Ű������� ������ ���.', default, 10000, 'admin@studium.com', '������', sysdate, null, null, null, default, default, 'Y');
SELECT NVL(MIN(CMT_SORT),0) FROM TA_FMADANG_CMT WHERE  CMT_GROUP = '3';
SELECT * FROM TA_FMADANG_CMT WHERE CMT_GROUP = '3';
SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM TA_FMADANG_CMT WHERE CMT_MADANG_NO=110 AND CMT_STATUS='Y' AND CMT_BLAME_ADMIN='N' ORDER BY CMT_GROUP ASC, CMT_SORT ASC) A) WHERE RNUM BETWEEN 1 AND 50;
SELECT COUNT(*) FROM TA_FMADANG_CMT WHERE CMT_MADANG_NO=110 AND CMT_STATUS='Y' AND CMT_BLAME_ADMIN='N';
SELECT NVL(MAX(CMT_SORT),0) FROM TA_FMADANG_CMT WHERE  CMT_GROUP = '3';
--UPDATE TA_FMADANG_CMT SET CMT_SORT = CMT_SORT + 1 WHERE CMT_GROUP =  3  AND CMT_SORT >= 0;
-- ����� ���
INSERT INTO TA_FMADANG_CMT VALUES(FMADANG_CMT_SEQ.NEXTVAL, FMADANG_CMT_SEQ.CURRVAL, DEFAULT, 110, '���� �߰��� ����Դϴ�.', DEFAULT, 10000, 'admin@studium.com', '������', SYSDATE, NULL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
-- ������ ��� 
INSERT INTO TA_FMADANG_CMT VALUES(FMADANG_CMT_SEQ.NEXTVAL, 13, (SELECT NVL(MAX(CMT_SORT),0) FROM TA_FMADANG_CMT WHERE  CMT_GROUP = '13')+1, 110, '���� �߰��� �����Դϴ�.', DEFAULT, 10000, 'admin@studium.com', '������', SYSDATE, SYSDATE, NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO TA_FMADANG_CMT VALUES(FMADANG_CMT_SEQ.NEXTVAL, 3, (SELECT NVL(MAX(CMT_SORT),0) FROM TA_FMADANG_CMT WHERE  CMT_GROUP = '3')+1, 110, '���� �߰��� �����Դϴ�.', DEFAULT, 10000, 'admin@studium.com', '������', SYSDATE, SYSDATE, NULL, NULL, DEFAULT, DEFAULT, DEFAULT);
commit;

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

create sequence ta_sidemenu_seq 
start with 1
increment by 1
maxvalue 9999;

select * from ta_sidemenu_elements;
select * from ta_sidemenu_elements where menu_category='madang' ORDER BY DECODE(parent_id,NULL,sort_no,parent_id), sort_no;
SELECT * FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' ORDER BY DECODE(PARENT_ID,NULL,SORT_NO,PARENT_ID), SORT_NO;
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
commit;





-- �� �� ������ ��ü ���ϸ� �˴ϴ�.
-----------------------------------------------<�� �Ʒ��� ���� �׽�Ʈ ���Դϴ�. :>






drop table ta_study_madang;
drop sequence sboard_seq;

-- ���θ���(or Ǯ�̸���)
/* �۾��̰� ������ Ż���Ѵٰ� �Խñ��� �����Ǵ� ��쵵 �幰�⿡ �ܷ�Ű ���� �� �� */
create table ta_study_madang(
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

-- ���θ���(Ǯ�̸���)
create sequence sboard_seq 
start with 1
increment by 1
maxvalue 999999;



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