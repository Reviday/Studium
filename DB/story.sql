SELECT * FROM tab;

commit;
SELECT * FROM TA_STORY;
DROP TABLE TA_STORY;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '애잔한개구리';

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

    COMMENT ON COLUMN "TA_STORY"."STORY_NO" IS '게시글번호';
    COMMENT ON COLUMN "TA_STORY"."STORY_STUDENT_PICTURE" IS '학생사진';
   COMMENT ON COLUMN "TA_STORY"."STORY_WRITE" IS '게시글작성자 아이디';
   COMMENT ON COLUMN "TA_STORY"."STORY_CONTENT" IS '게시글내용';
   COMMENT ON COLUMN "TA_STORY"."STORY_TIME" IS '작성시간';
    COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_NAME" IS '강사이름';
   COMMENT ON COLUMN "TA_STORY"."STORY_TEACHER_PICTURE" IS '강사사진';
  
   CREATE SEQUENCE SEQ_STORY_NO
   START WITH 1 
   INCREMENT BY 1 
   NOMINVALUE 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE; 
   Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese');
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'kimyerim.jpg', '김예림', '우리 예리쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요!
  <br>또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!! ', DEFAULT, '예리 미나', 'yerimina.jpg','English');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'nalgangdo.jpg', '날강두', '데이터베이스를 배워보고싶어 스터디에 등록을 했는데 등록금을 77ㅓ억해버리셨습니다 ', DEFAULT, '산체스', 'Sanchez.jpg','Database');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'leejieun.jpg', '이지은', '아이유 리더 정말 강추합니다!!<br>발음도 완전 좋으시고 미모도 훌륭하셔요~<br>무엇보다 수업이 지루할 틈도 없게 즐겁고 활기차게 이끌어주십니다.<br>중국어에 대한 거부감과 두려움이 많이 사라졌어요.<br>바쁜 프로젝트 끝내고 아이유 리더님 수업 또 들을 예정이에요~^^ ', DEFAULT, '안드레아이유', 'Andr? Ayew.jpg','Chinese');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'choijinri.jpg','최진리','리더님 덕분에 12주가 너무 즐겁고 불어를 내뱉는 게 덜 두려워졌어요 ㅎㅎ<br> 설리 리더님 스터디 정말 즐거워요! 기회가 닿는다면 다시 하고 싶을 정도랍니다<br> 발음부터 회화 표현까지 두루두루 익히면서 일상 회화 뿐만 아니라 간단한 토의도 할 수 있게 되었어요 모두에게 추천합니당! ', DEFAULT, '설리알리문타리', 'SulleyAliMuntari.jpg','French');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'Cjam.PNG','씨잼','일주일에 한번이지만 정말 많은 도움이 되었습니다.
아직도 일본어 대화로 말할때 떨리지만 그래도 조금은 자신감이 생겼어요!
모모쌤이 친구처럼 편안하게 대해주고 쉬운부분까지 잘 알려주셔서 너무 좋았습니다!! 저의 얕은 일본어에 많음 도움을 줬습니다 감사합니다 ㅎ하하핳ㅎㅎ ', DEFAULT, '히라이모모', 'MoMo.PNG','Japanese');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, ' MellowFrog.jpg','애잔한개구리','에듀윌로 공무원 시험 합격했어요! 공무원 시험 합격은 에듀윌 주택관리사 합격도 에듀윌 우리 모두 다 같이 에 듀 윌  ', DEFAULT, '서경석', 'seo.jpg','LocalOfficial');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, ' MellowFrog.jpeg','애잔한개구리','공무원 시험 합격은 에듀윌  ', DEFAULT, '서경석', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'frog.jpg','개구리','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요 ', DEFAULT, '서경석', 'seo.jpg','Interview');


     
    


     

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





     