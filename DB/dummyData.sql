-- 초기 계정 관리자/일반 사용자
insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','관리자','M','1990/01/01','','M',99999999,'','','','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','studium_logo.png',default,default,default);
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '아무개','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);

--학생
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
   



-- 공부마당 더미
insert into ta_study_madang values(stmadang_seq.nextval, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.1', 1, '테스트 글 입니다.1', '프로그래밍', '고급언어','java',sysdate, null, default, null, default, default, default, default,  default, default);
insert into ta_study_madang values(stmadang_seq.nextval, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.1', 1, '테스트 글 입니다.<br>테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.테스트 글 입니다.', '프로그래밍', '고급언어','java',sysdate, null, default, null, default, default, default, default,  default, default);
insert into ta_study_madang values(stmadang_seq.nextval, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.2', 1, '테스트 글 입니다.2', '프로그래밍', '고급언어','java',sysdate, null, default, null, default, default, default, default,  1, default);


-- 테스트용 더미 데이터(자유마당)
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.1', '테스트 글 입니다.1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.2', '테스트 글 입니다.2',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.3', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.4', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.5', '테스트 글 입니다.4',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.6', '테스트 글 입니다.5',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.7', '테스트 글 입니다.6',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8', '테스트 글 입니다.7',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.9', '테스트 글 입니다.8',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10', '테스트 글 입니다.10',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.11', '테스트 글 입니다.11',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.12', '테스트 글 입니다.12',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.13', '테스트 글 입니다.13',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.14', '테스트 글 입니다.14',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.15', '테스트 글 입니다.15',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.16', '테스트 글 입니다.16',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.17', '테스트 글 입니다.17',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.18', '테스트 글 입니다.18',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.19', '테스트 글 입니다.19',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.20', '테스트 글 입니다.20',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.21', '테스트 글 입니다.21',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.22', '테스트 글 입니다.22',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.23', '테스트 글 입니다.23',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.24', '테스트 글 입니다.24',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.25', '테스트 글 입니다.25',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.26', '테스트 글 입니다.26',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.27', '테스트 글 입니다.27',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.28', '테스트 글 입니다.28',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.29', '테스트 글 입니다.29',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.30', '테스트 글 입니다.39',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.1', '삭제된 글입니다. 출력되면 안됩니다.1',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.2', '삭제된 글입니다. 출력되면 안됩니다.2',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.3', '삭제된 글입니다. 출력되면 안됩니다.3',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.4', '삭제된 글입니다. 출력되면 안됩니다.4',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_free_madang values(fmadang_seq.nextval, 8, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글1', '테스트 글 입니다.8-답글1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, 8, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글2', '테스트 글 입니다.8-답글2',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, 8, 3, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글3', '테스트 글 입니다.8-답글3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, 8, 4, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글4', '테스트 글 입니다.8-답글4',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, 10, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글1', '테스트 글 입니다.10-답글1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, 10, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글2', '테스트 글 입니다.10-답글2',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.31', '테스트 글 입니다.31',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.32', '테스트 글 입니다.32',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.33', '테스트 글 입니다.33',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.34', '테스트 글 입니다.34',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.35', '테스트 글 입니다.35',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.36', '테스트 글 입니다.36',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.37', '테스트 글 입니다.37',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.38', '테스트 글 입니다.38',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.39', '테스트 글 입니다.39',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.40', '테스트 글 입니다.40',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.41', '테스트 글 입니다.41',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.42', '테스트 글 입니다.42',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.43', '테스트 글 입니다.43',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.44', '테스트 글 입니다.44',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.45', '테스트 글 입니다.45',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.46', '테스트 글 입니다.46',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.47', '테스트 글 입니다.47',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.48', '테스트 글 입니다.48',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.49', '테스트 글 입니다.49',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.50', '테스트 글 입니다.50',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.51', '테스트 글 입니다.51',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.52', '테스트 글 입니다.52',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.53', '테스트 글 입니다.53',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.54', '테스트 글 입니다.54',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.55', '테스트 글 입니다.55',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.56', '테스트 글 입니다.56',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.57', '테스트 글 입니다.57',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.58', '테스트 글 입니다.58',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.59', '테스트 글 입니다.59',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.60', '테스트 글 입니다.60',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.61', '테스트 글 입니다.61',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.62', '테스트 글 입니다.62',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.63', '테스트 글 입니다.63',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.64', '테스트 글 입니다.64',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.65', '테스트 글 입니다.65',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.66', '테스트 글 입니다.66',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.67', '테스트 글 입니다.67',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.68', '테스트 글 입니다.68',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.69', '테스트 글 입니다.69',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.70', '테스트 글 입니다.70',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.71', '테스트 글 입니다.71',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.72', '테스트 글 입니다.72',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.73', '테스트 글 입니다.73',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.74', '테스트 글 입니다.74',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.75', '테스트 글 입니다.75',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.76', '테스트 글 입니다.76',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.77', '테스트 글 입니다.77',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.78', '테스트 글 입니다.78',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.79', '테스트 글 입니다.79',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.80', '테스트 글 입니다.80',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.81', '테스트 글 입니다.81',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.82', '테스트 글 입니다.82',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.83', '테스트 글 입니다.83',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.84', '테스트 글 입니다.84',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.85', '테스트 글 입니다.85',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.86', '테스트 글 입니다.86',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.87', '테스트 글 입니다.87',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.88', '테스트 글 입니다.88',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.89', '테스트 글 입니다.89',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.90', '테스트 글 입니다.90',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.91', '테스트 글 입니다.91',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.92', '테스트 글 입니다.92',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.93', '테스트 글 입니다.93',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.94', '테스트 글 입니다.94',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.95', '테스트 글 입니다.95',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.96', '테스트 글 입니다.96',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.97', '테스트 글 입니다.97',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.98', '테스트 글 입니다.98',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.99', '테스트 글 입니다.99',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_free_madang values(fmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.100', '테스트 글 입니다.100',sysdate, null, default,default, null, null, default, default, default, default);


-- 공유마당 더미데이터
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.1', '테스트 글 입니다.1',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.2', '테스트 글 입니다.2',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.3', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.4', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.5', '테스트 글 입니다.4',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.6', '테스트 글 입니다.5',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.7', '테스트 글 입니다.6',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8', '테스트 글 입니다.7',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.9', '테스트 글 입니다.8',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10', '테스트 글 입니다.10',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.11', '테스트 글 입니다.11',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.12', '테스트 글 입니다.12',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.13', '테스트 글 입니다.13',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.14', '테스트 글 입니다.14',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.15', '테스트 글 입니다.15',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.16', '테스트 글 입니다.16',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.17', '테스트 글 입니다.17',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.18', '테스트 글 입니다.18',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.19', '테스트 글 입니다.19',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.20', '테스트 글 입니다.20',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.21', '테스트 글 입니다.21',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.22', '테스트 글 입니다.22',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.23', '테스트 글 입니다.23',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.24', '테스트 글 입니다.24',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.25', '테스트 글 입니다.25',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.26', '테스트 글 입니다.26',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.27', '테스트 글 입니다.27',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.28', '테스트 글 입니다.28',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.29', '테스트 글 입니다.29',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.30', '테스트 글 입니다.39',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.1', '삭제된 글입니다. 출력되면 안됩니다.1',sysdate, null, default,default, null, null, default, default, default, default, 'N');
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.2', '삭제된 글입니다. 출력되면 안됩니다.2',sysdate, null, default,default, null, null, default, default, default, default, 'N');
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.3', '삭제된 글입니다. 출력되면 안됩니다.3',sysdate, null, default,default, null, null, default, default, default, default, 'N');
insert into ta_share_madang values(smadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.4', '삭제된 글입니다. 출력되면 안됩니다.4',sysdate, null, default,default, null, null, default, default, default, default, 'N');
insert into ta_share_madang values(smadang_seq.nextval, 8, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글1', '테스트 글 입니다.8-답글1',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, 8, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글2', '테스트 글 입니다.8-답글2',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, 8, 3, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글3', '테스트 글 입니다.8-답글3',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, 8, 4, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글4', '테스트 글 입니다.8-답글4',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, 10, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글1', '테스트 글 입니다.10-답글1',sysdate, null, default,default, null, null, default, default, default, default, default);
insert into ta_share_madang values(smadang_seq.nextval, 10, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글2', '테스트 글 입니다.10-답글2',sysdate, null, default,default, null, null, default, default, default, default, default);

-- 자랑마당 더미데이터
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.1', '테스트 글 입니다.1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.2', '테스트 글 입니다.2',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.3', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.4', '테스트 글 입니다.3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.5', '테스트 글 입니다.4',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.6', '테스트 글 입니다.5',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.7', '테스트 글 입니다.6',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8', '테스트 글 입니다.7',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.9', '테스트 글 입니다.8',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10', '테스트 글 입니다.10',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.11', '테스트 글 입니다.11',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.12', '테스트 글 입니다.12',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.13', '테스트 글 입니다.13',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.14', '테스트 글 입니다.14',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.15', '테스트 글 입니다.15',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.16', '테스트 글 입니다.16',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.17', '테스트 글 입니다.17',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.18', '테스트 글 입니다.18',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.19', '테스트 글 입니다.19',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.20', '테스트 글 입니다.20',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.21', '테스트 글 입니다.21',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.22', '테스트 글 입니다.22',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.23', '테스트 글 입니다.23',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.24', '테스트 글 입니다.24',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.25', '테스트 글 입니다.25',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.26', '테스트 글 입니다.26',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.27', '테스트 글 입니다.27',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.28', '테스트 글 입니다.28',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.29', '테스트 글 입니다.29',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.30', '테스트 글 입니다.39',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.1', '삭제된 글입니다. 출력되면 안됩니다.1',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.2', '삭제된 글입니다. 출력되면 안됩니다.2',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.3', '삭제된 글입니다. 출력되면 안됩니다.3',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_boast_madang values(bmadang_seq.nextval, default, default, 10000, 'admin@studium.com', '관리자', '삭제된 글입니다. 출력되면 안됩니다.4', '삭제된 글입니다. 출력되면 안됩니다.4',sysdate, null, default,default, null, null, default, default, default, 'N');
insert into ta_boast_madang values(bmadang_seq.nextval, 8, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글1', '테스트 글 입니다.8-답글1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, 8, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글2', '테스트 글 입니다.8-답글2',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, 8, 3, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글3', '테스트 글 입니다.8-답글3',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, 8, 4, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.8-답글4', '테스트 글 입니다.8-답글4',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, 10, 1, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글1', '테스트 글 입니다.10-답글1',sysdate, null, default,default, null, null, default, default, default, default);
insert into ta_boast_madang values(bmadang_seq.nextval, 10, 2, 10000, 'admin@studium.com', '관리자', '테스트 글 입니다.10-답글2', '테스트 글 입니다.10-답글2',sysdate, null, default,default, null, null, default, default, default, default);


-- 자유마당 댓글 더미 데이터
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '테스트 댓글입니다.', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default,110, '테스트 댓글입니다.2', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default,110, '테스트 댓글입니다.3', 'Y', 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 3, 2, 110, '테스트 대댓글입니다.3-1', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '테스트 댓글입니다.4', 'Y', 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 3, 1, 110, '테스트 대댓글입니다.3-2', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, 5, 1, 110, '테스트 대댓글입니다.4-1', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '테스트 댓글입니다.5', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '출력되면 안되는 댓글입니다.', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, 'N', default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '출력되면 안되는 댓글입니다.', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, 'N', default, default);
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '신고접수로 삭제된 댓글.', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, 'Y');
insert into ta_fmadang_cmt values(fmadang_cmt_seq.nextval, null, default, 110, '신고접수로 삭제된 댓글.', default, 10000, 'admin@studium.com', '관리자', sysdate, null, null, null, default, default, 'Y');
-- 댓글의 경우
INSERT INTO TA_FMADANG_CMT VALUES(FMADANG_CMT_SEQ.NEXTVAL, NULL, DEFAULT, 110, '새로 추가된 댓글입니다.', DEFAULT, 10000, 'admin@studium.com', '관리자', SYSDATE, NULL, NULL, DEFAULT, DEFAULT, DEFAULT, DEFAULT);
-- 대댓글의 경우 
UPDATE TA_FMADANG_CMT SET CMT_SORT = CMT_SORT + 1 WHERE CMT_PARENT =  3  AND CMT_SORT >= 1;
INSERT INTO TA_FMADANG_CMT VALUES(FMADANG_CMT_SEQ.NEXTVAL, 3, 1, 110, '새로 추가된 대댓글입니다.', DEFAULT, 10000, 'admin@studium.com', '관리자', SYSDATE, SYSDATE, NULL, NULL, DEFAULT, DEFAULT, DEFAULT);

--f스터디 더미데이터
insert into F_study values(10001,'나만 믿어라','2','강남','주말',10,'영어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/10/30',5,'혜교','Y',default,20007);
insert into F_study values(10002,'언제까지 못할꺼야','2','신촌','주말',10,'고급언어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','l1.jpg','l3.jpg','l3.jpg','l4.jpg','01:00','07:00','19/11/28','19/12/30',5,'예슬','Y',default,20003);
insert into F_study values(10003,'무료스터디디','2','분당','평일',10,'저급언어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/11/15','19/12/30',5,'Hannah','Y',default,20001);
insert into F_study values(10004,'배운건 복습','2','역삼','주말',10,'중국어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','s1.jpg','s3.jpg','s3.jpg','s4.jpg','01:00','07:00','19/10/28','19/12/15',5,'재욱','Y',default,20004);
insert into F_study values(10005,'TEST F STUDY','2','역삼','주말',12,'중국어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/10/15','19/12/30',5,'박진영','Y',default,20010);
insert into F_study values(10006,'나만 믿어라','2','강남','주말',6,'일본어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','i1.jpg','i3.jpg','i3.jpg','i4.jpg','01:00','07:00','19/10/28','19/10/30',5,'혜교','Y',default,20007);
insert into F_study values(10007,'언제까지 못할꺼야','2','신촌','평일',4,'프랑스어','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','l1.jpg','l3.jpg','l3.jpg','l4.jpg','01:00','07:00','19/11/28','19/12/30',5,'예슬','Y',default,20003);
insert into F_study values(10008,'운영체제 이게 끝','2','강남','평일',3,'운영체제','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/11/15','19/12/30',5,'Hannah','Y',default,20001);
insert into F_study values(10009,'자료구조이해','2','역삼','주말',2,'자료구조','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','s1.jpg','s3.jpg','s3.jpg','s4.jpg','01:00','07:00','19/10/28','19/12/15',5,'재욱','Y',default,20004);
insert into F_study values(10010,'TEST F STUDY','2','잠실','주말',11,'국가직','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','노력은 결코 배신하지 않습니다. 의지를 갖고 최선을 다해 포기 하지 않는다면 교육과정이 끝난 후 여러분의 모습은 상상 그 이상으로 발전할 것이고 나아가 IT분야 전문가로서 탄탄한 기반을 갖춘 모습이 될 것입니다.
저만 믿고 따라 오세요! 여러분은 할 수 있습니다','a1.jpg','a3.jpg','a3.jpg','a4.jpg','01:00','07:00','19/10/11','19/12/30',5,'박진영','Y',default,20010);





--PSTUDY 더미

insert into p_study values(101,'Hannah 쌤과 스피킹','Exciting speaking','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_1.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/10/01','20/01/22',4,'Hannah','Y', 0,20001 );
insert into p_study values(102,'Hannah 쌤과 스피킹','Exciting speaking','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_2.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/10/01','20/01/22',5,'Justin','Y', 0,20002 );
insert into p_study values(103,'예슬 쌤과 스피킹','제대로 된 스피킹','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','s1.jpg','s2.jpg','s3.jpg','s4.jpg','01:00','07:00','19/12/12','20/01/22',5,'예슬','Y', 0,20003 );
insert into p_study values(104,'재욱 쌤과 중국어수업','실무에서의 중국어','역삼','평일',8,120000,'중국어','우리 같이 중국어할래요?',
'대륙을 정복하는자 세상을 정복하리니! 영어 다음으로 각광받는 외국어 언어인 중국어! 회화를 잘해서 고객사도 만나고 세일즈도 하고 취업도 하시길 기대합니다.','t_4.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00',sysdate,sysdate,4,'재욱','Y', 0,20004 );
insert into p_study values(105,'Benedict 와 진지한 영어','진지한 영국영어','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_5.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/09/20','20/01/22',4,'Benedict','Y', 0,20005 );
insert into p_study values(106,'송강 쌤과 영어','즐거운 영어스터디','역삼','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_6.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/08/12','19/09/20',4,'송강','Y', 0,20006 );
insert into p_study values(107,'면접스터디 ','실제 인사담당 혜교쌤','강남','주말',8,210000,'면접','실제 면접관이 보는 면접에 대해',
'면접 준비, 제대로 해봐요','a2.jpg','a1.jpg','a3.jpg','a4.jpg','01:00','07:00','19/12/12','20/01/22',5,'혜교','Y', 1,20007 );
insert into p_study values(108,'은우쌤과 함께 공부','잘생쁨주의','이태원','평일',8,120000,'영어','Hi guys,I specialize in Beginner, Intermediate, and Conversational English for children and adults.',
' I have a TESOL certification and more than five years of teaching experience.','t_8.jpg','p_1.jpg','p_3.jpg','p_4.jpg','01:00','07:00','19/12/12','20/01/22',4,'은우','Y', 0,20008 );
insert into p_study values(109,'정보처리기사 공부','합격합시다.','역삼','평일',8,120000,'국가기술','15년간 컴퓨터 강의 및 현장 실무를 모두 수행해온 강사가 정보처리기사 합격을 도와 드립니다.',
'문제풀이 위주로 진행할 예정입니다.','s1.jpg','s2.jpg','s3.jpg','s4.jpg','01:00','07:00','2019/12/12','2020/01/22',5,'우식','Y', 8,20009 );
insert into p_study values(110,'떠먹여주는 알고리즘','알고리즘 스터디','신촌','주말',8,50000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'박진영','Y', 0,20010 );
insert into p_study values(111,'떠먹여주는 알고리즘','알고리즘 스터디','강남','주말',8,400000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',2,'혜교','Y', 0,20007 );
insert into p_study values(112,'떠먹여주는 알고리즘','알고리즘 스터디','잠실','주말',8,200000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',3,'박진영','Y', 0,20010 );
insert into p_study values(113,'떠먹여주는 알고리즘','알고리즘 스터디','역삼','주말',8,660000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'혜교','Y', 0,20007 );
insert into p_study values(114,'떠먹여주는 알고리즘','알고리즘 스터디','잠실','주말',8,600000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'박진영','Y', 0,20010 );
insert into p_study values(115,'떠먹여주는 알고리즘','알고리즘 스터디','분당','주말',8,800000,'알고리즘','최근 IT 개발자에 대한 수요가 계속해서 증가하고 있고, 그에 따라 IT 회사로의 취업을 고려하고 있는 학생, 이직을 준비하는 비전공자 분들도 계속해서 늘어나고 있습니다. 회사의 채용 프로세스를 진행하며 코딩 테스트, 코딩 면접은 피할 수 없는 관문이고, 이를 위해 혼자서 어디서부터 어떻게 알고리즘을 공부해야 될지 막막하신 분들도 많았을 것입니다. 특히 컴퓨터 관련 전공자가 아니라면 더더욱, 이런 부분은 어렵기만 합니다.',
'이런 분들을 위해 알고리즘 스터디가 기획되었고, 스터디를 통해 알고리즘에 필요한 개념들과 문제에 적용할 수 있는 여러 스킬들을 스터디원들과 함께 학습하며 모두 자신의 것으로 만들 수 있길 기대하고 있습니다. 언어는 Java를 위주로 진행합니다. 국내 IT 대기업 S사 사내 알고리즘 강사로 활동하고 계신 리더님에게 오만가지 도움을 다 받아가세요!'
,'t_10.jpg','p_11.jpg','p_9.jpg','p_10.jpg','01:00','07:00','2019/12/12','2020/01/22',4,'박진영','Y', 0,20010 );


--찜테이블 더미데이터
insert into my_dibs values(seq_my_dibs.nextval,20011,102,null,sysdate);
insert into my_dibs values(seq_my_dibs.nextval,20011,110,null,sysdate);
insert into my_dibs values(seq_my_dibs.nextval,20011,110,null,sysdate);

--구매테이블 더미데이타
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,default,101,SYSDATE,'N',SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,default,106,SYSDATE,'Y',SYSDATE,'N','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,default,110,SYSDATE,'Y',SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,10005,default ,SYSDATE,'N',SYSDATE,'N','Y');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,10001,default,SYSDATE,'N',SYSDATE,'Y','Y');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20011,10002,default,SYSDATE,'Y',SYSDATE,'Y','N');
INSERT INTO MY_PURCHASE VALUES(seq_my_purchase.NEXTVAL,20013,default,110,SYSDATE,'Y',SYSDATE,'Y','N');

-- 댓글 더미데이터

=======
--QANDA(자주묻는질문 이메일문의)
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '제가말이죠 어쩌구저쩌구 그래서 말이죠', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '그래서 너무 하기가 싫은거 있죠 진짜 에휴', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할1 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할2 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할3 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할4 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할5 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할6 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할7 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할8 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할9 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할0 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할11 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할12 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할13 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할14 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할15 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할16 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할17 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할18 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할19 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할20 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할21 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할22 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할23 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할24 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할25 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할26 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할27 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할28 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할29 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할30 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할31 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');
INSERT INTO QANDA VALUES(SEQ_QandA.NEXTVAL, '12345@naver.com', '잘할32 수 있을까요? 제가? 흑흑 너무 어려워여', SYSDATE, 'Y');

--어드민 메뉴 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','인쿼리', '/AdminInqueryList', default, default, 1, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','포인트 관리', '/AdminPointManage', default, default, 2, default); 
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','1:1문의 관리', '/AdminQandAList', default, default, 3, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','결제 관리', '/AdminPayManage', default, default, 4, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','강사 신청 관리', '/AdminPSManage', default, default, 5, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','스터디 관리', '/AdminStudyManage', default, default, 6, default);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','강사 스터디', '/AdminStudyManage', default, default, 1, 48);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','일반 스터디', '/AdminStudyFreeManage', default, default, 2, 48);


insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','결제 내역', '/AdminPayManageList', default, default, 1, 41);
insert into ta_sidemenu_elements values(ta_sidemenu_seq.nextval, 'admin','취소 내역', '/AdminPayManageCancleList', default, default, 2, 41);

INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '자주 묻는 질문', '/AdminBoardFAQ', DEFAULT, DEFAULT, 1, DEFAULT);
INSERT INTO TA_SIDEMENU_ELEMENTS VALUES(TA_SIDEMENU_SEQ.NEXTVAL, 'adminboard', '후 기', '/AdminBoardStory', DEFAULT, DEFAULT, 2, DEFAULT);
UPDATE ta_sidemenu_elements SET use_down = 'Y' where menu_id = 22;
UPDATE ta_sidemenu_elements SET use_down = 'Y' where menu_id = 24;
update ta_sidemenu_elements set parent_id = 22 where menu_id = 27;
update ta_sidemenu_elements set parent_id = 22 where menu_id = 28;
update ta_sidemenu_elements set parent_id = 24 where menu_id = 25;
update ta_sidemenu_elements set parent_id = 24 where menu_id = 26;

commit;







