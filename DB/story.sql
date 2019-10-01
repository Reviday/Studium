SELECT * FROM tab;

commit;
SELECT * FROM ta_story;
SELECT * FROM P_STUDY;
DROP TABLE ta_story;
DELETE FROM TA_STORY;
   delete from TA_STORY where STORY_WRITE = '이지은';
   
select * from p_study where P_TITLE='Hannah 쌤과 스피킹';



CREATE TABLE TA_STORY(
     
    STORY_NO NUMBER PRIMARY KEY, 
    MEM_NO number references TA_MEMBER(MEM_NO), -- 구매한 회원 번호
    P_NO number references P_STUDY(P_NO), -- 구매한 강사스터디 번호
    P_TITLE varchar2(100), --스터디 타이틀
    STORY_STUDENT_PICTURE VARCHAR2(100), -- 
    STORY_WRITE VARCHAR2(30), 
    STORY_CONTENT VARCHAR2(3000),
    STORY_TIME TIMESTAMP DEFAULT TO_CHAR(SYSDATE,'YYYYMMDDHH24MISS'),
    STORY_TEACHER_NAME VARCHAR2(30),
    STORY_TEACHER_PICTUER VARCHAR2(100),
    STORY_SUBJECT VARCHAR2(40),
    STORY_STAR NUMBER
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
   SELECT * FROM TA_MEMBER;
   Select * from TA_STORY WHERE STORY_SUBJECT IN('English','Chinese');
 INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20011,103,'예슬 쌤과 스터디','s_1.jpg', '보라', '우리 예슬쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요! 또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!! ', DEFAULT, '예슬', 't_3.jpg','영어','5');
   INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20012,111,'떠먹여주는 알고리즘','s_2.jpg', '강준', '알고리즘을 배워보고싶어 스터디에 등록을 했는데 등록금을 77ㅓ억해버리셨습니다 ', DEFAULT, '박진영', 't_10.jpg','알고리즘','1');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20013,104,'재욱 쌤과 중국어수업', 's_3.jpg', '주현', '재욱 리더 정말 강추합니다!!발음도 완전 좋으시고 외모도 훌륭하셔요~무엇보다 수업이 지루할 틈도 없게 즐겁고 활기차게 이끌어주십니다.중국어에 대한 거부감과 두려움이 많이 사라졌어요.바쁜 프로젝트 끝내고 재욱 리더님 수업 또 들을 예정이에요~^^ ', DEFAULT, '재욱', 't_4.jpg','중국어','5');
    INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20014,102,'hannah 쌤과 스피킹', 's_4.jpg','진구','리더님 덕분에 12주가 너무 즐겁고 영어를 내뱉는 게 덜 두려워졌어요 ㅎㅎ  Hannah 리더님 스터디 정말 즐거워요! 기회가 닿는다면 다시 하고 싶을 정도랍니다 발음부터 회화 표현까지 두루두루 익히면서 일상 회화 뿐만 아니라 간단한 토의도 할 수 있게 되었어요 모두에게 추천합니당! ', DEFAULT, 'Hannah', 't_1.jpg','영어','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20015,108,'은우쌤과 함께 공부','s_5.jpg','예서','일주일에 한번이지만 정말 많은 도움이 되었습니다.아직도 영어 대화로 말할때 떨리지만 그래도 조금은 자신감이 생겼어요!은우쌤이 친구처럼 편안하게 대해주고 쉬운부분까지 잘 알려주셔서 너무 좋았습니다!! 저의 얕은 영어에 많음 도움을 줬습니다 감사합니다 ㅎ하하핳ㅎㅎ ', DEFAULT, '은우', 't_8.jpg','영어','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20016,107,'면접스터디','s_6.jpg','도환','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요', DEFAULT, '혜교', 't_7.jpg','면접','5');
     INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20017,109,'정보처리기사 공부', 's_7.jpg','우주','우식쌤에 족집게 강의로 정보처리기사 자격증 획득에 성공했어요 정보처리기사자격증 취득을 위하시는 분들은 우식쌤 강력 추천드립니다 ', DEFAULT, '우식', 't_9.jpg','국가기술자격증','5');



INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20016,6, 'MellowFrog.jpg','애잔한개구리','에듀윌로 공무원 시험 합격했어요! 공무원 시험 합격은 에듀윌 주택관리사 합격도 에듀윌 우리 모두 다 같이 에 듀 윌  ', DEFAULT, '서경석', 'seo.jpg','LocalOfficial','5');

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL, 'MellowFrog.jpeg','애잔한개구리','공무원 시험 합격은 에듀윌  ', DEFAULT, '서경석', 'seo.jpg','NationalTechnicalQualificationCertificate');


INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,7, 'frog.jpg','개구리','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요 ', DEFAULT, '서경석', 'seo.jpg','Interview','5');


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
select * from f_study;
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

create table f_study(
    f_no number constraint fstudy_pk primary key, --스터디 번호
    f_title varchar2(100), --스터디 타이틀
    f_name varchar2(100), --스터디 이름
    f_area varchar2(100), --스터디 지역
    f_day  varchar2(100), --스터디 평일,주말
    f_studyperson number, --스터디 인원
    f_category varchar2(100),--스터디 카테고리
    f_intro1 varchar2(1000), --스터디 소개 1
    f_intro2 varchar2(1000), --스터기 소개 2
    f_imgtitle varchar(225), --이미지 타이틀
    f_img1 varchar2(255), --이미지 1
    f_img2 varchar2(255), --이미지 2
    f_img3 varchar2(255), --이미지 3
    f_timestart varchar(100), --스터디 시간 시작
    f_timeend varchar(100), --스터디 시간 끝
    f_datestart date default sysdate not null, --시작 날짜
    f_dateend date not null, --끝날짜
    f_like number default 0, --좋아요
    f_readername varchar(100) default null, --강사 이름 
    f_status varchar(20) default 'Y', --보이는 용도 delete 안씀  
    f_studyMember number default 0,--스터디 구매 확정 멤버 넘버 
    f_teacherno number --스터디 강사 넘버
);

insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유',DEFAULT, 8,1);