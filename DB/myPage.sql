select * from tab;
drop table my_dibs;
drop table my_purchase;

drop table todo_list;
drop table ta_member;
create table ta_member ( -- 회원정보 테이블(비고: 必은 첫 회원가입시 반드시 입력받을 정보)
    mem_no number constraint mem_no_pk primary key, -- 회원넘버(시퀀스넘버로 부여)
--  mem_userid varchar2(20) constraint mem_userid_nn not null constraint mem_userid_uq unique, -- 회원 ID(必) 
    mem_email varchar2(30) not null, -- 회원 이메일(추가정보 or 첫 가입시)
    mem_password varchar2(300) constraint mem_password_nn not null , -- 회원 psssword(必)
    mem_name varchar2(50) constraint mem_name_nn not null, -- 회원 이름(必)
    mem_code char(1) constraint mem_code_ck check (mem_code in ('M','T','R','A')), -- 회원등급(Manager, Teacher, Regular, Associate)
    mem_birth date, -- 회원 생년월일(必)
    mem_phone varchar2(11), -- 회원 전화번호(없을 경우 집전화/ '-' 없이 입력받는다.),
    mem_gender char(1) default 'U' constraint mem_gender_ck check (mem_gender in ('M','F','U')), -- 회원 성별(必)(U-Undefined)
    mem_point number default 0, -- 회원 포인트
    mem_category1 varchar2(30), -- 회원 선호 카테고리(최대 3개)
    mem_category2 varchar2(30), 
    mem_category3 varchar2(30), 
    
    -- 집주소 입력 API 사용시, 2~3개 // 없으면 1개만 
    mem_zipcode varchar2(10), -- 우편번호 (자릿수가 가물해서 10)
    mem_address1 varchar2(100), -- 회원 주소 앞부분
    mem_address2 varchar2(100), -- 회원 상세주소
    -----------------------------
    
    -- 이하는 부가정보
    mem_receive_email char(1) default 'N' constraint mem_receive_email_ck check (mem_receive_email in ('Y','N')), -- 이메일 수신여부(기본값 N)
    mem_use_note char(1) default 'N' constraint mem_use_note_ck check (mem_use_note in ('Y','N')), -- 쪽지 사용여부(기본값 N)
    mem_receive_sms char(1) default 'N' constraint mem_receive_sms_ck check (mem_receive_sms in ('Y','N')), -- 문자 수신 여부(기본값 N)
    mem_open_profile char(1) default 'N' constraint mem_open_profile_ck check (mem_open_profile in ('Y','N')), -- 프로필 공개 여부(기본값 N)
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N','P')), -- 해당 회원 차단 여부(기본값 N/ 영구정지 P) 
    mem_email_cert char(1) default 'N' constraint mem_email_cert_ck check (mem_email_cert in ('Y','N')), -- 이메일 인증 여부(기본값 N)
    mem_enroll_datetime date , -- 회원 가입일(시간 포함)
    mem_enroll_ip varchar2(20), -- 회원 가입 ip(ip 받아오는게 가능하면 넣을까 싶음)
    mem_lastlogin_datetime date , -- 마지막 접속일 
    mem_lastlogin_ip varchar2(20), -- 마지막 접속 ip
    mem_profile_content varchar2(300), -- 자기소개(프로필용, 100자)
    mem_adminmemo varchar2(1000),   -- 회원에 대한 관리자용 메모
--  mem_following number default 0, -- 친구수
--  mem_followed number default 0, -- 회원을 친구로 등록한 회원 수 => 이건 따로 테이블 만들어서 하는게 좋을듯 하다.
    mem_icon varchar2(1000), -- 회원 아이콘 경로(댓글 사용할때 이미지 정도?, 경로를 어느 정도 범위로 주어야할지 몰라서 1000)
    mem_photo varchar2(1000), -- 회원 프로필 사진 경로
    mem_status char(1) default 'Y' constraint mem_status_ck check (mem_status in ('Y','N')), -- 회원 계정 상태
    mem_withdrawal_date date default null, -- 회원 탈퇴 일시
    mem_denied_date date default null -- 회원 차단 일시
);

insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','관리자','M','1990/01/01','','M',99999999,'','','','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '아무개','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);


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

