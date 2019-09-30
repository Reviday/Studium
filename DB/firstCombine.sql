-- 테이블/시퀀스 등 삭제 초기화 단계
drop sequence FBOARD_SEQ;
drop sequence TA_SIDEMENU_SEQ;
drop sequence STM_LIKE_SEQ;
drop sequence STMADANG_CMT_SEQ;
drop sequence FMADANG_CMT_SEQ;
drop sequence SMADANG_SEQ;
drop sequence MLL_SEQ;
drop sequence SMADANG_CMT_SEQ;
drop sequence STMADANG_QUESTION_SEQ;
drop sequence BMADANG_SEQ;
drop sequence STMADANG_SEQ;
drop sequence BMADANG_CMT_SEQ;
drop sequence MEM_SEQ;
drop sequence FMADANG_SEQ;
DROP SEQUENCE SEQ_STORY_NO;
DROP TABLE TA_STORY;
DROP SEQUENCE SEQ_CATEGORY;
DROP SEQUENCE SEQ_MY_DIBS;
DROP SEQUENCE SEQ_MY_MEMO;
DROP SEQUENCE SEQ_MY_PURCHASE;
DROP SEQUENCE SEQ_MYCALENDAR;
DROP SEQUENCE SEQ_FSTUDY;
DROP SEQUENCE SEQ_PSTUDY;
DROP SEQUENCE SEQ_QandA;
DROP SEQUENCE SEQ_FAQ;
DROP SEQUENCE DEC_FAQ;

drop table TA_MEMBER_LOGIN_LOG;
drop table TA_SIDEMENU_ELEMENTS;
drop table TA_STMADANG_CMT;
drop table TA_FMADANG_CMT;
drop table TA_FREE_MADANG;
drop table TA_STUDY_MADANG_QUESTION;
drop table TA_STUDY_MADANG CASCADE CONSTRAINT;
drop table TA_STMADANG_LIKE;
drop table TA_FMADANG_REP;
drop table TA_SMADANG_REP;
drop table TA_BOAST_MADANG CASCADE CONSTRAINT;
drop table TA_SHARE_MADANG CASCADE CONSTRAINT;
drop table TA_BMADANG_CMT;
drop table TA_SMADANG_CMT;
DROP TABLE QANDA;
DROP TABLE ADMIN_FAQ;
DROP TABLE DECLARATION;
DROP TABLE ta_point_content;
DROP TABLE MY_PURCHASE;
DROP TABLE MY_DIBS;
DROP TABLE MY_MEMO;
DROP TABLE TODO_LIST;
DROP TABLE MY_CALENDAR;
DROP TABLE F_STUDY;
DROP TABLE P_STUDY;
DROP TABLE category_s;
DROP TABLE category_m;
DROP TABLE CATEGORY_B;

drop table TA_MEMBER;





-- 날짜 포맷형식을 다음으로 바꾼다. ex) 2019.01.01 13:00:00
-- 아래를 적용하지 않으면 Studium 프로젝트에서 사용되는 날짜 포맷형식을 사용할 수 없다.
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 




-- 테이블 및 시퀀스 생성
/*해당 정보는 멤버 테이블에 필요한 정보들 */
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

/* 회원넘버용 시퀀스 */
create sequence mem_seq 
start with 10000
increment by 1
maxvalue 999999;


-- 공부마당
create table ta_study_madang(
    madang_no number constraint stmadang_no_pk primary key, -- 글번호
    madang_writer_uid number, -- 글쓴이 uid
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint stmadang_title_nn not null, -- 글 제목
    madang_level number, -- 문제 난이도(Level 1~5)
    madang_content clob constraint stmadang_content_nn not null, -- 글 내용
    madang_main_category varchar2(100), -- 대분류(관리자 고정)
    madang_category varchar2(100), -- 중분류(관리자 고정)
    madang_sub_category varchar2(100), -- 소분류(사용자 지정)
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_updated_datetime date default null, -- 글 수정 일시
    madang_updated_ip varchar2(20), -- 글 수정 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_fork_count number default 0, -- 글 포크 수
    madang_answer_count number default 0, -- 글 답변(풀이) 수 
    madang_status char(1) default 'Y' constraint stmadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);

