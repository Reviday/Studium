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

function fn_addComment(REMOTE_ADDR, madangNo) {
	var commentArea=document.getElementById('comment_text');
	console.log(commentArea.value);
	var path = window.location.pathname;
	console.log(REMOTE_ADDR);
	//location.href=path+"/madang/addComment?madangNo="+ madangNo + "&content="+commentArea.value;
};