SELECT * FROM tab;

commit;
SELECT * FROM TA_STORY;
DROP TABLE TA_STORY;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '������';




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
       "STORY_STAR" NUMBER
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
   Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese');
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,1,'kimyerim.jpg', '�迹��', '�츮 ������ �ʹ� �̻ڰ� �Ϻ��� �������� ��¥ �������� ���� ��� �������ּ̾��! ���� ��û�� �νη����� ��մ� ��� ������ּż� �ʹ� ���ҽ��ϴ�!! ', DEFAULT, '���� �̳�', 'yerimina.jpg','English','5');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,2, 'nalgangdo.jpg', '������', '�����ͺ��̽��� �������;� ���͵� ����� �ߴµ� ��ϱ��� 77�þ��ع����̽��ϴ� ', DEFAULT, '��ü��', 'Sanchez.jpg','Database','1');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,3, 'leejieun.jpg', '������', '������ ���� ���� �����մϴ�!!������ ���� �����ð� �̸� �Ǹ��ϼſ�~�������� ������ ������ ƴ�� ���� ��̰� Ȱ������ �̲����ֽʴϴ�.�߱�� ���� �źΰ��� �η����� ���� ��������.�ٻ� ������Ʈ ������ ������ ������ ���� �� ���� �����̿���~^^ ', DEFAULT, '�ȵ巹������', 'Andr? Ayew.jpg','Chinese','5');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,4, 'choijinri.jpg','������','������ ���п� 12�ְ� �ʹ� ��̰� �Ҿ ����� �� �� �η�������� ���� ���� ������ ���͵� ���� ��ſ���! ��ȸ�� ��´ٸ� �ٽ� �ϰ� ���� �������ϴ� �������� ȸȭ ǥ������ �η�η� �����鼭 �ϻ� ȸȭ �Ӹ� �ƴ϶� ������ ���ǵ� �� �� �ְ� �Ǿ���� ��ο��� ��õ�մϴ�! ', DEFAULT, '�����˸���Ÿ��', 'SulleyAliMuntari.jpg','French','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,5, 'Cjam.PNG','����','�����Ͽ� �ѹ������� ���� ���� ������ �Ǿ����ϴ�.������ �Ϻ��� ��ȭ�� ���Ҷ� �������� �׷��� ������ �ڽŰ��� ������!������ ģ��ó�� ����ϰ� �����ְ� ����κб��� �� �˷��ּż� �ʹ� ���ҽ��ϴ�!! ���� ���� �Ϻ�� ���� ������ ����ϴ� �����մϴ� �������K���� ', DEFAULT, '�����̸��', 'MoMo.PNG','Japanese','5');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,6, 'MellowFrog.jpg','�����Ѱ�����','�������� ������ ���� �հ��߾��! ������ ���� �հ��� ������ ���ð����� �հݵ� ������ �츮 ��� �� ���� �� �� ��  ', DEFAULT, '���漮', 'seo.jpg','LocalOfficial','4');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'MellowFrog.jpeg','�����Ѱ�����','������ ���� �հ��� ������  ', DEFAULT, '���漮', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,7, 'frog.jpg','������','����������� �ҽ��ؼ� ���� �߸��ؼ� ������ ���� ������ ���� �ߴµ� ������ ���п� ���� �������� �ڽŰ��� ������ ', DEFAULT, '���漮', 'seo.jpg','Interview','3');


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

insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','����','�ָ�',10,20,'����','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','����� ���� ������� �ʽ��ϴ�. ������ ���� �ּ��� ���� ���� ���� �ʴ´ٸ� ���������� ���� �� �������� ����� ��� �� �̻����� ������ ���̰� ���ư� IT�о� �������μ� źź�� ����� ���� ����� �� ���Դϴ�.
���� �ϰ� ���� ������! �������� �� �� �ֽ��ϴ�','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'������',DEFAULT, 8,1);