-- 공부마당
create sequence stmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- 공부마당 풀이
create table ta_study_madang_question(
    question_no number primary key,-- 시퀀스 pk
    madang_no number references ta_study_madang(madang_no), -- 해당 글번호
    question_writer_uid number, -- 글쓴이 uid
    question_writer_email varchar2(20), -- 글쓴이 이메일
    question_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    question_content clob, -- 글 내용
    question_main_category varchar2(100), -- 대분류(관리자 고정) => 통계용
    question_category varchar2(100), -- 중분류(관리자 고정)
    question_sub_category varchar2(100), -- 소분류(사용자 지정)
    question_register_datetime date, -- 글 작성 일시
    question_register_ip varchar2(20), -- 글 작성 ip 주소
    question_updated_datetime date default null, -- 글 수정 일시
    question_updated_ip varchar2(20), -- 글 수정 ip 주소
    question_rec_count number default 0, -- 글 추천 수(recommand)
    question_rep_count number default 0, -- 글 댓글 수
    question_status char(1) default 'Y' check(question_status in ('Y','N')) -- 삭제 여부
);

-- 공부마당 풀이 시퀀스
create sequence stmadang_question_seq 
start with 1
increment by 1
maxvalue 999999;


-- 공유마당
create table ta_share_madang(
    madang_no number constraint smadang_no_pk primary key, -- 글번호
    madang_parent number default null, -- 답글을 달았을 시, 원글의 글번호를 저장
    madang_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    madang_writer_uid number, -- 글쓴이 uid
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint smadang_title_nn not null, -- 글 제목
    madang_content clob constraint smadang_content_nn not null, -- 글 내용
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_updated_datetime date default null, -- 글 수정 일시
    madang_updated_ip varchar2(20), -- 글 수정 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_fork_count number default 0, -- 글 포크 수    
    madang_file_presence char(1) default 'N' constraint smadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- 파일이 있는지 없는지(List화면에서 표시용으로 사용)
    madang_img_presence char(1) default 'N' constraint smadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
    madang_status char(1) default 'Y' constraint smadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);

-- 공유마당
create sequence smadang_seq 
start with 1
increment by 1
maxvalue 999999;


-- 자유마당
create table ta_free_madang(
    madang_no number constraint fmadang_no_pk primary key, -- 글번호
    madang_parent number default null, -- 답글을 달았을 시, 원글의 글번호를 저장
    madang_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    madang_writer_uid number, -- 글쓴이 uid
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint fmadang_title_nn not null, -- 글 제목
    madang_content clob constraint fmadang_content_nn not null, -- 글 내용
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_updated_datetime date default null, -- 글 수정 일시
    madang_updated_ip varchar2(20), -- 글 수정 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_file_presence char(1) default 'N' constraint fmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- 파일이 있는지 없는지(List화면에서 표시용으로 사용)
    madang_img_presence char(1) default 'N' constraint fmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
    madang_status char(1) default 'Y' constraint fmadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);

-- 자유마당
create sequence fmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- 자랑마당
create table ta_boast_madang(
    madang_no number constraint bmadang_no_pk primary key, -- 글번호
    madang_parent number default null, -- 답글을 달았을 시, 원글의 글번호를 저장
    madang_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    madang_writer_uid number, -- 글쓴이 uid
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint bmadang_title_nn not null, -- 글 제목
    madang_content clob constraint bmadang_content_nn not null, -- 글 내용
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_updated_datetime date default null, -- 글 수정 일시
    madang_updated_ip varchar2(20), -- 글 수정 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_file_presence char(1) default 'N' constraint bmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- 파일이 있는지 없는지(List화면에서 표시용으로 사용)
    madang_img_presence char(1) default 'N' constraint bmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
    madang_status char(1) default 'Y' constraint bmadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);

-- 자랑마당
create sequence bmadang_seq 
start with 1
increment by 1
maxvalue 999999;

