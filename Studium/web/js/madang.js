$(document).ready(function(){
	$(".ablock").on("click",function(event){// a태그 클릭시 작동
	  // 클릭된 태그의 본래의 기능을 막음 즉, a태그 본래 기능을 막음
	  event.preventDefault();
    });
  });

// madangView 
function fn_writeComment(cmtNo) {
	var replyArea = document.getElementById('re_conmmentRep' + cmtNo);
	var replys = document.getElementsByClassName('_cminputRep');

	//해당되는 reply를 제외하고는 모두 none으로 맞춰준다.
	//reply는 하나만 열도록 하기 위함
	for (var i = 0; i < replys.length; i++) {
		//id값이 같지 않으면 none 처리.
		if (replyArea.id != replys[i].id) {
			replys[i].style.display = 'none';
		}
	}

	if (replyArea.style.display == 'none') {
		replyArea.style.display = 'inline-block';
	} else {
		replyArea.style.display = 'none';
	}
};

function fn_needLogin() {
	alert("회원만 이용가능합니다.");
}

function fn_addComment(memCheck, locate, path, REMOTE_ADDR, madangNo, memberNo, memEmail, memName, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_text'));
		location.href = path + "/madang/" + locate + "AddComment?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage + "&chocie" + choice + "&choiceSub=" + choiceSub;
	}
};

function fn_updateComment(cmtNo, memCheck, locate, path, REMOTE_ADDR, madangNo, memberNo, memEmail, memName, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_edit_'+cmtNo));
		location.href = path + "/madang/" + locate + "UpdateComment?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage + "&chocie" + choice + "&choiceSub=" + choiceSub +"&cmtNo=" + cmtNo;
	}
};

function fn_deleteComment(cmtNo, memCheck, locate, path, madangNo, memberNo, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href = path + "/madang/" + locate + "DeleteComment?madangNo=" + madangNo + "&memberNo=" + memberNo
						+ "&cPage=" + cPage + "&chocie" + choice + "&choiceSub=" + choiceSub +"&cmtNo=" + cmtNo;
		}
	}
};

function fn_addReply(cmtNo, memCheck, locate, path, REMOTE_ADDR, madangNo, cmtNo, memberNo, memEmail, memName, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_text_rep_'+cmtNo));
		location.href = path + "/madang/" + locate + "AddReply?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage + "&cmtNo=" + cmtNo + "&chocie" + choice +"&choiceSub=" + choiceSub;
	}
};

function fn_updateReply(cmtNo, memCheck, locate, path, REMOTE_ADDR, madangNo, memberNo, memEmail, memName, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_edit_'+cmtNo));
		location.href = path + "/madang/" + locate + "UpdateReply?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage + "&chocie" + choice + "&choiceSub=" + choiceSub +"&cmtNo=" + cmtNo;
	}
};

function fn_deleteReply(cmtNo, cmtParent, cmtSort, memCheck, locate, path, madangNo, memberNo, cPage, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href = path + "/madang/" + locate + "DeleteReply?madangNo=" + madangNo + "&memberNo=" + memberNo
						+ "&cPage=" + cPage + "&chocie" + choice + "&choiceSub=" + choiceSub +"&cmtNo=" + cmtNo + "&cmtParent=" + cmtParent +"&cmtSort=" + cmtSort;
		}
	}
};

function fn_openCommentArea() {
	var commentArea=document.getElementById('comment');
	console.log(commentArea);
	if (commentArea.style.display == 'none') {
		commentArea.style.display = 'inline-block';
	} else {
		commentArea.style.display = 'none';
	}
};

function fn_likeUp(path, rocate, madangNo, memNo, REMOTE_ADDR) {
	$.ajax({
		url:path+"/madang/"+rocate+"MadangLikeUp",
		type:"post",
		dataType:"json",
		data: { "madangNo" :madangNo, 
				"memNo" : memNo,
				"REMOTE_ADDR" : REMOTE_ADDR},
		success : function(data) {
			alert(data.msg);
			
		}
	});
};

function convertToTag(textArea) {
	var lines = textArea.value.split("\n");
	// generate HTML version of text
	var resultString = "<p>";
	for (var i = 0; i < lines.length; i++) {
		resultString += lines[i] + "<br />";
	}
	resultString += "</p>";

	return resultString;
}


// madangList
function fn_madangWrite(memCheck, path, locate, choice, choiceSub) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		location.href = path + "/madang/madangWrite?locate=" + locate + 
			"&choice=" + choice + "&choiceSub=" + choiceSub;
	}
}

// madangView
function fn_madangUpdate(memCheck, path, locate, madangNo, choice, choiceSub, cPage) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		location.href = path + "/madang/madangUpdate?locate=" + locate +
			"&madangNo=" + madangNo + "&choice=" + choice + "&choiceSub=" + 
			choiceSub + "&cPage=" + cPage;
	}
}

function fn_madangDelete(memCheck, path, locate, madangNo, choice, choiceSub, cPage) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href = path + "/madang/" + locate + "MadangDelete" +
			"?madangNo=" + madangNo + "&memNo=" + memCheck + "&choice=" + 
			choice + "&choiceSub=" + choiceSub + "&cPage=" + cPage;	
		}
	}
}

function fn_editComment(cmtNo) {
	var editCmt = document.getElementById('edit_textarea_' + cmtNo);
	const content = $("#cmt_target_"+cmtNo).html();
	const editTa = $("#comment_edit_"+cmtNo);
	var editSpeech = document.getElementById('speech_' + cmtNo);
	var allSpeech = document.getElementsByClassName('speech');
	var allEditCmt = document.getElementsByClassName('edit-content');

	//해당되는 수정텍스트에어리어를 제외하고는 모두 none으로 맞춰준다.
	//edit은 하나만 열도록 하기 위함
	for (var i = 0; i < allEditCmt.length; i++) {
		//id값이 같지 않으면 none 처리.
		if (editCmt.id != allEditCmt[i].id) {
			allSpeech[i].style.display = 'inline-block'
			allEditCmt[i].style.display = 'none';
		}
	}
	
	// 
	var content2=content.trim().substring(3);
	var content3=content2.substring(0,content2.length-4);
	var resultString = content3.replaceAll('<br>','\n').trim();
	
	editTa.val(resultString);
	if (editCmt.style.display == 'none') {
		editCmt.style.display = 'inline-block';
		editSpeech.style.display = 'none';
	} else {
		editCmt.style.display = 'none';
		editSpeech.style.display = 'inline-block';
	}
}



String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}

// madang Write




