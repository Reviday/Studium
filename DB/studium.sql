

/*
[첫 회원가입 시 - 1안]
- 회원 아이디
- 회원 비밀번호
- 회원 이름
- 회원 생년월일
- 회원 성별

[첫 회원가입시 - 2안]
- 회원 이메일 
- 회원 비밀번호
(- 회원 닉네임&이름)
 => 그 외 정보는 추가정보 입력으로
    첫 회원 가입시 입력받는 정보들만 必(not null 제약)

[스터디 이용시 추가 정보 입력 => 1,2안 외 나머지 정보들]
- 

*/

drop table ta_member;
drop sequence mem_seq;
update ta_member set mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==';
insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','관리자','M','1990/01/01','','M',99999999,'A','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');

-- 날짜 포맷형식을 다음으로 바꾼다. ex) 2019.01.01 13:00:00
-- 아래를 적용하지 않으면 Studium 프로젝트에서 사용되는 날짜 포맷형식을 사용할 수 없다.
alter session set nls_date_format = 'YYYY.MM.DD HH24:MI:SS'; 


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
    mem_denied char(1) default 'N' constraint mem_denied_ck check (mem_denied in ('Y','N')), -- 해당 회원 차단 여부(기본값 N)
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
    mem_photo varchar2(1000) -- 회원 프로필 사진 경로
);


/* 회원넘버용 시퀀스 */
create sequence mem_seq 
start with 10000
increment by 1
maxvalue 999999;


select * from ta_member;
update ta_member set mem_email='admin@studium.com';
commit;
select * from ta_member where mem_email='admin@studium.com' and mem_password='x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==';
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '아무개','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '아무개','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','');
/*
테이블이름 (tb_board)
1. 고유번호(b_idx) : 자동증가로 만들어 지는 회원의 고유번호
2. 글순서번호(b_num) : 글 순서를 표시하기 위한 번호
3. 답글순서및 단계(b_reply) : 답글들의 순서 및 단계를 위한 문자, 3단계까지 가능하게 함, (A-Z)까지 26개까지 답글 가능
4. 글쓴이 아이디(m_id) : 글쓴이의 아이디를 기록합니다.
5. 글쓴이 이름(m_name) : 글쓴이의 이름을 기록합니다.
6. 글제제목(b_title) : 글제목입니다.(255자까지 가능)
7. 글내용(b_contents)
8. 작성일시(b_regdate)

*/

/*
- 게시판(공부마당(문제내는게시판), 공유마당(포크), 자유마당(자유게시판))

  게시물 번호(primary key), 카테고리, 제목, 내용, 작성자, 조회수, 

  작성날짜, (추천), 댓글내용, 삭제여부
*/


/* 게시글용 테이블*/
/*
 답글 있는 게시판 형식으로? 
 게시판마다 한 개씩 테이블을 부여?
 
 Q) 게시글에 이미지를 삽입할 경우, 어떻게 처리해야하는지?
*/

-- 공부마당(or 풀이마당)
/* 글쓴이가 계정을 탈퇴한다고 게시글이 삭제되는 경우도 드물기에 외래키 지정 안 함 */
create table ta_qborad(
    board_no number constraint board_no_pk primary key, -- 글번호
    board_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    /* 0번부터 순차적으로 부여, board_no을 오름차순으로 정렬해놓은 상태면,
    board_order을 내림차순으로 2차 정렬하면 원하는 글 순서가 출력된다.
    board_order가 0이 아닌 글은 답글로 판단하면 될 듯.*/
    board_writer_id varchar2(20), -- 글쓴이 아이디
    board_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    board_title varchar2(100) constraint board_title_nn not null, -- 글 제목
    board_content clob constraint board_content_nn not null, -- 글 내용
    board_register_datetime date, -- 글 작성 일시
--  board_register_ip varchar2(20) -- 글 작성 ip 주소
    board_rec_count number default 0, -- 글 추천 수(recommand)
    board_fork_count number default 0, -- 글 포크 수 
    board_que_count number default 0 -- 글 풀이 수
);


-- 공유마당
create table ta_share_madang(
    madang_no number constraint smadang_no_pk primary key, -- 글번호
    madang_parent number default null, -- 답글을 달았을 시, 원글의 글번호를 저장
    madang_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint smadang_title_nn not null, -- 글 제목
    madang_content clob constraint smadang_content_nn not null, -- 글 내용
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_fork_count number default 0, -- 글 포크 수    
    madang_file_presence char(1) default 'N' constraint smadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- 파일이 있는지 없는지(List화면에서 표시용으로 사용)
    madang_img_presence char(1) default 'N' constraint smadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
    madang_status char(1) default 'Y' constraint smadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);


