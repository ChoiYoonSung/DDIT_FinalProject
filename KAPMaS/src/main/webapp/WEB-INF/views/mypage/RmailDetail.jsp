<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<head>
	<style type="text/css">
	body{
		background-color: white;
	}
	
	h1 {
		text-align: center;
	
	}	
	</style>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.perfect-scrollbar/0.6.5/js/min/perfect-scrollbar.jquery.min.js"></script>


<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/tag-it/css/jquery.tagit.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.css" rel="stylesheet" />
</head>


<body>
	<div class="mailbox">

		<div class="mailbox-sidebar">
			<div class="mailbox-sidebar-header d-flex justify-content-center">
				<a href="#emailNav" data-bs-toggle="collapse"
					class="btn btn-inverse btn-sm me-auto d-block d-lg-none"> <i
					class="fa fa-cog"></i>
				</a> <a href="<%=request.getContextPath() %>/mypage/SmailRegistForm.do"
					class="btn btn-inverse ps-40px pe-40px btn-sm"> 쪽지 보내기 </a>
			</div>
			<div class="mailbox-sidebar-content collapse d-lg-block"
				id="emailNav">

				<div data-scrollbar="true" data-height="100%"
					data-skip-mobile="true" class="ps" data-init="true"
					style="height: 100%;">
					<div class="nav-title">
						<b>FOLDERS</b>
					</div>
					<ul class="nav nav-inbox">
						<li  class="active"><a href="<%=request.getContextPath() %>/mypage/receivemail.do"><i class="fa fa-hdd fa-lg fa-fw me-2"></i> 
						수신함 <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px"></span></a></li>
					<!-- 	<li><a href="email_inbox.html"><i
								class="fa fa-flag fa-lg fa-fw me-2"></i> Important</a></li> -->
						<li><a href="<%=request.getContextPath() %>/mypage/sendmail.do"><i class="fa fa-envelope fa-lg fa-fw me-2"></i> 발신함</a></li>
						<!-- <li><a href="email_inbox.html"><i
								class="fa fa-save fa-lg fa-fw me-2"></i> Drafts</a></li> -->
					</ul>
					<!-- <div class="nav-title">
						<b>LABEL</b>
					</div>
					<ul class="nav nav-inbox">
						<li><a href="javascript:;"><i
								class="fa fa-fw fa-lg fs-12px me-2 fa-circle text-inverse"></i>
								Admin</a></li>
						<li><a href="javascript:;"><i
								class="fa fa-fw fa-lg fs-12px me-2 fa-circle text-blue"></i>
								Designer &amp; Employer</a></li>
						<li><a href="javascript:;"><i
								class="fa fa-fw fa-lg fs-12px me-2 fa-circle text-success"></i>
								Staff</a></li>
						<li><a href="javascript:;"><i
								class="fa fa-fw fa-lg fs-12px me-2 fa-circle text-warning"></i>
								Sponsorer</a></li>
						<li><a href="javascript:;"><i
								class="fa fa-fw fa-lg fs-12px me-2 fa-circle text-danger"></i>
								Client</a></li>
					</ul> -->
				</div>

			</div>
		</div>

		<div class="mailbox-content">
			<div class="mailbox-content-header">
				<div class="btn-toolbar">
					<div class="btn-group me-2" onclick="reSend('${rmail.rmSender }');">
						<a href="#" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-reply"></i> <span class="d-none d-lg-inline">답장</span></a>
					</div>
					
					
						<div class="btn-group">
						&nbsp;&nbsp;&nbsp;
						<button class="btn btn-sm btn-white" onclick="CloseWindow();">
							<span class="hidden-xs" >닫기</span>
						</button>
					</div>
					
				</div>
			</div>
			<div class="mailbox-content-body">

				<div data-scrollbar="true" data-height="100%" data-skip-mobile="true">
					<div class="p-3">
						<h3 class="mb-3">보낸 사람 :  ${emp.empName }</h3>
						<div class="d-flex mb-3">
							<!-- <a href="javascript:;"> <img class="rounded-pill" width="48"
								alt="" src="../assets/img/user/user-12.jpg">
							</a> -->
							<div class="ps-3">
								<div class="email-from text-inverse fs-14px mb-3px fw-bold">
									제목 : ${rmail.rmTitle }</div>
								<div class="mb-3px">
									<i class="fa fa-clock fa-fw"></i> ${rmail.rmReceivedate }
								</div>
							</div>
						</div>
						<hr class="bg-gray-500">
							<textarea class="summernote" style="display: none;" name="content" readonly="readonly">
											
							<c:if test="${rmail.rmEnabled != '1' }">
								${rmail.rmContent }
							</c:if>
							<c:if test="${rmail.rmEnabled == '1' }">
								<c:out value="${rmail.rmContent }" />
							</c:if>
											</textarea>
					</div>
				</div>

			</div>
		</div>


