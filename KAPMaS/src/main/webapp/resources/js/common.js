//spring_security redirect loginForm
function AjaxErrorSecurityRedirectHandler(status) {
	if (status == "302") {
		alert("세션이 만료되었습니다.\n로그인 하세요.");
		location.reload();

	} else {
		alert("시스템장애로 실행이 불가합니다.");
		history.go(-1);
	}

}

// pagination list up 함수
// page: 페이지 번호, url : list url
function list_go(page, url) {

	if (!url)
		url = "list.do";

	var jobForm = $('#jobForm');
	// alert($('select#perPageNum').val());
	jobForm.find("[name='page']").val(page);
	jobForm.find("[name='perPageNum']").val(
			$('select[name="perPageNum"]').val());
	jobForm.find("[name='searchType']").val(
			$('select[name="searchType"]').val());
	jobForm.find("[name='keyword']").val(
			$('div.input-group>input[name="keyword"]').val());

	$('form#jobForm').attr({
		action : url,
		method : 'get'
	}).submit();

}

// 팝업창들 뛰우기
// 새로운 Window창을 Open할 경우 사용되는 함수 ( arg : 주소 , 창타이틀 , 넓이 , 길이 )
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width=" + WinWidth
			+ ", " + "height=" + WinHeight + ", top=" + wintop + ", left="
			+ winleft + ", resizable=yes, status=yes");
	win.focus();
}

// 팝업창 닫기
function CloseWindow(parentURL) {
	if (parentURL) {
		window.opener.parent.location.href = parentURL;
	} else {
		window.opener.parent.location.reload(true);
	}
	window.close();
}

// 사용자 사진 미리보기
function MemberPictureThumb(targetObj, fileName) { // (대상, 이미지파일명)
	targetObj.style.backgroundImage = "url('/KAPMaS/emp/getPicture.do?empImg=" + fileName + "')";
	targetObj.style.backgroundPosition = "center";
	targetObj.style.backgroundRepeat = "no-repeat";
	targetObj.style.backgroundSize = "cover";
}

// 쪽지 알림
window.setTimeout(function(){	
	notification = setInterval(function() {
		$.ajax ({
			url : "/KAPMaS/common/notification.do",  
			method : "get",
			success : function (data) { 
				if(data == "new"){ // 새로운 쪽지 도착
					$.gritter.add({
					    title: '새 쪽지가 도착했습니다!',
					    text: '확인해보세요~',
					    sticky: false,
					    time: '',
					    image: '/KAPMaS/resources/images/message_icon.png',
					    class_name: 'gritter-light',
					    before_open: function(){ },
					    after_open: function(e){ },
					    before_close: function(manual_close) { },
					    after_close: function(manual_close){ } 
					  });
                }else{
                }
			}
		});
	}, 10000); 
}, 200);