--강사스터디 더미데이터
insert into p_study values(seq_pstudy.nextval,'TEST P STUDY','2','강남','주말',10,20,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i2.jpg','i3.jpg','i4.jpg','01:00','07:00',sysdate,sysdate,4,'아이유',DEFAULT, 8);

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

DROP TABLE MY_PURCHASE;
--구매,신청테이블
CREATE TABLE MY_PURCHASE(
    PUR_ID NUMBER PRIMARY KEY,--구매번호
    mem_no number constraint PUR_mem_no_fk references ta_member(mem_no), -- 구매한 회원 번호
    f_no number default null constraint PUR_f_study_fk references f_study(f_no), -- 신청한 무료스터디 번호
    p_no number default null constraint PUR_p_study_fk references p_study(p_no), -- 구매한 강사스터디 번호
    PURCHASE_DATE DATE, --구매,신청 날짜
    PURCHASE_CANCEL_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CANCEL_STATUS_CK CHECK (PURCHASE_CANCEL_STATUS IN ('N','Y')), --취소여부
    CANCEL_DATE DATE, --취소 날짜
    PURCHASE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT PURCHASE_CK CHECK (PURCHASE_STATUS IN ('N','Y')),--스터디 진행여부/진행중Y, 완료N
    SUBMIT_FILE CHAR(1) DEFAULT 'N' CONSTRAINT SUBMIT_FILE_CK CHECK (SUBMIT_FILE IN ('N','Y'))--제출서류발급유무/제출함Y,제출안함N
);
commit;
--조회
SELECT PUR_ID, MEM_NO, P_NO, P_TITLE, PURCHASE_DATE, PURCHASE_CANCEL_STATUS, CANCEL_DATE, PURCHASE_STATUS, SUBMIT_FILE
FROM MY_PURCHASE
JOIN P_STUDY USING(P_NO)
where mem_no='10028';
comit;
SELECT * FROM P_STUDY;
SELECT * FROM f_STUDY;
select * from ta_member;
--구매시퀀스
create sequence seq_my_purchase
start with 1
increment by 1;
--구매테이블 더미데이타
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10021,1,default,SYSDATE,'N',SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,1,default,SYSDATE,'Y',SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,1,default,SYSDATE,'Y',SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,default,1,SYSDATE,'N',SYSDATE,'N','Y');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,default,1,SYSDATE,'N',SYSDATE,'Y','Y');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,default,1,SYSDATE,'Y',SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,10028,41,default,SYSDATE,'Y',SYSDATE,'Y','N');
SELECT * FROM MY_PURCHASE where mem_no='10028';
commit;
select * from f_study;
SELECT * FROM TA_MEMBER;
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
select * from p_study;
select * from f_study;
select * from ta_member;
select * from my_purchase;

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

insert into ta_member values(mem_seq.NEXTVAL,'aaa@naver.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','테스트','R','1990/01/01','','F',99999999,'','','','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);

update ta_member set mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==' where mem_email='aaa@naver.com';
commit;
select * from ta_member;
select * from my_purchase;
select * from tab;

alter table p_study add p_studyMember  number default 0;
alter table f_study add p_studyMember  number default 0;
ALTER TABLE f_study RENAME COLUMN p_studyMember TO f_studyMember;

update f_study set f_studyMember=8;
update p_study set p_studyMember=8;
select * from f_study;
commit;

drop table my_memo;
--My Memo 테이블
create table my_memo(
    MEMO_ID NUMBER PRIMARY KEY,--메모 주키
    MEM_NO number constraint MEMO_MEM_FK references ta_member(mem_no), --메모를 가진 회원의 번호
    MEMO_FRONT_ID NUMBER CONSTRAINT MEMO_FRONT_ID_NN NOT NULL,--프론트 화면에서 생성한 ID값
    MEMO_CONTENTS clob , -- 메모내용
    MEMO_LEFT NUMBER NOT NULL,-- 메모 좌표 LEFT
    MEMO_TOP NUMBER NOT NULL, --메모의 좌표 TOP
    MEMO_DELETE_STATUS CHAR(1) DEFAULT 'N' CONSTRAINT MEMO_STATUS_CK CHECK (MEMO_DELETE_STATUS IN ('N','Y'))--메모 삭제Y,
);
Select * 
from my_memo 
where mem_no=10028
order by memo_front_id 
;
drop sequence seq_my_memo;
create sequence seq_my_memo
start with 1
increment by 1;
SELECT * FROM MY_MEMO WHERE MEM_NO=10028;

insert into my_memo values(seq_my_memo.nextval,10028,1,'메모 내용이에욥 ㅇㅂㅇ',100,100,'N');
insert into my_memo values(seq_my_memo.nextval,10028,2,'두번째 메모 내용이에욥 ㅇㅂㅇ',110,200,'N');
insert into my_memo values(seq_my_memo.nextval,10028,3,'셋셋세셋번째 메모 내용이에욥!!!',600,300,'N');
commit;
delete from my_memo where mem_no=10028;

select * from ta_story;
select * from ta_member;
select * from p_study;
select * from ta_story where mem_no=10028 and P_NO=2;
commit;

INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10028,2, 'frog.jpg','개구리','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요 ', DEFAULT, '서경석', 'seo.jpg','Interview','3');
INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,10028,1, 'nalgangdo.jpg', '날강두', '데이터베이스를 배워보고싶어 스터디에 등록을 했는데 등록금을 77ㅓ억해버리셨습니다 ', DEFAULT, '산체스', 'Sanchez.jpg','Database','1');
   commit;
   
   
   
   --후기를 위한 더미데이터
   
   --학생
   select * from ta_member;