-- 자유마당(포크 없음)
create table ta_free_madang(
    madang_no number constraint fmadang_no_pk primary key, -- 글번호
    madang_parent number default null, -- 답글을 달았을 시, 원글의 글번호를 저장
    madang_order number default 0, -- 답글이 달렸을 시, 해당 게시글의 순서를 정해주기 위한 순서번호
    madang_writer_email varchar2(20), -- 글쓴이 이메일
    madang_writer_name varchar2(20), -- 글쓴이 이름(이름으로 표기)
    madang_title varchar2(100) constraint fmadang_title_nn not null, -- 글 제목
    madang_content clob constraint fmadang_content_nn not null, -- 글 내용
    madang_register_datetime date, -- 글 작성 일시
    madang_register_ip varchar2(20), -- 글 작성 ip 주소
    madang_rec_count number default 0, -- 글 추천 수(recommand)
    madang_rep_count number default 0, -- 글 댓글 수
    madang_read_count number default 0, -- 조회수
    madang_file_presence char(1) default 'N' constraint fmadang_file_presence_ck check(madang_file_presence in ('Y','N')), -- 파일이 있는지 없는지(List화면에서 표시용으로 사용)
    madang_img_presence char(1) default 'N' constraint fmadang_img_presence_ck check(madang_img_presence in ('Y','N')), -- 이미지가 있는지 없는지(List화면에서 표시용으로 사용)
    madang_status char(1) default 'Y' constraint fmadang_status_ck check(madang_status in ('Y','N')) -- 삭제 여부
);
drop table ta_free_madang;
drop sequence fboard_seq;

/* 게시글넘버용 시퀀스 */

-- 공부마당(풀이마당)
create sequence qboard_seq 
start with 1
increment by 1
maxvalue 999999;

-- 공유마당
create sequence sboard_seq 
start with 1
increment by 1
maxvalue 999999;

-- 자유마당
create sequence fboard_seq 
start with 1
increment by 1
maxvalue 999999;


