-- 초기 계정 관리자/일반 사용자
insert into ta_member values(mem_seq.NEXTVAL,'admin@studium.com','x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==','관리자','M','1990/01/01','','M',99999999,'','','','','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','studium_logo.png',default,default,default);
insert into ta_member values(mem_seq.NEXTVAL, 'asd@naver.com', 'x61Ey612Kl2gpFL56FT9weDnpSo4AV8j8+qx2AuTHdRyY036xxzTTrw10Wq3+4qQyB+XURPWx1ONxp3Y3pB37A==', '아무개','A','','',default, 0,null,null,null,'','','',default,default,default,default,default,'Y',sysdate,'',sysdate,'','','','','',default,default,default);

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












commit;







