package com.studium.madang.model.vo;

import java.sql.Timestamp;

public abstract class Madang {
	
	private int madangNo; // 글번호
	private int madangWriterUid; // 글쓴이 uid
	private String madangWriterEmail; // 글쓴이 이메일
	private String madangWriterName; // 글쓴이 이름
	private String madangTitle; // 글 제목
	private int madangLevel; // 문제 난이도(Level 1~5)
	private String madangContent; // 글 내용
	private String madangMainCategory; // 대분류(관리자 고정)
	private String madangCategory; // 중분류(관리자 고정)
	private String madangSubCategory; // 소분류(사용자 지정)
	private Timestamp madangRegisterDatetime; // 글 작성 일시
	private String madangRegisterIp; // 글 작성 ip 주소
	private Timestamp madangUpdatedDatetime; // 글 수정 일시
	private String madangUpdatedIp; // 글 수정 ip 주소
	private int madangRecCount; // 글 추천 수(recommand)
	private int madangRepCount; // 글 댓글 수(reply)
	private int madangReadCount; // 조회수
	private int madangForkCount; // 글 포크 수
	private int madangAnswerCount; // 글 답변(풀이) 수 
	private char madangStatus; // 삭제 여부
	private String profilePath; // 프로필 사진의 경로를 담아두는 곳으로, cmt DB에는 없고 DAO로 불러오는 과정에 삽입된다.
}