select * from ta_free_madang;
select * from ta_free_madang where madang_status='Y' ORDER BY DECODE(madang_parent,NULL,madang_no,madang_parent) DESC, madang_no DESC;
SELECT * FROM TA_FREE_MADANG WHERE MADANG_STATUS='Y' ORDER BY DECODE(MADANG_PARENT,NULL,MADANG_NO,MADANG_PARENT) DESC, MADANG_NO DESC;
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.1', '테스트 글 입니다.1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.2', '테스트 글 입니다.2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.3', '테스트 글 입니다.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.4', '테스트 글 입니다.3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.5', '테스트 글 입니다.4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.6', '테스트 글 입니다.5',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.7', '테스트 글 입니다.6',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.8', '테스트 글 입니다.7',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.9', '테스트 글 입니다.8',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.10', '테스트 글 입니다.10',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.11', '테스트 글 입니다.11',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.12', '테스트 글 입니다.12',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.13', '테스트 글 입니다.13',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.14', '테스트 글 입니다.14',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.15', '테스트 글 입니다.15',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.16', '테스트 글 입니다.16',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.17', '테스트 글 입니다.17',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.18', '테스트 글 입니다.18',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.19', '테스트 글 입니다.19',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.20', '테스트 글 입니다.20',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.21', '테스트 글 입니다.21',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.22', '테스트 글 입니다.22',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.23', '테스트 글 입니다.23',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.24', '테스트 글 입니다.24',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.25', '테스트 글 입니다.25',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.26', '테스트 글 입니다.26',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.27', '테스트 글 입니다.27',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.28', '테스트 글 입니다.28',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.29', '테스트 글 입니다.29',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.30', '테스트 글 입니다.39',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.1', '삭제된 글입니다. 출력되면 안됩니다.1',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.2', '삭제된 글입니다. 출력되면 안됩니다.2',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.3', '삭제된 글입니다. 출력되면 안됩니다.3',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.4', '삭제된 글입니다. 출력되면 안됩니다.4',sysdate, null, default,default, default, default, default, 'N');
insert into ta_free_madang values(fboard_seq.nextval, 8, 1,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글1', '테스트 글 입니다.8-답글1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 2,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글2', '테스트 글 입니다.8-답글2',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 3,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글3', '테스트 글 입니다.8-답글3',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 8, 4,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글4', '테스트 글 입니다.8-답글4',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 1,'admin@studium.com', '관리자', '테스트 글 입니다.10-답글1', '테스트 글 입니다.10-답글1',sysdate, null, default,default, default, default, default, default);
insert into ta_free_madang values(fboard_seq.nextval, 10, 2,'admin@studium.com', '관리자', '테스트 글 입니다.10-답글2', '테스트 글 입니다.10-답글2',sysdate, null, default,default, default, default, default, default);
commit;


insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.1', '테스트 글 입니다.1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.2', '테스트 글 입니다.2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.3', '테스트 글 입니다.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.4', '테스트 글 입니다.3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.5', '테스트 글 입니다.4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.6', '테스트 글 입니다.5',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.7', '테스트 글 입니다.6',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.8', '테스트 글 입니다.7',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.9', '테스트 글 입니다.8',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.10', '테스트 글 입니다.10',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.11', '테스트 글 입니다.11',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.12', '테스트 글 입니다.12',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.13', '테스트 글 입니다.13',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.14', '테스트 글 입니다.14',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.15', '테스트 글 입니다.15',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.16', '테스트 글 입니다.16',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.17', '테스트 글 입니다.17',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.18', '테스트 글 입니다.18',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.19', '테스트 글 입니다.19',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.20', '테스트 글 입니다.20',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.21', '테스트 글 입니다.21',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.22', '테스트 글 입니다.22',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.23', '테스트 글 입니다.23',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.24', '테스트 글 입니다.24',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.25', '테스트 글 입니다.25',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.26', '테스트 글 입니다.26',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.27', '테스트 글 입니다.27',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.28', '테스트 글 입니다.28',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.29', '테스트 글 입니다.29',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '테스트 글 입니다.30', '테스트 글 입니다.39',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.1', '삭제된 글입니다. 출력되면 안됩니다.1',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.2', '삭제된 글입니다. 출력되면 안됩니다.2',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.3', '삭제된 글입니다. 출력되면 안됩니다.3',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, default, default,'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.4', '삭제된 글입니다. 출력되면 안됩니다.4',sysdate, null, default,default, default, default, default, default, 'N');
insert into ta_share_madang values(sboard_seq.nextval, 8, 1,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글1', '테스트 글 입니다.8-답글1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 2,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글2', '테스트 글 입니다.8-답글2',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 3,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글3', '테스트 글 입니다.8-답글3',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 8, 4,'admin@studium.com', '관리자', '테스트 글 입니다.8-답글4', '테스트 글 입니다.8-답글4',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 1,'admin@studium.com', '관리자', '테스트 글 입니다.10-답글1', '테스트 글 입니다.10-답글1',sysdate, null, default,default, default, default, default, default, default);
insert into ta_share_madang values(sboard_seq.nextval, 10, 2,'admin@studium.com', '관리자', '테스트 글 입니다.10-답글2', '테스트 글 입니다.10-답글2',sysdate, null, default,default, default, default, default, default, default);
commit;



create table free_madang_file (
    fmf_no number fmf_id_pk primary key,-- 파일 번호 
    madang_no number constraint madang_no_fk references ta_free_madang(madang_no), -- 마당글 번호
    member_no number constraint member_no_fk references ta_member(mem_no), -- 회원 번호
    fmf_original_filename varchar2(100), -- 파일 업로드시 원래 파일명
    fmf_rename_filename varchar2(100), -- 파일 업로드시 서버에 저장된 파일명
    fmf_download_count number, -- 다운로드 회수
    fmf_filesize number, -- 파일 크기
    fmf_is_image char(1) default 'N' constraint fmf_is_image_ck check(fmf_is_image in ('Y','N')), -- 이미지인지 여부
    fmf_width number default null, -- 이미지일 경우 이미지 가로값
    fmf_height number default null, -- 이미지일 경우 이미지 세로값
    fmf_type varchar2(20), -- 파일 확장자
    fmf_datetime date, -- 등록일자
    fmf_ip varchar2(20) -- 등록 ip
);






-- 댓글 테이블

-- 공부마당 댓글 테이블
-- 댓글 번호도 시퀀스로 필요할듯. 
-- 게시글 생성 될 때, 시퀀스도 생성?
/*
    댓글/대댓글, 순서 적용 방법
    1. parent가 null일 경우, cmt_no로 정렬을 한다.
    2. parent가 null이 아닐 경우, parent로 정렬한다.
    3. 첫번째 정렬 조건에서 값이 같을 경우 cmt_seq로 정렬한다.
*/
create table ta_qboard_rep (
    board_no number constraint board_no_fk references ta_qborad(board_no), -- 게시글 번호(외래키)
    cmt_no number constraint cmt_no_pk primary key, -- 댓글 번호(시퀀스)
    cmt varchar2(1000), -- 댓글 내용(최대 300자까지 받을 예정)
    parent number default null, -- 대댓글의 경우 사용되는 열로, null이면 기본댓글, 값이 있으면 대댓글 parent의 값이 부모 댓글의 cmt_no
    cmt_seq number default 0 --부모댓글이 seq값이 기본적으로 0이 부여, 대댓글 순서대로 1,2,3 ... 부여
);

-- 공유마당 댓글 테이블
create table ta_sboard_rep (
    board_no number constraint board_no_fk references ta_qborad(board_no), -- 게시글 번호(외래키)
    cmt_no number constraint cmt_no_pk primary key, -- 댓글 번호(시퀀스)
    cmt varchar2(1000), -- 댓글 내용(최대 300자까지 받을 예정)
    parent number default null, -- 대댓글의 경우 사용되는 열로, null이면 기본댓글, 값이 있으면 대댓글 parent의 값이 부모 댓글의 cmt_no
    cmt_seq number default 0 --부모댓글이 seq값이 기본적으로 0이 부여, 대댓글 순서대로 1,2,3 ... 부여
);

-- 자유마당 댓글 테이블
create table ta_fmadang_rep (
    madang_no number constraint madang_no_fk references ta_free_madang(madang_no), -- 게시글 번호(외래키)
    cmt_no number constraint cmt_no_pk primary key, -- 댓글 번호(시퀀스)
    cmt varchar2(1000), -- 댓글 내용(최대 300자까지 받을 예정)
    parent number default null, -- 대댓글의 경우 사용되는 열로, null이면 기본댓글, 값이 있으면 대댓글 parent의 값이 부모 댓글의 cmt_no
    cmt_seq number default 0 --부모댓글이 seq값이 기본적으로 0이 부여, 대댓글 순서대로 1,2,3 ... 부여
);

/*
시퀀스 생성은 JDBC로 생성

-- 댓글 최대치 9999
-- 댓글의 시퀀스는 [게시판테이블]_rep_[게시글번호]_seq 형식으로 생성
create sequence qboard_rep_1_seq 
start with 1
increment by 1
maxvalue 9999;

-- 대댓글 최대치 999
-- 대댓글의 시퀀스는 [게시판테이블]_rep_[게시글번호]_[parent]_req
create sequence qboard_rep_1_2_seq 
start with 1
increment by 1
maxvalue 999;

*/




-- 테스트 테스트!

-- 댓글 최대치 9999
-- 댓글의 시퀀스는 [게시판테이블]_rep_[게시글번호]_seq 형식으로 생성
create sequence qboard_rep_1_seq 
start with 1
increment by 1
maxvalue 9999;

-- 대댓글 최대치 999
-- 대댓글의 시퀀스는 [게시판테이블]_rep_[게시글번호]_[parent]_req
create sequence qboard_rep_1_2_seq 
start with 1
increment by 1
maxvalue 999;

DROP sequence qboard_rep_1_seq;
DROP sequence qboard_rep_1_2_seq;

insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '안녕하세요!!!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '넹넹 반가워요',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '하하하하!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM!',null , 0);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '이게 대댓글이에요!',2 , qboard_rep_1_2_seq.NEXTVAL);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, '그렇군요! 대댓글 이군요!',2 , qboard_rep_1_2_seq.NEXTVAL);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM! 대댓글1',4 , 1);
insert into ta_qboard_rep values (1, qboard_rep_1_seq.NEXTVAL, 'STUDIUM! 대댓글2',4 , 2);

SELECT * FROM ta_qboard_rep;

SELECT *
FROM ta_qboard_rep
ORDER BY DECODE(parent,NULL,cmt_no,parent), cmt_seq;

SELECT * FROM TABS;
SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM TA_FREE_MADANG WHERE MADANG_STATUS='Y' ORDER BY DECODE(MADANG_PARENT,NULL,MADANG_NO,MADANG_PARENT) DESC, MADANG_NO) A) WHERE RNUM BETWEEN 1 AND 10; 