insert into ta_member values(20011, 's1@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '보라','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_1.jpg',default,default,default);
insert into ta_member values(20012, 's2@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '강준','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_2.jpg',default,default,default);
insert into ta_member values(20013, 's3@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '주현','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_3.jpg',default,default,default);
insert into ta_member values(20014, 's4@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '진구','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_4.jpg',default,default,default);
insert into ta_member values(20015, 's5@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '예서','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_5.jpg',default,default,default);
insert into ta_member values(20016, 's6@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '도환','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_6.jpg',default,default,default);
insert into ta_member values(20017, 's7@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '우주','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_7.jpg',default,default,default);
insert into ta_member values(20018, 's8@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '승호','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_8.jpg',default,default,default);
insert into ta_member values(20019, 's9@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '장성규','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_9.jpg',default,default,default);
insert into ta_member values(20020, 's10@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '헨리','R','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','s_10.jpg',default,default,default);
delete from ta_member where mem_email like 's%';
delete from ta_member where mem_email like 't%';
select * from ta_member;
commit;
   --강사 
insert into ta_member values(20001, 't1@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', 'Hannah','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_1.jpg',default,default,default);
insert into ta_member values(20002, 't2@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', 'Justin','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_2.jpg',default,default,default);
insert into ta_member values(20003, 't3@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '예슬','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_3.jpg',default,default,default);
insert into ta_member values(20004, 't4@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '재욱','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_4.jpg',default,default,default);
insert into ta_member values(20005, 't5@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', 'Benedict','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_5.jpg',default,default,default);
insert into ta_member values(20006, 't6@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '송강','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_6.jpg',default,default,default);
insert into ta_member values(20007, 't7@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '혜교','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_7.jpg',default,default,default);
insert into ta_member values(20008, 't8@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '은우','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_8.jpg',default,default,default);
insert into ta_member values(20009, 't9@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '우식','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_9.jpg',default,default,default);
insert into ta_member values(20010, 't10@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '박진영','T','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','t_10.jpg',default,default,default);
   
   --pstudy
select * from p_study;
--날짜바꾸기
update p_study set p_datestart='19/11/11', p_dateend='19,12,30';
update p_study set p_status='Y';
update p_study set p_studymember=0;
commit;


insert into p_study values(101,'Hannah 쌤과 스피킹','Exciting speaking','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_1.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Hannah','Y', 8,20001 );

insert into p_study values(102,'놀면서 영어배워요! ','Justin 쌤과 즐거운 스피킹, 놀면서 영어할래?','역삼','주말',8,120000,'영어','I love reading, writing, watching movies and TV shows. All kinds of sports, specially football, mixed martial arts, cycling, hiking, gym & skateboarding. Love playing drums and the Ukulele, and listen to all kinds of music.',
'I graduated from an International school, and I attended acting school in New York City','t_2.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Justin','Y', 8,20002 );

insert into p_study values(103,'예슬 쌤과 스피킹','제대로 된 스피킹','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_3.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'예슬','Y', 8,20003 );

insert into p_study values(104,'재욱 쌤과 중국어수업','실무에서의 중국어','역삼','평일',8,120000,'중국어','우리 같이 중국어할래요?',
'대륙을 정복하는자 세상을 정복하리니! 영어 다음으로 각광받는 외국어 언어인 중국어! 회화를 잘해서 고객사도 만나고 세일즈도 하고 취업도 하시길 기대합니다.','t_4.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00',sysdate,sysdate,4,'재욱','Y', 8,20004 );

insert into p_study values(105,'Benedict 와 진지한 영어','진지한 영국영어','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_5.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'Benedict','Y', 8,20005 );

insert into p_study values(106,'송강 쌤과 영어','즐거운 영어스터디','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_6.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'송강','Y', 8,20006 );

insert into p_study values(107,'면접스터디 ','실제 인사담당 혜교쌤','강남','주말',8,210000,'면접','실제 면접관이 보는 면접에 대해',
'면접 준비, 제대로 해봐요','t_7.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00',sysdate,sysdate,4,'혜교','Y', 8,20007 );

insert into p_study values(108,'은우쌤과 함께 공부','잘생쁨주의','이태원','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_8.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'은우','Y', 8,20008 );


insert into p_study values(109,'정보처리기사 공부','합격합시다.','역삼','평일',8,120000,'국가기술','15년간 컴퓨터 강의 및 현장 실무를 모두 수행해온 강사가 정보처리기사 합격을 도와 드립니다.',
'문제풀이 위주로 진행할 예정입니다.','t_9.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'우식','Y', 8,20009 );

insert into p_study values(110,'떠먹여주는 알고리즘','알고리즘 스터디','신촌','주말',8,500000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'박진영','Y', 8,20010 );

 --후기 
--INSERT INTO TA_STORY VALUES(SEQ_STORY_NO.NEXTVAL,20011,2, 'frog.jpg','개구리','미적미적대고 소심해서 말을 잘못해서 면접에 대한 걱정을 많이 했는데 리더님 덕분에 많이 나아져서 자신감이 생겼어요 ', DEFAULT, '서경석', 'seo.jpg','Interview','3');
