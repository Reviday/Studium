select * from tab;
drop table my_dibs;
drop table my_purchase;


--���ὺ�͵� db
create table f_study(
    f_no number constraint fstudy_pk primary key, --���͵� ��ȣ
    f_title varchar2(30), --���͵� Ÿ��Ʋ
    f_name varchar2(30), --���͵� �̸�
    f_area varchar2(30), --���͵� ����
    f_day  varchar2(30), --���͵� ����,�ָ�
    f_studyperson number, --���͵� �ο�
    f_category varchar2(15),--���͵� ī�װ�
    f_intro1 varchar2(1000), --���͵� �Ұ� 1
    f_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    f_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    f_img1 varchar2(255), --�̹��� 1
    f_img2 varchar2(255), --�̹��� 2
    f_img3 varchar2(255), --�̹��� 3
    f_timestart varchar(30), --���͵� �ð� ����
    f_timeend varchar(30), --���͵� �ð� ��
    f_datestart date default sysdate not null, --���� ��¥
    f_dateend date not null, --����¥
    f_like number default 0, --���ƿ�
    f_readername varchar(30) default null --���� �̸� 
);


create sequence seq_fstudy
start with 1
increment by 1
maxvalue 999;

create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;


rollback;
commit;
select seq_pstudy.nextval from dual;
select * from p_study;
select * from tab;
drop sequence seq_pstudy;

);
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');
insert into p_study values(seq_pstudy.nextval,'1','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������');

--���ὺ�͵� ���̵�����
insert into f_study values(seq_fstudy.nextval,'1','2','����','�ָ�',10,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'1');





select * from tab;
drop table my_dibs;
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
increment by 1
maxvalue 999;

--�����̺� ���̵�����
insert into my_dibs values(seq_my_dibs.nextval,10001,44,null,sysdate);
insert into my_dibs values(seq_my_dibs.nextval,10001,null,1,sysdate);
--���Ÿ��
DROP TABLE MY_PURCHASE;
CREATE TABLE MY_PURCHASE(
    PUR_ID NUMBER PRIMARY KEY,--���Ź�ȣ
    mem_no number constraint PUR_mem_no_fk references ta_member(mem_no), -- ������ ȸ�� ��ȣ
    p_no number default null constraint PUR_p_study_fk references p_study(p_no), -- ������ ���罺�͵� ��ȣ
    PURCHASE_DATE DATE, --���� ��¥
    PURCHASE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CK CHECK (PURCHASE_STATUS IN ('N','Y')),--���͵� ���࿩��/������Y, �Ϸ�N
    SUBMIT_FILE CHAR(1) DEFAULT 'N' CONSTRAINT SUBMIT_FILE_CK CHECK (SUBMIT_FILE IN ('N','Y'))--���⼭���߱�����/������Y,�������N
);
--���Ž�����
create sequence seq_my_purchase
start with 1
increment by 1;
--�������̺� ���̵���Ÿ
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10001,44,SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10002,44,SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10002,45,SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10003,46,SYSDATE,'Y','N');

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
select * from ta_member;
update ta_member set mem_email='aaa@naver.com' where mem_no=10001;
select * from tab;


-- category ��з� ���̺�
drop table category_s;
drop table category_m;
DROP TABLE CATEGORY_B;
CREATE TABLE CATEGORY_B(
    CATEGORY_B_ID VARCHAR2(10) PRIMARY KEY, --ī�װ����̵�
    TITLE_B VARCHAR2(30) DEFAULT 'N' NOT NULL--ī�װ� �̸�
);
--��з� ������
INSERT INTO CATEGORY_B VALUES('CB1','�ܱ���');
INSERT INTO CATEGORY_B VALUES('CB2','���α׷���');
INSERT INTO CATEGORY_B VALUES('CB3','������');
INSERT INTO CATEGORY_B VALUES('CB4','�ڰ���');
INSERT INTO CATEGORY_B VALUES('CB5','����غ�');
--�ߺз� ���̺�
CREATE TABLE CATEGORY_M(
    CATEGORY_M_ID VARCHAR2(10) PRIMARY KEY, --ī�װ����̵�
    CATEGORY_B_ID VARCHAR2(10) REFERENCES CATEGORY_B(CATEGORY_B_ID),--��з����̺�����
    TITLE_M VARCHAR2(30) DEFAULT 'N' NOT NULL --ī�װ� �̸�
);
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



SELECT * FROM CATEGORY_B;
SELECT * FROM CATEGORY_M;
SELECT * FROM CATEGORY_S;
SELECT * FROM ta_member;

--�����ȸ
select *
from category_s
join category_m using(category_m_id)
join category_B using(category_b_id);

select * 
from category_s
join category_m using(category_m_id)
join category_B using(category_b_id)

group by category_m_id;

update ta_member set mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==' where mem_email='aaa@naver.com';
commit;


update ta_member set mem_birth='2019-09-10';