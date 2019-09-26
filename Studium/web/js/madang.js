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

function fn_addComment(memCheck, path, REMOTE_ADDR, madangNo, memberNo, memEmail, memName, cPage) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_text'));
		location.href = path + "/madang/freeAddComment?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage;
	}
};

function fn_addReply(memCheck, path, REMOTE_ADDR, madangNo, cmtNo, memberNo, memEmail, memName, cPage) {
	if (memCheck == "null") {
		fn_needLogin();
	} else {
		var commentArea = convertToTag(document.getElementById('comment_text_rep'));
		location.href = path + "/madang/freeAddReply?madangNo=" + madangNo + "&memberNo=" + memberNo
			+ "&memEmail=" + memEmail + "&memName=" + memName + "&content=" + commentArea.value
			+ "&REMOTE_ADDR=" + REMOTE_ADDR + "&cPage=" + cPage + "&cmtNo=" + cmtNo;
	}
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
		location.href = path + "/madang/madangWrite?locate=" + locate + "&choice=" + choice + "&choiceSub=" + choiceSub;
	}
}

// madang Write




