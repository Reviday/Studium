SELECT * FROM tab;

SELECT * FROM TA_MEMBER;
SELECT * FROM TA_FREE_MADANG;

SELECT * FROM TA_STORY;
DROP TABLE TA_STORY;

CREATE TABLE TA_STORY(
    "STORY_NO" NUMBER PRIMARY KEY, 
      "STORY_STUDENT_PICTURE" VARCHAR2(100), 
      "STORY_WRITE" VARCHAR2(30), 
      "STORY_CONTENT" VARCHAR2(3000),
      "STORY_TIME" TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
       "STORY_TEACHER_NAME" VARCHAR2(30),
      "STORY_TEACHER_PICTUER" VARCHAR2(100) 
      );
commit;
select * from TA_member;

    COMMENT ON COLUMN "TA_STORY"."STORY_NO" IS '�Խñ۹�ȣ';
    COMMENT ON COLUMN "TA_STORY"."STORY_STUDENT_PICTURE" IS '�л�����';
   COMMENT ON COLUMN "TA_STORY"."STORY_WRITE" IS '�Խñ��ۼ��� ���̵�';
   COMMENT ON COLUMN "TA_STORY"."STORY_CONTENT" IS '�Խñ۳���';
   COMMENT ON COLUMN "TA_STORY"."STORY_TIME" IS '�ۼ��ð�';
    COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_NAME" IS '�����̸�';
   COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_PICTURE" IS '�������';
  
   commit;
 ALTER TABLE TA_STORY ADD(STORY_SUBJECT VARCHAR2(40)); 
Select * from TA_STORY WHERE STORY_SUBJECT = 'eng';

      select * from TA_STORY;
   CREATE SEQUENCE SEQ_STORY_NO
   START WITH 1 
   INCREMENT BY 1 
   NOMINVALUE 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE; 
   
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'kimyerim.jpg', '�迹��', '�츮 ������ �ʹ� �̻ڰ� �Ϻ��� �������� ��¥ �������� ���� ��� �������ּ̾��!
  <br>���� ��û�� �νη����� ��մ� ��� ������ּż� �ʹ� ���ҽ��ϴ�!! ', DEFAULT, '���� �̳�', 'yerimina.jpg','eng');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'nalgangdo.jpg', '������', '�ڵ��� �������;� ���͵� ����� �ߴµ� ��ϱ��� 77�þ��ع����̽��ϴ� ', DEFAULT, '��ü��', 'Sanchez.jpg','cod');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'leejieun.jpg', '������', '������ ���� ���� �����մϴ�!!
                                <br>������ ���� �����ð� �̸� �Ǹ��ϼſ�~
                                <br>�������� ������ ������ ƴ�� ���� ��̰� Ȱ������ �̲����ֽʴϴ�.
                                <br>�߱�� ���� �źΰ��� �η����� ���� ��������.
                                <br>�ٻ� ������Ʈ ������ ������ ������ ���� �� ���� �����̿���~^^ ', DEFAULT, '�ȵ巹������', 'Andr? Ayew.jpg','cha');
SELECT * FROM TA_STORY ORDER BY STORY_NO DESC;
        delete from TA_STORY where STORY_TEACHER_NAME = '�ȵ巹������';
    
      DROP SEQUENCE SEQ_STORY_NO;
      CREATE TABLE temp AS SELECT STORY_NO,STORY_STUDNET_PICTURE, STORY_WRITE,STORY_CONTENT,STORY_TIME,STORY_TEACHER_NAME,STORY_TEACHER_PICTURE FROM TA_STORY;
  

     DELETE FROM TA_STORY;

    RENAME temp TO TA_STORY;
     DROP TABLE TA_STORY; 
       COMMIT;
      SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME='TA_FREE_MADANG';






     Select * from TA_STORY WHERE STORY_SUBJECT = 'eng';