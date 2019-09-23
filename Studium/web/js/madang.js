// madangView 
function fn_writeComment(cmtNo) {
	var replyArea=document.getElementById('re_conmmentRep'+cmtNo);
	var replys=document.getElementsByClassName('_cminputRep');

	//해당되는 reply를 제외하고는 모두 none으로 맞춰준다.
	//reply는 하나만 열도록 하기 위함
	for(var i=0; i<replys.length; i++) {
		//id값이 같지 않으면 none 처리.
		if(replyArea.id!=replys[i].id){
			replys[i].style.display='none';
		}
	}

	if(replyArea.style.display == 'none') {
		replyArea.style.display='inline-block';
	} else {
		replyArea.style.display='none';
	}
};

function fn_needLogin() {
	alert("로그인 후 이용바랍니다.");
}

function fn_addComment(REMOTE_ADDR, madangNo, memberNo, memEmail, memName) {
	var commentArea=document.getElementById('comment_text');
	var path = window.location.pathname;
	location.href=path+"/madang/addComment?madangNo="+ madangNo + "&memberNo=" + madangNo 
	+ "&memEmail=" + memEmail + + "&memName=" + memName + "&content=" + commentArea.value + "&REMOTE_ADDR=" + REMOTE_ADDR;
};