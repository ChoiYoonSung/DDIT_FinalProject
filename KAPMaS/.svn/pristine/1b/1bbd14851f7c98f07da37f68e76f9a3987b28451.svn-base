<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<% 
int i = 0 ;
int b = 0;
%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<head>
<style>
.pds-wrapper{
	margin: 0 auto;
	width:70%;
}
.pds-wrapper h2{
	text-align: center;
}
tr{
	border-color: #ffd900;
}
th:nth-child(n+3), td:nth-child(n+3){
	text-align: center;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #ffc82d;
    border-color: #ffc82d;
}
</style>
</head>
<body style=" background: white;">
	
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
						<li class="active"><a href="#"><i class="fa fa-hdd fa-lg fa-fw me-2"></i> 
						수신함 <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px">52</span></a></li>
					<!-- 	<li><a href="email_inbox.html"><i
								class="fa fa-flag fa-lg fa-fw me-2"></i> Important</a></li> -->
						<li><a href="<%=request.getContextPath() %>/mypage/sendmail.do"><i class="fa fa-envelope fa-lg fa-fw me-2"></i> 발신함</a></li>
						<!-- <li><a href="email_inbox.html"><i
								class="fa fa-save fa-lg fa-fw me-2"></i> Drafts</a></li> -->
						<li><a href="#"><i class="fa fa-trash-alt fa-lg fa-fw me-2"></i> 휴지통</a></li>
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
					<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
						<div class="ps__thumb-x" tabindex="0"
							style="left: 0px; width: 0px;"></div>
					</div>
					<div class="ps__rail-y" style="top: 0px; right: 0px;">
						<div class="ps__thumb-y" tabindex="0"
							style="top: 0px; height: 0px;"></div>
					</div>
				</div>

			</div>
		</div>


		<div class="mailbox-content">
			<div class="mailbox-content-header">

				<div class="btn-toolbar align-items-center">
					<div class="form-check me-2">
						<input type="checkbox" class="form-check-input" data-checked="email-checkbox" id="all" data-change="email-select-all"> 
						<label class="form-check-label" for="all"></label>
					</div>
					<!-- <div class="dropdown me-2">
						<button class="btn btn-white btn-sm" data-bs-toggle="dropdown">
							View All <span class="caret ms-3px"></span>
						</button>
						<div class="dropdown-menu">
							<a href="javascript:;" class="dropdown-item">
							<i class="fa fa-circle fs-9px fa-fw me-2"></i> All</a> 
							<a href="javascript:;" class="dropdown-item">
							<i class="fa fa-circle fs-9px fa-fw me-2 text-muted"></i> Unread</a> 
							<a href="javascript:;" class="dropdown-item"><i class="fa fa-circle fs-9px fa-fw me-2 text-blue"></i> Contacts</a> 
							<a href="javascript:;" class="dropdown-item"><i class="fa fa-circle fs-9px fa-fw me-2 text-success"></i> Groups</a>
							<a href="javascript:;" class="dropdown-item"><i class="fa fa-circle fs-9px fa-fw me-2 text-warning"></i>Newsletters</a> 
							<a href="javascript:;" class="dropdown-item"><i class="fa fa-circle fs-9px fa-fw me-2 text-danger"></i> Socialupdates</a> 
							<a href="javascript:;" class="dropdown-item"><i class="fa fa-circle fs-9px fa-fw me-2 text-indigo"></i>Everything else</a>
						</div>
					</div> -->
					<%-- <button class="btn btn-sm btn-white me-2">
						<a href="<%=request.getContextPath() %>/mypage/sendmail.do"><i class="fa fa-redo"></i></a>
					</button>
					<div class="w-100 d-sm-none d-block mb-2"
						data-email-action="divider"></div>
 --%>
					<div class="btn-group" onclick="deleteSmail()">
						<button class="btn btn-sm btn-white"
							data-email-action="delete" >
							<i class="fa fa-times me-1"></i> <span class="hidden-xs" >Delete</span>
						</button>
						<!-- <button class="btn btn-sm btn-white hide"
							data-email-action="archive">
							<i class="fa fa-folder me-1"></i> <span class="hidden-xs">Archive</span>
						</button>
						<button class="btn btn-sm btn-white hide"
							data-email-action="archive">
							<i class="fa fa-trash me-1"></i> <span class="hidden-xs">Junk</span>
						</button> -->
					</div>


					<div class="btn-group ms-auto">
						<button class="btn btn-white btn-sm">
							<i class="fa fa-chevron-left"></i>
						</button>
						<button class="btn btn-white btn-sm">
							<i class="fa fa-chevron-right"></i>
						</button>
					</div>

				</div>

			</div>
			<div class="mailbox-content-body">
				<div data-scrollbar="true" data-height="100%"
					data-skip-mobile="true" class="ps ps--active-y" data-init="true"
					style="height: 100%;">

					<ul class="list-group list-group-lg no-radius list-email">
						
						
						<c:forEach items="${rmailList }" var="rmail" >
						<% i++; %>
						<c:if test="${rmail.rmRstatus == 0}">
						<% b++; %>
						<li class="list-group-item unread">
							<div class="email-checkbox">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" data-checked="email-checkbox" name="hobby" id="all<%=i %>" value="${rmail.rmCode }"> 
									<label class="form-check-label" for="all<%=i %>"></label>
								</div>
							</div> <a href="email_detail.html" class="email-user bg-blue"> <span class="text-white">F</span>
						</a>
							<div class="email-info" >
								<a href="<%=request.getContextPath() %>/mypage/RmailDetail.do?rmCode=${rmail.rmCode }"> <span class="email-sender">${rmail.rmSender }</span> 
								<span class="email-title"><c:out value="${rmail.rmTitle }" /></span> 
								<span class="email-time">${rmail.rmReceivedate }</span>
								</a>
							</div>
						</li>
						</c:if>
						
						<c:if test="${rmail.rmRstatus == 1}">
						<li class="list-group-item">
							<div class="email-checkbox">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" data-checked="email-checkbox" name="hobby" id="all<%=i %>" value="${rmail.rmCode }"> 
									<label class="form-check-label" for="all<%=i %>"></label>
								</div>
							</div> <a href="email_detail.html" class="email-user bg-blue"> <span class="text-white">F</span>
						</a>
						<div class="email-info" >
								<a href="<%=request.getContextPath() %>/mypage/RmailDetail.do?rmCode=${rmail.rmCode }"> <span class="email-sender">${rmail.rmSender }</span> 
								<span class="email-title"><c:out value="${rmail.rmTitle }" /></span> 
								<span class="email-time">${rmail.rmReceivedate }</span>
								</a>
							</div>
						</li>
						</c:if>
						
						</c:forEach>
					
					</ul>

					<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
						<div class="ps__thumb-x" tabindex="0"
							style="left: 0px; width: 0px;"></div>
					</div>
					<div class="ps__rail-y"
						style="top: 0px; height: 764px; right: 0px;">
						<div class="ps__thumb-y" tabindex="0"
							style="top: 0px; height: 635px;"></div>
					</div>
				</div>
			</div>
			<div class="mailbox-content-footer d-flex align-items-center">
				<div class="text-inverse fw-bold">안읽은 메세지 <%=b %> 개</div>
				<div class="btn-group ms-auto">
					<button class="btn btn-white btn-sm">
						<i class="fa fa-fw fa-chevron-left"></i>
					</button>
					<button class="btn btn-white btn-sm">
						<i class="fa fa-fw fa-chevron-right"></i>
					</button>
				</div>
			</div>
		</div>

	</div>
