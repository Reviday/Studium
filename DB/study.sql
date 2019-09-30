--내거 디비 
--마이캘린더
create sequence seq_mycalendar
start with 1
increment by 1;
--캘린더
create table my_calendar(
    edit_no number primary key, --시퀀스 넘버 
    mem_no number,  --회원번호 
    mem_name varchar(20) , --회원 이름
    edit_title varchar(30), --일정 이름 
    edit_start Date,  --시작날짜
    edit_end Date, --끝날짜 
    edit_color varchar(20), --색깔 
    edit_desc varchar(2000) --상세설명
);
--fsutdy
create sequence seq_fstudy
start with 1
increment by 1
maxvalue 999;
select * from f_study;
select seq_fstudy.nextval from dual;
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
    f_studyMember number default 0,--스터디 구매 확정 멤버 넘버 
    f_teacherno number --스터디 강사 넘버
);
insert into F_study values(seq_fstudy.nextval,'나만 믿어라','2','강남','주말',10,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/10/30',5,'혜교','Y',default,20007);
insert into F_study values(seq_fstudy.nextval,'언제까지 못할꺼야','2','신촌','주말',10,'고급언어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/11/28','19/12/30',5,'예슬','Y',default,20003);
insert into F_study values(seq_fstudy.nextval,'무료스터디디','2','분당','평일',10,'저급언어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/11/15','19/12/30',5,'Hannah','Y',default,20001);
insert into F_study values(seq_fstudy.nextval,'배운건 복습','2','역삼','주말',10,'중국어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/12/15',5,'재욱','Y',default,20004);
insert into F_study values(seq_fstudy.nextval,'TEST F STUDY','2','역삼','주말',10,'중국어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/10/15','19/12/30',5,'박진영','Y',default,20010);
--강사스터디
create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;

create table p_study(
    p_no number primary key, --스터디 번호
    p_title varchar2(100), --스터디 타이틀
    p_name varchar2(100), --스터디 이름
    p_area varchar2(100), --스터디 지역
    P_day  varchar2(100), --스터디 평일,주말
    p_studyperson number, --스터디 인원
    p_price number, --스터디 가격
    p_category varchar2(100),--스터디 카테고리
    p_intro1 varchar2(1000), --스터디 소개 1
    p_intro2 varchar2(1000), --스터기 소개 2
    p_imgtitle varchar(225), --이미지 타이틀
    p_img1 varchar2(255), --이미지 1
    p_img2 varchar2(255), --이미지 2
    p_img3 varchar2(255), --이미지 3
    p_timestart varchar(100), --스터디 시간 시작
    P_timeend varchar(100), --스터디 시간 끝
    p_datestart date default sysdate not null, --시작 날짜
    p_dateend date not null, --끝날짜
    p_like number default 0, --좋아요
    p_teachername varchar(100) default null, --강사 이름 
    p_status varchar(20) default 'Y', --보이는 용도 delete 안씀 
    p_studyMember number default 0,--스터디 구매 확정 멤버 넘버 
    p_teacherno number --스터디 강사 넘버
);
--강사스터디 더미데이터
insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','역삼','주말',10,20,'중국어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/12/28','19/12/30',5,'아이린','Y',default,15);

insert into p_study values(101,'Hannah 쌤과 스피킹','Exciting speaking','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_1.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Hannah','Y', 8,20001 );

insert into p_study values(102,'놀면서 영어배워요! ','Justin 쌤과 즐거운 스피킹, 놀면서 영어할래?','역삼','주말',8,120000,'영어','I love reading, writing, watching movies and TV shows. All kinds of sports, specially football, mixed martial arts, cycling, hiking, gym & skateboarding. Love playing drums and the Ukulele, and listen to all kinds of music.',
'I graduated from an International school, and I attended acting school in New York City','t_2.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Justin','Y', 8,20002 );

--스토리 시퀀스
 CREATE SEQUENCE SEQ_STORY_NO
   START WITH 1 
   INCREMENT BY 1 
   NOMINVALUE 
   NOMAXVALUE 
   NOCYCLE
   NOCACHE; 
--스토리 테이블
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
      "STORY_STAR" number
      );
--더미데이터
INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10000,1,'a1.jpg', '김예림', '우리 예리쌤 너무 이쁘고 완벽한 발음으로 진짜 현지에서 쓰는 영어를 가르쳐주셨어요! 또한 엄청난 인싸력으로 재밌는 행사 만들어주셔서 너무 좋았습니다!! ', DEFAULT, '예리 미나', 'i2.jpg','English','5');