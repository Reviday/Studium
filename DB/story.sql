SELECT * FROM tab;

commit;
SELECT * FROM TA_STORY;
DROP TABLE TA_STORY;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '�����Ѱ�����';

CREATE TABLE TA_STORY(
    "STORY_NO" NUMBER PRIMARY KEY, 
      "STORY_STUDENT_PICTURE" VARCHAR2(100), 
      "STORY_WRITE" VARCHAR2(30), 
      "STORY_CONTENT" VARCHAR2(3000),
      "STORY_TIME" TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
       "STORY_TEACHER_NAME" VARCHAR2(30),
      "STORY_TEACHER_PICTUER" VARCHAR2(100),
      "STORY_SUBJECT" VARCHAR2(40)
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
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'kimyerim.jpg', '�迹��', '�츮 ������ �ʹ� �̻ڰ� �Ϻ��� �������� ��¥ �������� ���� ��� �������ּ̾��!
  <br>���� ��û�� �νη����� ��մ� ��� ������ּż� �ʹ� ���ҽ��ϴ�!! ', DEFAULT, '���� �̳�', 'yerimina.jpg','English');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'nalgangdo.jpg', '������', '�����ͺ��̽��� �������;� ���͵� ����� �ߴµ� ��ϱ��� 77�þ��ع����̽��ϴ� ', DEFAULT, '��ü��', 'Sanchez.jpg','Database');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'leejieun.jpg', '������', '������ ���� ���� �����մϴ�!!<br>������ ���� �����ð� �̸� �Ǹ��ϼſ�~<br>�������� ������ ������ ƴ�� ���� ��̰� Ȱ������ �̲����ֽʴϴ�.<br>�߱�� ���� �źΰ��� �η����� ���� ��������.<br>�ٻ� ������Ʈ ������ ������ ������ ���� �� ���� �����̿���~^^ ', DEFAULT, '�ȵ巹������', 'Andr? Ayew.jpg','Chinese');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'choijinri.jpg','������','������ ���п� 12�ְ� �ʹ� ��̰� �Ҿ ����� �� �� �η�������� ����<br> ���� ������ ���͵� ���� ��ſ���! ��ȸ�� ��´ٸ� �ٽ� �ϰ� ���� �������ϴ�<br> �������� ȸȭ ǥ������ �η�η� �����鼭 �ϻ� ȸȭ �Ӹ� �ƴ϶� ������ ���ǵ� �� �� �ְ� �Ǿ���� ��ο��� ��õ�մϴ�! ', DEFAULT, '�����˸���Ÿ��', 'SulleyAliMuntari.jpg','French');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'Cjam.PNG','����','�����Ͽ� �ѹ������� ���� ���� ������ �Ǿ����ϴ�.
������ �Ϻ��� ��ȭ�� ���Ҷ� �������� �׷��� ������ �ڽŰ��� ������!
������ ģ��ó�� ����ϰ� �����ְ� ����κб��� �� �˷��ּż� �ʹ� ���ҽ��ϴ�!! ���� ���� �Ϻ�� ���� ������ ����ϴ� �����մϴ� �������K���� ', DEFAULT, '�����̸��', 'MoMo.PNG','Japanese');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, ' MellowFrog.jpg','�����Ѱ�����','�������� ������ ���� �հ��߾��! ������ ���� �հ��� ������ ���ð����� �հݵ� ������ �츮 ��� �� ���� �� �� ��  ', DEFAULT, '���漮', 'seo.jpg','LocalOfficial');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, ' MellowFrog.jpeg','�����Ѱ�����','������ ���� �հ��� ������  ', DEFAULT, '���漮', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'frog.jpg','������','����������� �ҽ��ؼ� ���� �߸��ؼ� ������ ���� ������ ���� �ߴµ� ������ ���п� ���� �������� �ڽŰ��� ������ ', DEFAULT, '���漮', 'seo.jpg','Interview');


     
    


     

DECLARE
    v_cnt   NUMBER := 1;
    v_str   VARCHAR2(10) := NULL;
BEGIN
    WHILE v_cnt < 5 LOOP
        v_str := v_str || '*';
        dbms_output.put_line(v_str);
        v_cnt := v_cnt + 1;
    END LOOP;
END;

select * from all_source where name = upper('');





     