SELECT * FROM tab;

commit;
SELECT * FROM TA_STORY;
DROP TABLE TA_STORY;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '최진리';




CREATE TABLE TA_STORY(
     
    "STORY_NO" NUMBER PRIMARY KEY, 
     "mem_no" number references ta_member(mem_no), -- 구매한 회원 번호
    "p_no" number references p_study(p_no), -- 구매한 강사스터디 번호
      "STORY_STUDENT_PICTURE" VARCHAR2(100), 
      "STORY_WRITE" VARCHAR2(30), 
      "STORY_CONTENT" VARCHAR2(3000),
      "STORY_TIME" TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
       "STORY_TEACHER_NAME" VARCHAR2(30),
      "STORY_TEACHER_PICTUER" VARCHAR2(100),
      "STORY_SUBJECT" VARCHAR2(40),
       "STORY_STAR" NUMBER
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
  INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,1,'kimyerim.jpg', '김예림', '우리 예리쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요! 또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!! ', DEFAULT, '예리 미나', 'yerimina.jpg','English','5');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,2, 'nalgangdo.jpg', '날강두', '데이터베이스를 배워보고싶어 스터디에 등록을 했는데 등록금을 77ㅓ억해버리셨습니다 ', DEFAULT, '산체스', 'Sanchez.jpg','Database','1');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,3, 'leejieun.jpg', '이지은', '아이유 리더 정말 강추합니다!!발음도 완전 좋으시고 미모도 훌륭하셔요~무엇보다 수업이 지루할 틈도 없게 즐겁고 활기차게 이끌어주십니다.중국어에 대한 거부감과 두려움이 많이 사라졌어요.바쁜 프로젝트 끝내고 아이유 리더님 수업 또 들을 예정이에요~^^ ', DEFAULT, '안드레아이유', 'Andr? Ayew.jpg','Chinese','5');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,4, 'choijinri.jpg','최진리','리더님 덕분에 12주가 너무 즐겁고 불어를 내뱉는 게 덜 두려워졌어요 ㅎㅎ 설리 리더님 스터디 정말 즐거워요! 기회가 닿는다면 다시 하고 싶을 정도랍니다 발음부터 회화 표현까지 두루두루 익히면서 일상 회화 뿐만 아니라 간단한 토의도 할 수 있게 되었어요 모두에게 추천합니당! ', DEFAULT, '설리알리문타리', 'SulleyAliMuntari.jpg','French','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,5, 'Cjam.PNG','씨잼','일주일에 한번이지만 정말 많은 도움이 되었습니다.아직도 일본어 대화로 말할때 떨리지만 그래도 조금은 자신감이 생겼어요!모모쌤이 친구처럼 편안하게 대해주고 쉬운부분까지 잘 알려주셔서 너무 좋았습니다!! 저의 얕은 일본어에 많음 도움을 줬습니다 감사합니다 ㅎ하하핳ㅎㅎ ', DEFAULT, '히라이모모', 'MoMo.PNG','Japanese','5');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,6, 'MellowFrog.jpg','애잔한개구리','에듀윌로 공무원 시험 합격했어요! 공무원 시험 합격은 에듀윌 주택관리사 합격도 에듀윌 우리 모두 다 같이 에 듀 윌  ', DEFAULT, '서경석', 'seo.jpg','LocalOfficial','4');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'MellowFrog.jpeg','애잔한개구리','공무원 시험 합격은 에듀윌  ', DEFAULT, '서경석', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,7, 'frog.jpg','개구리','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요 ', DEFAULT, '서경석', 'seo.jpg','Interview','3');


Select count(*) from TA_STORY WHERE STORY_SUBJECT IN ('AptitudeTest',' NCS','Interview','Document');    
Select count(*) from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese','Japanese','Spanish','French','OtherLanguages');    
SELECT COUNT(*) FROM TA_STORY; 

     





Select * from TA_STORY WHERE STORY_SUBJECT IN ('StateOfficial','LocalOfficial','SeoulPublicOfficials');

Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese','Japanese','Spanish','French','OtherLanguages') ORDER BY STORY_TIME DESC; 
SELECT STORY_TIME FROM TA_STORY ORDER BY STORY_TIME DESC;  



--강사스터디
create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;

select * from ta_member;
select * from p_study;
select * from ta_story;

create table p_study(
    p_no number primary key, --스터디 번호
    p_title varchar2(30), --스터디 타이틀
    p_name varchar2(30), --스터디 이름
    p_area varchar2(30), --스터디 지역
    P_day  varchar2(30), --스터디 평일,주말
    p_studyperson number, --스터디 인원
    p_price number, --스터디 가격
    p_category varchar2(30),--스터디 카테고리
    p_intro1 varchar2(1000), --스터디 소개 1
    p_intro2 varchar2(1000), --스터기 소개 2
    p_imgtitle varchar(225), --이미지 타이틀
    p_img1 varchar2(255), --이미지 1
    p_img2 varchar2(255), --이미지 2
    p_img3 varchar2(255), --이미지 3
    p_timestart varchar(30), --스터디 시간 시작
    P_timeend varchar(30), --스터디 시간 끝
    p_datestart date default sysdate not null, --시작 날짜
    p_dateend date not null, --끝날짜
    p_like number default 0, --좋아요
    p_teachername varchar(30) default null, --강사 이름 
    p_status varchar(20) default 'Y', --보이는 용도 delete 안씀 
    p_studyMember number default 0,--스터디 구매 확정 멤버 넘버 
    p_teacherno number --스터디 강사 넘버
);     

insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유',DEFAULT, 8,1);