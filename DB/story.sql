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

    COMMENT ON COLUMN "TA_STORY"."STORY_NO" IS '게시글번호';
    COMMENT ON COLUMN "TA_STORY"."STORY_STUDENT_PICTURE" IS '학생사진';
   COMMENT ON COLUMN "TA_STORY"."STORY_WRITE" IS '게시글작성자 아이디';
   COMMENT ON COLUMN "TA_STORY"."STORY_CONTENT" IS '게시글내용';
   COMMENT ON COLUMN "TA_STORY"."STORY_TIME" IS '작성시간';
    COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_NAME" IS '강사이름';
   COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_PICTURE" IS '강사사진';
  
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
   
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'kimyerim.jpg', '김예림', '우리 예리쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요!
  <br>또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!! ', DEFAULT, '예리 미나', 'yerimina.jpg','eng');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'nalgangdo.jpg', '날강두', '코딩을 배워보고싶어 스터디에 등록을 했는데 등록금을 77ㅓ억해버리셨습니다 ', DEFAULT, '산체스', 'Sanchez.jpg','cod');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'leejieun.jpg', '이지은', '아이유 리더 정말 강추합니다!!
                                <br>발음도 완전 좋으시고 미모도 훌륭하셔요~
                                <br>무엇보다 수업이 지루할 틈도 없게 즐겁고 활기차게 이끌어주십니다.
                                <br>중국어에 대한 거부감과 두려움이 많이 사라졌어요.
                                <br>바쁜 프로젝트 끝내고 아이유 리더님 수업 또 들을 예정이에요~^^ ', DEFAULT, '안드레아이유', 'Andr? Ayew.jpg','cha');
SELECT * FROM TA_STORY ORDER BY STORY_NO DESC;
        delete from TA_STORY where STORY_TEACHER_NAME = '안드레아이유';
    
      DROP SEQUENCE SEQ_STORY_NO;
      CREATE TABLE temp AS SELECT STORY_NO,STORY_STUDNET_PICTURE, STORY_WRITE,STORY_CONTENT,STORY_TIME,STORY_TEACHER_NAME,STORY_TEACHER_PICTURE FROM TA_STORY;
  

     DELETE FROM TA_STORY;

    RENAME temp TO TA_STORY;
     DROP TABLE TA_STORY; 
       COMMIT;
      SELECT * FROM ALL_COL_COMMENTS WHERE TABLE_NAME='TA_FREE_MADANG';






     Select * from TA_STORY WHERE STORY_SUBJECT = 'eng';