-- 댓글 테이블 => 각 게시판당 한 개의 테이블 생성 => 댓글 테이블은 계층형으로 도전!
-- 자유마당 댓글 테이블
create table ta_fmadang_cmt (
    cmt_no number primary key, -- 댓글 시퀀스 넘버
    cmt_parent number, -- 부모 댓글의 번호를 가짐. 부모는 null
    cmt_sort number default 0, -- 댓글 정렬 (기본값 0으로, 대댓글 순서대로 1씩 증가)
    cmt_madang_no number references ta_free_madang(madang_no), -- 게시글 번호(왜래키)
    cmt_content clob, -- 댓글 내용
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- 대댓글 존재 여부
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- 비밀 댓글 여부 // 일단 현재 사용하지 않을 예정
    cmt_writer_uid number not null references ta_member(mem_no), -- 댓글 작성자 uid(고유넘버)
    cmt_writer varchar2(30) not null, -- 댓글 작성자 이메일 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_writer_name varchar2(30) not null, -- 댓글 작성자 이름 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_register_datetime date, -- 댓글 작성 일시
    cmt_updated_datetime date, -- 댓글 최근 수정 일시
    cmt_register_ip varchar2(20), -- 댓글 작성 ip 주소
    cmt_updated_ip varchar2(20), -- 댓글 최근 수정 ip 주소
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- 댓글 삭제 여부(부모 댓글이 삭제 처리될 시, 대댓글도 모두 N으로 처리)
    cmt_blame number default 0, -- 신고 횟수
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- 신고 접수로인해 관리자 판단 하에 삭제조치된 경우. ("관리자에의 의해 삭제처리된 댓글입니다." 표기//일단 그냥 삭제처리와 동일하게)
);

-- 자유마당 댓글 시퀀스
create sequence fmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;


-- 공부마당 댓글 테이블 
create table ta_stmadang_cmt (
    cmt_no number primary key, -- 댓글 시퀀스 넘버
    cmt_parent number, -- 부모 댓글의 번호를 가짐. 부모는 null
    cmt_sort number default 0, -- 댓글 정렬 (기본값 0으로, 대댓글 순서대로 1씩 증가)
    cmt_madang_no number references ta_study_madang(madang_no), -- 게시글 번호(왜래키)
    cmt_content clob, -- 댓글 내용
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- 대댓글 존재 여부
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- 비밀 댓글 여부 // 일단 현재 사용하지 않을 예정
    cmt_writer_uid number not null references ta_member(mem_no), -- 댓글 작성자 uid(고유넘버)
    cmt_writer varchar2(30) not null, -- 댓글 작성자 이메일 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_writer_name varchar2(30) not null, -- 댓글 작성자 이름 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_register_datetime date, -- 댓글 작성 일시
    cmt_updated_datetime date, -- 댓글 최근 수정 일시
    cmt_register_ip varchar2(20), -- 댓글 작성 ip 주소
    cmt_updated_ip varchar2(20), -- 댓글 최근 수정 ip 주소
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- 댓글 삭제 여부(부모 댓글이 삭제 처리될 시, 대댓글도 모두 N으로 처리)
    cmt_blame number default 0, -- 신고 횟수
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- 신고 접수로인해 관리자 판단 하에 삭제조치된 경우. ("관리자에의 의해 삭제처리된 댓글입니다." 표기//일단 그냥 삭제처리와 동일하게)
);

-- 공부마당 댓글 시퀀스
create sequence stmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;



-- 공유마당 댓글 테이블 
create table ta_smadang_cmt (
    cmt_no number primary key, -- 댓글 시퀀스 넘버
    cmt_parent number, -- 부모 댓글의 번호를 가짐. 부모는 null
    cmt_sort number default 0, -- 댓글 정렬 (기본값 0으로, 대댓글 순서대로 1씩 증가)
    cmt_madang_no number references ta_share_madang(madang_no), -- 게시글 번호(왜래키)
    cmt_content clob, -- 댓글 내용
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- 대댓글 존재 여부
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- 비밀 댓글 여부 // 일단 현재 사용하지 않을 예정
    cmt_writer_uid number not null references ta_member(mem_no), -- 댓글 작성자 uid(고유넘버)
    cmt_writer varchar2(30) not null, -- 댓글 작성자 이메일 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_writer_name varchar2(30) not null, -- 댓글 작성자 이름 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_register_datetime date, -- 댓글 작성 일시
    cmt_updated_datetime date, -- 댓글 최근 수정 일시
    cmt_register_ip varchar2(20), -- 댓글 작성 ip 주소
    cmt_updated_ip varchar2(20), -- 댓글 최근 수정 ip 주소
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- 댓글 삭제 여부(부모 댓글이 삭제 처리될 시, 대댓글도 모두 N으로 처리)
    cmt_blame number default 0, -- 신고 횟수
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- 신고 접수로인해 관리자 판단 하에 삭제조치된 경우. ("관리자에의 의해 삭제처리된 댓글입니다." 표기//일단 그냥 삭제처리와 동일하게)
);

-- 공유마당 댓글 시퀀스
create sequence smadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;


-- 자랑마당 댓글 테이블 
create table ta_bmadang_cmt (
    cmt_no number primary key, -- 댓글 시퀀스 넘버
    cmt_parent number, -- 부모 댓글의 번호를 가짐. 부모는 null
    cmt_sort number default 0, -- 댓글 정렬 (기본값 0으로, 대댓글 순서대로 1씩 증가)
    cmt_madang_no number references ta_boast_madang(madang_no), -- 게시글 번호(왜래키)
    cmt_content clob, -- 댓글 내용
    cmt_reply char(1) default 'N' check (cmt_reply in ('Y','N')), -- 대댓글 존재 여부
--  cmt_secret char(1) default 'N' check (cmt_secret in ('Y','N')), -- 비밀 댓글 여부 // 일단 현재 사용하지 않을 예정
    cmt_writer_uid number not null references ta_member(mem_no), -- 댓글 작성자 uid(고유넘버)
    cmt_writer varchar2(30) not null, -- 댓글 작성자 이메일 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_writer_name varchar2(30) not null, -- 댓글 작성자 이름 (기본적으로 댓글에 정보를 띄워주기 위함)
    cmt_register_datetime date, -- 댓글 작성 일시
    cmt_updated_datetime date, -- 댓글 최근 수정 일시
    cmt_register_ip varchar2(20), -- 댓글 작성 ip 주소
    cmt_updated_ip varchar2(20), -- 댓글 최근 수정 ip 주소
    cmt_status char(1) default 'Y' check (cmt_status in ('Y','N')), -- 댓글 삭제 여부(부모 댓글이 삭제 처리될 시, 대댓글도 모두 N으로 처리)
    cmt_blame number default 0, -- 신고 횟수
    cmt_blame_admin char(1) default 'N' check (cmt_blame_admin in ('Y','N')) -- 신고 접수로인해 관리자 판단 하에 삭제조치된 경우. ("관리자에의 의해 삭제처리된 댓글입니다." 표기//일단 그냥 삭제처리와 동일하게)
);

-- 자랑마당 댓글 시퀀스
create sequence bmadang_cmt_seq 
start with 1
increment by 1
maxvalue 9999999;



-- 사이드 메뉴 바 요소를 위한 테이블
create table ta_sidemenu_elements (
    menu_id number constraint menu_id_pk primary key, -- 기본키
    menu_category varchar2(30) not null, -- 메뉴가 사용될 위치
    menu_name varchar2(30) not null, -- 메뉴 이름
    menu_url varchar2(100) not null, -- 이동시킬 경로
    menu_class varchar2(50) default null, -- 메뉴에 설정할 class (아이콘 설정용//하위메뉴는 null)
    use_down char(1) default 'N' constraint use_down_ck check(use_down in ('Y','N')), -- 하위 메뉴 사용 여부
    sort_no number not null, -- 정렬 순서
    parent_id number default null -- 부모 메뉴의 id
);

-- 요소 시퀀스
create sequence ta_sidemenu_seq 
start with 1
increment by 1
maxvalue 9999;

-- 사이드 메뉴 요소 필수 데이터(마당)
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang', '마당소개', '/madang/introMadang', 'fas fa-tachometer-alt fa-lg', default, 1, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공부마당', '/madang/studyMadangList', 'fab fa-studiovinari fa-lg', 'Y', 2, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자유마당', '/madang/freeMadangList', 'fab fa-fort-awesome-alt fa-lg', default, 3, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공유마당', '/madang/shareMadangList', 'fab fa-pagelines fa-lg', 'Y', 4, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자랑마당', '/madang/boastMadangList', 'fas fa-user-tie fa-lg', 'Y', 5, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','질문마당', '/madang/questionMadang', 'fa fa-users fa-lg', 'Y', 6, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','외국어', '/madang/studyMadangList?mCategory=외국어', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','프로그래밍', '/madang/studyMadangList?mCategory=프로그래밍', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공무원', '/madang/studyMadangList?mCategory=공무원', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자격증', '/madang/studyMadangList?mCategory=자격증', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','취업준비', '/madang/studyMadangList?mCategory=취업준비', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','일반', '/madang/studyMadangList?mCategory=일반', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공부마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','외국어', '/madang/shareMadangList?mCategory=외국어', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','프로그래밍', '/madang/shareMadangList?mCategory=프로그래밍', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공무원', '/madang/shareMadangList?mCategory=공무원', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자격증', '/madang/shareMadangList?mCategory=자격증', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','취업준비', '/madang/shareMadangList?mCategory=취업준비', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','일반', '/madang/shareMadangList?mCategory=일반', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='공유마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','외국어', '/madang/boastMadangList?mCategory=외국어', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','프로그래밍', '/madang/boastMadangList?mCategory=프로그래밍', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공무원', '/madang/boastMadangList?mCategory=공무원', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자격증', '/madang/boastMadangList?mCategory=자격증', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','취업준비', '/madang/boastMadangList?mCategory=취업준비', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','일반', '/madang/boastMadangList?mCategory=일반', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='자랑마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','외국어', '/madang/questionMadang?mCategory=외국어', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','프로그래밍', '/madang/questionMadang?mCategory=프로그래밍', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','공무원', '/madang/questionMadang?mCategory=공무원', default, default, 3, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','자격증', '/madang/questionMadang?mCategory=자격증', default, default, 4, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','취업준비', '/madang/questionMadang?mCategory=취업준비', default, default, 5, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'madang','일반', '/madang/questionMadang?mCategory=일반', default, default, 6, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='madang' AND MENU_NAME='질문마당'));

--어드민 메뉴 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','인쿼리', '/AdminInqueryList', default, default, 1, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','포인트 관리', '/AdminPointManage', default, default, 2, default); 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','1:1문의 관리', '/AdminQandAList', default, default, 3, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','결제 관리', '/AdminPayManage', default, 'Y', 4, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','강사 신청 관리', '/AdminPSManage', default, default, 5, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','스터디 관리', '/AdminStudyManage', default, 'Y', 6, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','강사 스터디', '/AdminStudyManage', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='스터디 관리'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','일반 스터디', '/AdminStudyFreeManage', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='스터디 관리'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin', '로그인 로그', '/AdminLoginLog', default, default, 7, default);

insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','결제 내역', '/AdminPayManageList', default, default, 1, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='결제 관리'));
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','취소 내역', '/AdminPayManageCancleList', default, default, 2, (SELECT MENU_ID FROM TA_SIDEMENU_ELEMENTS WHERE MENU_CATEGORY='admin' AND MENU_NAME='결제 관리'));

INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '자주 묻는 질문', '/AdminBoardFAQ', DEFAULT, DEFAULT, 1, DEFAULT);
INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '후 기', '/AdminBoardStory', DEFAULT, DEFAULT, 2, DEFAULT);

-- 로그인 로그 db
create table ta_member_login_log (
    mll_no number primary key, -- 시퀀스 PK 
    mll_success char(1) check (mll_success in ('Y','N')), -- 로그인 성공 여부
    mll_mem_no number, -- 로그인 한 회원 PK (찾아오지 못할 때, null(0값)을 넣을 생각인데, 외래키는 부모키를 찾을 수 없다고 에러나기 때문에 없앴음.) references ta_member(mem_no) 
    mll_user_email varchar2(30), -- 로그인 시도할 때에 입력한 이메일
    mll_datetime date, -- 로그인 일시
    mll_ip varchar2(20), -- 로그인 한 IP
    mll_reason varchar2(500), -- 로그인 성공/실패시 이유
    mll_useragent varchar2(500), -- 로그인한 브라우저의 user agent
    mll_url varchar2(500), -- 로그인한 페이지 주소
    mll_referer varchar2(500) -- 이전 페이지 주소
);

-- 로그인 로그 시퀀스
create sequence mll_seq 
start with 1
increment by 1
maxvalue 999999999;

-- 좋아요(추천 테이블)
-- 한 테이블로 처리하고 싶었는데, 외래키 지정때문에 마당마다 만들어야할 듯 싶다..
create table ta_stmadang_like (
    like_no number primary key, -- 시퀀스 pk
    madang_no number references ta_study_madang(madang_no), -- 마당 번호 fk
    mem_no number references ta_member(mem_no), -- 회원 번호 fk
    like_datetime date default sysdate, -- 좋아요(추천) 일시
    like_ip varchar2(20), -- 좋아요(추천) ip
    unique (madang_no, mem_no)
);

create sequence stm_like_seq  
start with 1
increment by 1
maxvalue 999999999;

--강병민 디비 -------------------------------------------------



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


--인후디비---------------------------------------------------



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



--MyPage DB------------------------------------------------------------------------


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
increment by 1;

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

--구매시퀀스
create sequence seq_my_purchase
start with 1
increment by 1;

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

--MYMEMO 시퀀스
create sequence seq_my_memo
start with 1
increment by 1;



-- category 대분류 테이블
CREATE TABLE CATEGORY_B(
    CATEGORY_B_ID VARCHAR2(10) PRIMARY KEY, --카테고리아이디
    TITLE_B VARCHAR2(30) DEFAULT 'N' NOT NULL--카테고리 이름
);
--중분류 테이블
CREATE TABLE CATEGORY_M(
    CATEGORY_M_ID VARCHAR2(10) PRIMARY KEY, --카테고리아이디
    CATEGORY_B_ID VARCHAR2(10) REFERENCES CATEGORY_B(CATEGORY_B_ID),--대분류테이블참조
    TITLE_M VARCHAR2(30) DEFAULT 'N' NOT NULL --카테고리 이름
);

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


--대분류 데이터
INSERT INTO CATEGORY_B VALUES('CB1','외국어');
INSERT INTO CATEGORY_B VALUES('CB2','프로그래밍');
INSERT INTO CATEGORY_B VALUES('CB3','공무원');
INSERT INTO CATEGORY_B VALUES('CB4','자격증');
INSERT INTO CATEGORY_B VALUES('CB5','취업준비');

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

--자주묻는 질문 게시판 이메일 문의
--시퀀스
CREATE SEQUENCE SEQ_QandA 
START WITH 1
INCREMENT BY 1
NOCYCLE;
--테이블
CREATE TABLE QANDA(
    NO NUMBER PRIMARY KEY, --문의번호
    EMAIL VARCHAR2(30) NOT NULL, --답변받을 이메일
    CONTENT VARCHAR2(3000) NOT NULL, --문의내용
    ENROLL_DATE DATE, --문의한 시간
    QANDA_STATUS VARCHAR2(1) --문의내용 처리여부
    );
    
--자주묻는 질문 게시판 어드민 관리
--시퀀스
create sequence SEQ_FAQ
start with 1
increment by 1;
--테이블
CREATE TABLE ADMIN_FAQ(
    FAQ_NO NUMBER PRIMARY KEY,--질문번호
    FAQ_TYPE VARCHAR2(100) NOT NULL, -- 질문종류
    FAQ_TITLE VARCHAR2(100) NOT NULL, -- 질문제목
    FAQ_CONTENT VARCHAR2(3000) NOT NULL -- 답변내용
);

--게시글/댓글 신고
create sequence DEC_FAQ
start with 1
increment by 1;

CREATE TABLE DECLARATION(
    D_NO NUMBER PRIMARY KEY, --신고번호
    R_NO NUMBER NOT NULL, --신고한 사람 번호
    P_NO NUMBER NOT NULL, --신고당한 사람 번호
    D_TYPE CHAR(1) CONSTRAINT DECLARATION_TYPE_CK CHECK (D_TYPE IN ('G', 'D')), --신고카테고리(G:게시글, D:댓글)
    D_CATEGORY CHAR(1) CONSTRAINT DECLARATION_CATEGORY_CK CHECK (D_CATEGORY IN ('P','U', 'D', 'S', 'G')), 
    -- 신고카테고리(P:영리목적의 광고, U:음란성/선정성 게시글, D:도배 게시글/댓글 S:개인정보 노출/사생활 침해 G:개인정보 노출/사생활 침해)
    D_DATE DATE DEFAULT SYSDATE, --신고시간
    D_IP VARCHAR2(20) NOT NULL, --아이피
    D_CONTENT VARCHAR2(3000), --신고 내용
    D_STATUS CHAR(1) DEFAULT 'Y' CONSTRAINT DECLARATION_STATUS_CK CHECK (D_STATUS IN ('Y', 'N')) 
);

-- 포인트내역 테이블
create table ta_point_content (
    mem_id number not null, -- 기본키
    mem_name varchar2(50) not null, -- 회원 이름
    mem_email varchar2(30) not null, --회원 이메일
    mem_point number default 0, -- 회원 증감 포인트 
    point_status char(1) check(point_status in ('Y','N')), -- y(지급) n(차감)
    point_enrolldate date -- 정렬 순서
);




commit;





























