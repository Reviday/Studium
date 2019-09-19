select * from tab;
drop table my_dibs;
drop table my_purchase;


--무료스터디 db
create table f_study(
    f_no number constraint fstudy_pk primary key, --스터디 번호
    f_title varchar2(30), --스터디 타이틀
    f_name varchar2(30), --스터디 이름
    f_area varchar2(30), --스터디 지역
    f_day  varchar2(30), --스터디 평일,주말
    f_studyperson number, --스터디 인원
    f_category varchar2(15),--스터디 카테고리
    f_intro1 varchar2(1000), --스터디 소개 1
    f_intro2 varchar2(1000), --스터기 소개 2
    f_imgtitle varchar(225), --이미지 타이틀
    f_img1 varchar2(255), --이미지 1
    f_img2 varchar2(255), --이미지 2
    f_img3 varchar2(255), --이미지 3
    f_timestart varchar(30), --스터디 시간 시작
    f_timeend varchar(30), --스터디 시간 끝
    f_datestart date default sysdate not null, --시작 날짜
    f_dateend date not null, --끝날짜
    f_like number default 0, --좋아요
    f_readername varchar(30) default null --강사 이름 
);


create sequence seq_fstudy
start with 1
increment by 1
maxvalue 999;

create sequence seq_pstudy
start with 1
increment by 1
maxvalue 999;


rollback;
commit;
select seq_pstudy.nextval from dual;
select * from p_study;
select * from tab;
drop sequence seq_pstudy;

);
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');
insert into p_study values(seq_pstudy.nextval,'1','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유');

--무료스터디 더미데이터
insert into f_study values(seq_fstudy.nextval,'1','2','강남','주말',10,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'1');





select * from tab;
drop table my_dibs;
--찜테이블 db
create table my_dibs(
    dibs_id number primary key,--찜번호
    mem_no number constraint mem_no_fk references ta_member(mem_no), -- 회원 번호
    p_no number default null constraint p_study_fk references p_study(p_no), -- 강사스터디 번호
    f_no number default null constraint f_study_fk references f_study(f_no), -- 일반스터디 번호
    scr_datetime date --찜한 날짜
);
--찜테이블 시퀀스
create sequence seq_my_dibs
start with 1
increment by 1
maxvalue 999;

--찜테이블 더미데이터
insert into my_dibs values(seq_my_dibs.nextval,10001,44,null,sysdate);
insert into my_dibs values(seq_my_dibs.nextval,10001,null,1,sysdate);
--구매목록
DROP TABLE MY_PURCHASE;
CREATE TABLE MY_PURCHASE(
    PUR_ID NUMBER PRIMARY KEY,--구매번호
    mem_no number constraint PUR_mem_no_fk references ta_member(mem_no), -- 구매한 회원 번호
    p_no number default null constraint PUR_p_study_fk references p_study(p_no), -- 구매한 강사스터디 번호
    PURCHASE_DATE DATE, --구매 날짜
    PURCHASE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CK CHECK (PURCHASE_STATUS IN ('N','Y')),--스터디 진행여부/진행중Y, 완료N
    SUBMIT_FILE CHAR(1) DEFAULT 'N' CONSTRAINT SUBMIT_FILE_CK CHECK (SUBMIT_FILE IN ('N','Y'))--제출서류발급유무/제출함Y,제출안함N
);
--구매시퀀스
create sequence seq_my_purchase
start with 1
increment by 1;
--구매테이블 더미데이타
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10001,44,SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10002,44,SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10002,45,SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10003,46,SYSDATE,'Y','N');

--TODOLIST테이블
CREATE TABLE TODO_LIST(
    TODO_ID NUMBER PRIMARY KEY,--해야할일 아이디
    mem_no number constraint TODO_MEM_FK references ta_member(mem_no), -- 일정관리할 회원의 번호
    TODO_TITLE varchar2(100) constraint TODO_TITLE_NN not null, -- 글 제목
    TODO_CONTENTS clob constraint TODO_CONTENTS_NN not null, -- 글 내용
    TODO_URL VARCHAR2(100) CONSTRAINT TODO_URL_NN NOT NULL, --알림클릭시 이동주소
    TODO_DATETIME DATE CONSTRAINT TODO_DATE_NN NOT NULL,--일정생성일시
    DATE_DEADLINE DATE CONSTRAINT DATE_DEADLINE_NN NOT NULL,--일정마감일시
    TODO_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT TODO_STATUS_CK CHECK (TODO_STATUS IN ('N','Y')),--일정상태 완료Y,미완료N
    TODO_DATE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT TODO_DATE_STATUS_CK CHECK (TODO_DATE_STATUS IN ('N','Y'))--마감일정이 지났는지에 따른 상태
    
);
select * from ta_member;
update ta_member set mem_email='aaa@naver.com' where mem_no=10001;
select * from tab;