<input id="hobbyList" hidden="" name="hobbyList" value="">


	</div>
	
	
	<input type="text" hidden="" id="empId" value="${loginUser.empId }">
	<input type="text" hidden="" id="rmCode" value="${rmail.rmCode }">
	
	
<script type="text/javascript">

window.onload = function() {
	$(".summernote").summernote({
	    placeholder: '내용을 입력해주세요.',
	    height: "300",
	    minHeight: "300",              
	    maxHeight: "300",
	    disableResizeEditor: true,
	    toolbar : false
    });
	
	$('.summernote').summernote('disable');
}

function reSend(sender){
	
	location.href="<%=request.getContextPath()%>/mypage/reSend?sender="+sender;
}

function Close(){
	var html='';
	var rmCode = $("#rmCode").val();
	
	
	html += ''+rmCode+'';
	$('#hobbyList').val(html);   
	var checked = $('#hobbyList').val();
	
	var data = {
			"checked":checked
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/deleteRmail",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
		<%-- 	alert("초대를 거절하였습니다");
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do"; --%>
			
			swal({
				title: '초대 거절',
				text: '초대를 거절하였습니다',
				icon: 'warning', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-warning',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			});
			
		},
		
		error:function(error){
			<%-- alert("초대를 거절하였습니다");
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			 --%>
		}
		
	});
	
	
	
}











function projecterIn(pCode){
	
	var empId = $("#empId").val();
	var rmCode = $("#rmCode").val();
	
	var data = {
			"empId" : empId
			,"pCode": pCode
			,"rmCode":rmCode
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/project/projecter",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
			<%-- alert("초대가 완료되었습니다.");
			
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do"; --%>
			
			swal({
				title: '성공',
				text: '초대가 완료되었습니다.',
				icon: 'success', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-success',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			});
			
		},
		
		error:function(error){
			<%-- alert("초대가 완료되었습니다.");
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do"; --%>
		
		}
		
	});
}

function acceptCopInvite(copCode){
	var empId = $("#empId").val();
	var form = {
			"empId" : empId
			,"copCode":copCode
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/cop/detail/acceptInvite.do",
		type : "POST",
		data : form,
		success : function(data) {
			<%-- alert("초대를 수락했습니다.");
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			 --%>
			swal({
				title: '성공',
				text: '초대를 수락했습니다.',
				icon: 'success', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-success',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			});
			
		},
		error : function() {
			<%-- alert("오류가 발생했습니다.");
			window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do"; --%>
			
			swal({
				title: '성공',
				text: '초대를 수락했습니다.',
				icon: 'success', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-success',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				window.location.href="<%=request.getContextPath() %>/mypage/receivemail.do";
			});
		}
	});
}




</script>
			
	<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/vendor.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/app.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/theme/default.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>


<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/jquery-migrate/dist/jquery-migrate.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/tag-it/js/tag-it.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/summernote/dist/summernote-lite.min.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/js/demo/email-compose.demo.js" type="bb927df14e4b0356ad5b69fe-text/javascript"></script>

<script type="bb927df14e4b0356ad5b69fe-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

	</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="bb927df14e4b0356ad5b69fe-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"66f2ccb658aadd8f","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>

<ul id="ui-id-1" tabindex="0" class="ui-menu ui-widget ui-widget-content ui-autocomplete ui-front tagit-autocomplete" style="display: none;"></ul>
<div role="status" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>
<div class="note-modal-backdrop" style="display: none;">


	<script type="text/javascript">

window.setTimeout(function(){
	
	$(".note-insert").hide();
	
},100);
	


</script>
	
	
</body>