<% i=0; %>	
<% b=0; %>	
<input id="hobbyList" hidden="" name="hobbyList" value="">
	
	
	<script>
	window.onload = function() {
		$("#all").click(function(){
			var isChecked = $(this).prop("checked");
			if(isChecked){
				$("[name=hobby]").prop("checked",true);
			}else {
				$("[name=hobby]").prop("checked",false);
			}
		});
		
		$("[name=hobby]").click(function(){
			var num = $("[name=hobby]:checked").not("#allChk").length;
			
			if(num == 5){
				$("#all").prop("checked",true);
			}else {
				$("#all").prop("checked",false);
			}
		});
	}
	
	function palist_go(page, url) {

		if (!url)
			url = "receivemail.do";

		var jobForm = $('#jobForm');
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());

		$('form#jobForm').attr({
			action : url,
			method : 'get'
		}).submit();

	}
	
	
	
	function deleteSmail(){
		var html='';
		$('#hobbyList').val(html);   
		
		var num = $("[name=hobby]:checked").not("#allChk").length;
		
		if(num == 0 ){
			alert("선택한 쪽지가 없습니다.");	
			return;
		}

		
		if(confirm("선택한 쪽지를 삭제하시겠습니까?")){
			
			
		}else{
			return;
		}
		
		if(num == 1){
			 var id= $("[name=hobby]:checked");
			html += ''+id.attr('value')+'';
			$('#hobbyList').val(html);   
		}else {
		
		for(var i = 0; i < num; i++){
			
			 var id= $("[name=hobby]:checked").eq(i);
			 if(i == 0 ){
			 html += ''+id.attr('value')+'';
			 continue;
			 }
			 html += ',';
			 html += ''+id.attr('value')+'';
			 
			  $('#hobbyList').val(html);   
			}
		}
		
		var checked = $('#hobbyList').val();
		
		var data = {
				"checked":checked
		}
		
		$.ajax({
			url : "<%=request.getContextPath() %>/mypage/deleteRmailList",
			type : "post",
			data : JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			success:function(data){
				
				alert("선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.");
				history.go(0);
			},
			
			error:function(error){
				alert("선택하신 쪽지를 삭제하였습니다\n쪽지는 휴지통에 보관되어 30일 후 영구삭제됩니다.");
				history.go(0);		
			}
			
		});
		
		
	}
	</script>
	
</body>