-- category 대분류 테이블
drop table category_s;
drop table category_m;
DROP TABLE CATEGORY_B;
CREATE TABLE CATEGORY_B(
    CATEGORY_B_ID VARCHAR2(10) PRIMARY KEY, --카테고리아이디
    TITLE_B VARCHAR2(30) DEFAULT 'N' NOT NULL--카테고리 이름
);
--대분류 데이터
INSERT INTO CATEGORY_B VALUES('CB1','외국어');
INSERT INTO CATEGORY_B VALUES('CB2','프로그래밍');
INSERT INTO CATEGORY_B VALUES('CB3','공무원');
INSERT INTO CATEGORY_B VALUES('CB4','자격증');
INSERT INTO CATEGORY_B VALUES('CB5','취업준비');
--중분류 테이블
CREATE TABLE CATEGORY_M(
    CATEGORY_M_ID VARCHAR2(10) PRIMARY KEY, --카테고리아이디
    CATEGORY_B_ID VARCHAR2(10) REFERENCES CATEGORY_B(CATEGORY_B_ID),--대분류테이블참조
    TITLE_M VARCHAR2(30) DEFAULT 'N' NOT NULL --카테고리 이름
);
--CB1 (외국어 데이터)
INSERT INTO CATEGORY_M VALUES('CM1','CB1','영어');
INSERT INTO CATEGORY_M VALUES('CM2','CB1','중국어');
INSERT INTO CATEGORY_M VALUES('CM3','CB1','일본어');
INSERT INTO CATEGORY_M VALUES('CM4','CB1','스페인어');
INSERT INTO CATEGORY_M VALUES('CM5','CB1','프랑스어');
INSERT INTO CATEGORY_M VALUES('CM6','CB1','기타언어');


--CB2 (프로그래밍 데이터)
INSERT INTO CATEGORY_M VALUES('CM7','CB2','고급언어');
INSERT INTO CATEGORY_M VALUES('CM8','CB2','저급언어');
INSERT INTO CATEGORY_M VALUES('CM9','CB2','데이터베이스');
INSERT INTO CATEGORY_M VALUES('CM10','CB2','운영체제');
INSERT INTO CATEGORY_M VALUES('CM11','CB2','자료구조');
INSERT INTO CATEGORY_M VALUES('CM12','CB2','알고리즘');
--CB3 (공무원데이터)
INSERT INTO CATEGORY_M VALUES('CM13','CB3','국가직');
INSERT INTO CATEGORY_M VALUES('CM14','CB3','지방직');
INSERT INTO CATEGORY_M VALUES('CM15','CB3','서울직');
--CB4 (자격증 데이터)
INSERT INTO CATEGORY_M VALUES('CM16','CB4','국가기술자격증');
INSERT INTO CATEGORY_M VALUES('CM17','CB4','민간자격증');
--CB5 (취업준비 데이터)
INSERT INTO CATEGORY_M VALUES('CM18','CB5','인적성');
INSERT INTO CATEGORY_M VALUES('CM19','CB5','NCS');
INSERT INTO CATEGORY_M VALUES('CM20','CB5','면접');
INSERT INTO CATEGORY_M VALUES('CM21','CB5','서류');


--소분류 테이블
CREATE TABLE CATEGORY_S(
    CATEGORY_S_ID NUMBER PRIMARY KEY, --카테고리아이디
    CATEGORY_M_ID VARCHAR2(10) REFERENCES CATEGORY_M(CATEGORY_M_ID),--중분류 테이블 참조
    TITLE_S VARCHAR2(30) DEFAULT 'N' NOT NULL UNIQUE --카테고리 이름
);
--소분류 테이블 시퀀스
CREATE SEQUENCE SEQ_CATEGORY
START WITH 1
INCREMENT BY 1;

--소분류 테이블 데이터
--CM1(영어)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOEICSPEAKING');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOEIC');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','TOFLE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','IELTS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM1','OPIC');
--CM2(중국어)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM2','HSK');
--CM3(일본어)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM3','JSK');
--CM7(고급언어)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','JAVA');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','C');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','C++/C#');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','PYTHON');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','PHP');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','HTML/CSS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM7','JAVASCRIPT');
--CM8(기계언어)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM8','어셈블리어');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM8','기계어');
--CM9(데이터베이스)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','ORACLE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','MYSQL');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','POSTGRE');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','몽고디비');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM9','카산드라');
--CM10(운영체제)
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','WINDOWS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','UNIX');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','LINUX');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','IOS');
INSERT INTO CATEGORY_S VALUES(SEQ_CATEGORY.NEXTVAL,'CM10','ANDROID');



SELECT * FROM CATEGORY_B;
SELECT * FROM CATEGORY_M;
SELECT * FROM CATEGORY_S;
SELECT * FROM ta_member;

--모두조회
select *
from category_s
join category_m using(category_m_id)
join category_B using(category_b_id);

select * 
from category_s
join category_m using(category_m_id)
join category_B using(category_b_id)

group by category_m_id;

update ta_member set mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==' where mem_email='aaa@naver.com';
commit;


update ta_member set mem_birth='2019-09-10';