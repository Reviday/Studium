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

function fn_openCommentArea() {
	var commentArea=document.getElementById('comment');
	console.log(commentArea);
	if (commentArea.style.display == 'none') {
		commentArea.style.display = 'inline-block';
	} else {
		commentArea.style.display = 'none';
	}
};


function convertToTag(textArea) {
	var lines = textArea.value.split("\n");
	console.log(lines);
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
		location.href = path + "/madang/madangWrite?locate=" + locate + "&choice=" + choice + "&choiceSub=" + choiceSub;
	}
}

// madang Write




