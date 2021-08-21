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
					</a> <a href="<%=request.getContextPath() %>/admin/SmailRegistForm.do"
					class="btn btn-inverse ps-40px pe-40px btn-sm">전사원 쪽지</a>
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
						<li><a href="<%=request.getContextPath() %>/admin/empManage.do"><i class="fa fa-hdd fa-lg fa-fw me-2"></i> 
						전체 사원 목록 <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px"></span></a></li>
						<li class="active"><a href="<%=request.getContextPath() %>/admin/sendmail.do"><i class="fa fa-envelope fa-lg fa-fw me-2"></i> 발신함</a></li>
					</ul>
				</div>

			</div>
		</div>

		<div class="mailbox-content">
			<div class="mailbox-content-header">
				<div class="btn-toolbar">
					<!-- <div class="btn-group me-2">
						<a href="javascript:;" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-reply"></i> <span class="d-none d-lg-inline">답장</span></a>
					</div> -->
					<c:if test="${smail.smEnabled == '2' }">
					<div class="btn-group me-2"  onclick="deleteMail('${smail.smCode}');">
					
						<a href="#" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-trash"></i> <span class="d-none d-lg-inline">Delete</span></a>
					</div>
					</c:if>	
					<c:if test="${smail.smEnabled != '2' }">
					<div class="btn-group me-2"  onclick="deleteSmail('${smail.smCode}');">
						<a href="#" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-trash" ></i> <span class="d-none d-lg-inline">Delete</span></a>
					</div>
					</c:if>
					&nbsp;&nbsp;&nbsp;
						<button class="btn btn-sm btn-white" onclick="CloseWindow();">
							<span class="hidden-xs" >닫기</span>
						</button>
				</div>
			</div>
			<div class="mailbox-content-body">
			<div data-scrollbar="true" data-height="100%" data-skip-mobile="true">
					<div class="p-3">
						<h3 class="mb-3">받는 사람 :  전체 사원</h3>
						<div class="d-flex mb-3">
							<!-- <a href="javascript:;"> <img class="rounded-pill" width="48"
								alt="" src="../assets/img/user/user-12.jpg">
							</a> -->
							<div class="ps-3">
								<div class="email-from text-inverse fs-14px mb-3px fw-bold">
									제목 : ${smail.smTitle }</div>
								<div class="mb-3px">
									<i class="fa fa-clock fa-fw"></i> ${smail.smSenddate }
								</div>
							</div>
						</div>
						<hr class="bg-gray-500">
						<textarea class="summernote" style="display: none;" name="content" readonly="readonly">
						
						<c:if test="${smail.smEnabled == '3' }">
							 ${emp.empName }님께 업무를 공유하였습니다.
						</c:if>
						<c:if test="${smail.smEnabled == '2' }">
							 ${emp.empName }님을 초대하였습니다.
						</c:if>
						<c:if test="${smail.smEnabled == '1' }">
							<c:out value="${smail.smContent }" />
						</c:if>
						
						
						</textarea>
						
					
					</div>
				</div>

			</div>
		</div>


<input id="hobbyList" hidden="" name="hobbyList" value="">


	</div>
	
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

function deleteMail(smCode){
	var html='';
	/* if(confirm("쪽지를 삭제하시겠습니까?")){
		
		
	}else{
		return;
	} */
	
	
	   swal({
           title: '쪽지 삭제',
           text: '쪽지를 삭제하시겠습니까?',
           icon: 'warning', // primary success warning danger
           buttons: {
               cancel: {
                   text: '취소',
                   value: false,
                   visible: true,
                   className: 'btn btn-default',
                   closeModal: true,
                 },
                 confirm: {
                   text: '확인',
                   value: true,
                   visible: true,
                   className: 'btn btn-primary',
                   closeModal: true
                 }
           }
         }).then(function(val){
            if(val == true){
               // true
            } else {
            	return;
            }
         });
	
	
	html += ''+smCode+'';
	$('#hobbyList').val(html);   
	
	var checked = $('#hobbyList').val();
	
	var data = {
			"checked":checked
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/deleteSmail",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
			<%-- alert("선택하신 쪽지를 삭제하였습니다\n초대쪽지는 영구삭제됩니다.");
			 /* CloseWindow();  */
			window.location.href="<%=request.getContextPath() %>/mypage/sendmail.do"; --%>
			
			swal({
				title: '성공',
				text: '선택하신 쪽지를 삭제하였습니다\n초대쪽지는 영구삭제됩니다.',
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
				window.location.href="<%=request.getContextPath() %>/mypage/sendmail.do";
			});
		},
		
		error:function(error){
			<%-- alert("선택하신 쪽지를 삭제하였습니다\n초대쪽지는 영구삭제됩니다.");
			/* CloseWindow();  */
			window.location.href="<%=request.getContextPath() %>/mypage/sendmail.do"; --%>
			swal({
				title: '성공',
				text: '선택하신 쪽지를 삭제하였습니다\n초대쪽지는 영구삭제됩니다.',
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
				window.location.href="<%=request.getContextPath() %>/mypage/sendmail.do";
			});
			
			
		}
		
	});
	
	
	
}
function deleteSmail(smCode){
	var html='';
	/* if(confirm("쪽지를 삭제하시겠습니까?")){
		
		
	}else{
		return;
	} */
	
	   swal({
           title: '쪽지 삭제',
           text: '쪽지를 삭제하시겠습니까?',
           icon: 'warning', // primary success warning danger
           buttons: {
               cancel: {
                   text: '취소',
                   value: false,
                   visible: true,
                   className: 'btn btn-default',
                   closeModal: true,
                 },
                 confirm: {
                   text: '확인',
                   value: true,
                   visible: true,
                   className: 'btn btn-primary',
                   closeModal: true
                 }
           }
         }).then(function(val){
            if(val == true){
               // true
            } else {
            	return;
            }
         });
	
	html += ''+smCode+'';
	$('#hobbyList').val(html);   
	
	var checked = $('#hobbyList').val();
	
	var data = {
			"checked":checked
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/deleteSmailList",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
			<%-- alert("선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.");
			/* CloseWindow();  */
			window.location.href="<%=request.getContextPath() %>/admin/sendmail.do"; --%>
			swal({
				title: '성공',
				text: '선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.',
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
				window.location.href="<%=request.getContextPath() %>/admin/sendmail.do";
			});
			
		},
		
		error:function(error){
			
			<%-- alert("선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.");
			/* CloseWindow();  */
			window.location.href="<%=request.getContextPath() %>/admin/sendmail.do"; --%>
		
			swal({
				title: '성공',
				text: '선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.',
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
				window.location.href="<%=request.getContextPath() %>/admin/sendmail.do";
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








