SELECT * FROM tab;

commit;
SELECT * FROM ta_story;
SELECT * FROM P_STUDY;
DROP TABLE ta_story;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '������';
   
select * from p_study where P_TITLE='Hannah �ܰ� ����ŷ';



CREATE TABLE TA_STORY(
     
    STORY_NO NUMBER PRIMARY KEY, 
    MEM_NO number references TA_MEMBER(MEM_NO), -- ������ ȸ�� ��ȣ
    P_NO number references P_STUDY(P_NO), -- ������ ���罺�͵� ��ȣ
    P_TITLE varchar2(100), --���͵� Ÿ��Ʋ
    STORY_STUDENT_PICTURE VARCHAR2(100), -- 
    STORY_WRITE VARCHAR2(30), 
    STORY_CONTENT VARCHAR2(3000),
    STORY_TIME TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
    STORY_TEACHER_NAME VARCHAR2(30),
    STORY_TEACHER_PICTUER VARCHAR2(100),
    STORY_SUBJECT VARCHAR2(40),
    STORY_STAR NUMBER
      );

    COMMENT ON COLUMN "TA_STORY"."STORY_NO" IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN "TA_STORY"."STORY_STUDENT_PICTURE" IS '�л�����';
   COMMENT ON COLUMN "TA_STORY"."STORY_WRITE" IS '�Խñ��ۼ��� ���̵�';
   COMMENT ON COLUMN "TA_STORY"."STORY_CONTENT" IS '�Խñ۳���';
   COMMENT ON COLUMN "TA_STORY"."STORY_TIME" IS '�ۼ��ð�';
    COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_NAME" IS '�����̸�';
   COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_PICTURE" IS '�������';
  
   CREATE SEQUENCE SEQ_STORY_NO
   START WITH 1 
   INCREMENT BY 1 
   NOMINVALUE 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE; 
   SELECT * FROM TA_MEMBER;
   Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese');
 INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20011,103,'���� �ܰ� ���͵�','s_1.jpg', '����', '�츮 ������ �ʹ� �̻ڰ� �Ϻ��� �������� ��¥ �������� ���� ��� �������ּ̾��! ���� ��û�� �νη����� ��մ� ��� ������ּż� �ʹ� ���ҽ��ϴ�!! ', DEFAULT, '����', 't_3.jpg','����','5');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20012,111,'���Կ��ִ� �˰���','s_2.jpg', '����', '�˰����� �������;� ���͵� ����� �ߴµ� ��ϱ��� 77�þ��ع����̽��ϴ� ', DEFAULT, '������', 't_10.jpg','�˰���','1');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20013,104,'��� �ܰ� �߱������', 's_3.jpg', '����', '��� ���� ���� �����մϴ�!!������ ���� �����ð� �ܸ� �Ǹ��ϼſ�~�������� ������ ������ ƴ�� ���� ��̰� Ȱ������ �̲����ֽʴϴ�.�߱�� ���� �źΰ��� �η����� ���� ��������.�ٻ� ������Ʈ ������ ��� ������ ���� �� ���� �����̿���~^^ ', DEFAULT, '���', 't_4.jpg','�߱���','5');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20014,102,'hannah �ܰ� ����ŷ', 's_4.jpg','����','������ ���п� 12�ְ� �ʹ� ��̰� ��� ����� �� �� �η�������� ����  Hannah ������ ���͵� ���� ��ſ���! ��ȸ�� ��´ٸ� �ٽ� �ϰ� ���� �������ϴ� �������� ȸȭ ǥ������ �η�η� �����鼭 �ϻ� ȸȭ �Ӹ� �ƴ϶� ������ ���ǵ� �� �� �ְ� �Ǿ���� ��ο��� ��õ�մϴ�! ', DEFAULT, 'Hannah', 't_1.jpg','����','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20015,108,'����ܰ� �Բ� ����','s_5.jpg','����','�����Ͽ� �ѹ������� ���� ���� ������ �Ǿ����ϴ�.������ ���� ��ȭ�� ���Ҷ� �������� �׷��� ������ �ڽŰ��� ������!������� ģ��ó�� ����ϰ� �����ְ� ����κб��� �� �˷��ּż� �ʹ� ���ҽ��ϴ�!! ���� ���� ��� ���� ������ ����ϴ� �����մϴ� �������K���� ', DEFAULT, '����', 't_8.jpg','����','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20016,107,'�������͵�','s_6.jpg','��ȯ','����������� �ҽ��ؼ� ���� �߸��ؼ� ������ ���� ������ ���� �ߴµ� ������ ���п� ���� �������� �ڽŰ��� ������', DEFAULT, '����', 't_7.jpg','����','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20017,109,'����ó����� ����', 's_7.jpg','����','��Ľܿ� ������ ���Ƿ� ����ó����� �ڰ��� ȹ�濡 �����߾�� ����ó������ڰ��� ����� ���Ͻô� �е��� ��Ľ� ���� ��õ�帳�ϴ� ', DEFAULT, '���', 't_9.jpg','��������ڰ���','5');



INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20016,6, 'MellowFrog.jpg','�����Ѱ�����','�������� ������ ���� �հ��߾��! ������ ���� �հ��� ������ ���ð����� �հݵ� ������ �츮 ��� �� ���� �� �� ��  ', DEFAULT, '���漮', 'seo.jpg','LocalOfficial','5');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'MellowFrog.jpeg','�����Ѱ�����','������ ���� �հ��� ������  ', DEFAULT, '���漮', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,7, 'frog.jpg','������','����������� �ҽ��ؼ� ���� �߸��ؼ� ������ ���� ������ ���� �ߴµ� ������ ���п� ���� �������� �ڽŰ��� ������ ', DEFAULT, '���漮', 'seo.jpg','Interview','5');


Select count(*) from TA_STORY WHERE STORY_SUBJECT IN ('AptitudeTest',' NCS','Interview','Document');    
Select count(*) from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese','Japanese','Spanish','French','OtherLanguages');    
SELECT COUNT(*) FROM TA_STORY; 

     





Select * from TA_STORY WHERE STORY_SUBJECT IN ('StateOfficial','LocalOfficial','SeoulPublicOfficials');

Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese','Japanese','Spanish','French','OtherLanguages') ORDER BY STORY_TIME DESC; 
SELECT STORY_TIME FROM TA_STORY ORDER BY STORY_TIME DESC;  



--���罺�͵�
create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;

select * from ta_member;
select * from p_study;
select * from f_study;
select * from ta_story;

create table p_study(
    p_no number primary key, --���͵� ��ȣ
    p_title varchar2(30), --���͵� Ÿ��Ʋ
    p_name varchar2(30), --���͵� �̸�
    p_area varchar2(30), --���͵� ����
    P_day  varchar2(30), --���͵� ����,�ָ�
    p_studyperson number, --���͵� �ο�
    p_price number, --���͵� ����
    p_category varchar2(30),--���͵� ī�װ�
    p_intro1 varchar2(1000), --���͵� �Ұ� 1
    p_intro2 varchar2(1000), --���ͱ� �Ұ� 2
    p_imgtitle varchar(225), --�̹��� Ÿ��Ʋ
    p_img1 varchar2(255), --�̹��� 1
    p_img2 varchar2(255), --�̹��� 2
    p_img3 varchar2(255), --�̹��� 3
    p_timestart varchar(30), --���͵� �ð� ����
    P_timeend varchar(30), --���͵� �ð� ��
    p_datestart date default sysdate not null, --���� ��¥
    p_dateend date not null, --����¥
    p_like number default 0, --���ƿ�
    p_teachername varchar(30) default null, --���� �̸� 
    p_status varchar(20) default 'Y', --���̴� �뵵 delete �Ⱦ� 
    p_studyMember number default 0,--���͵� ���� Ȯ�� ��� �ѹ� 
    p_teacherno number --���͵� ���� �ѹ�
);     

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

insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������',DEFAULT, 8,1);