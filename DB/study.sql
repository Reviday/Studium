--���� ��� 
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
select * from f_study;
select seq_fstudy.nextval from dual;
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
    f_studyMember number default 0,--���͵� ���� Ȯ�� ��� �ѹ� 
    f_teacherno number --���͵� ���� �ѹ�
);
insert into F_study values(seq_fstudy.nextval,'���� �Ͼ��','2','����','�ָ�',10,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/10/30',5,'����','Y',default,20007);
insert into F_study values(seq_fstudy.nextval,'�������� ���Ҳ���','2','����','�ָ�',10,'��޾��','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/11/28','19/12/30',5,'����','Y',default,20003);
insert into F_study values(seq_fstudy.nextval,'���ὺ�͵��','2','�д�','����',10,'���޾��','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/11/15','19/12/30',5,'Hannah','Y',default,20001);
insert into F_study values(seq_fstudy.nextval,'���� ����','2','����','�ָ�',10,'�߱���','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/12/15',5,'���','Y',default,20004);
insert into F_study values(seq_fstudy.nextval,'TEST F STUDY','2','����','�ָ�',10,'�߱���','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/10/15','19/12/30',5,'������','Y',default,20010);
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
--���罺�͵� ���̵�����
insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','����','�ָ�',10,20,'�߱���','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/12/28','19/12/30',5,'���̸�','Y',default,15);

insert into p_study values(101,'Hannah �ܰ� ����ŷ','Exciting speaking','����','����',8,120000,'����','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_1.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Hannah','Y', 8,20001 );

insert into p_study values(102,'��鼭 ��������! ','Justin �ܰ� ��ſ� ����ŷ, ��鼭 �����ҷ�?','����','�ָ�',8,120000,'����','I love reading, writing, watching movies and TV shows. All kinds of sports, specially football, mixed martial arts, cycling, hiking, gym & skateboarding. Love playing drums and the Ukulele, and listen to all kinds of music.',
'I graduated from an International school, and I attended acting school in New York City','t_2.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Justin','Y', 8,20002 );

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
--���̵�����
INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,1,'a1.jpg', '�迹��', '�츮 ������ �ʹ� �̻ڰ� �Ϻ��� �������� ��¥ �������� ���� ��� �������ּ̾��! ���� ��û�� �νη����� ��մ� ��� ������ּż� �ʹ� ���ҽ��ϴ�!! ', DEFAULT, '���� �̳�', 'i2.jpg','English','5');