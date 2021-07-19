<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>







<head>
	<style type="text/css">
	body{
		background-color: white;
	}
	
	h1 {
		text-align: center;
	
	}	
	.pds-wrapper{
	margin: 0 auto;
	width:50%;
}
	</style>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/vendor.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/default/app.min.css" rel="stylesheet" />


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
						<li><a href="<%=request.getContextPath() %>/mypage/receivemail.do"><i class="fa fa-hdd fa-lg fa-fw me-2"></i> 
						수신함 <span class="badge bg-gray-600 fs-10px rounded-pill ms-auto fw-bolder pt-4px pb-5px px-8px">52</span></a></li>
					<!-- 	<li><a href="email_inbox.html"><i
								class="fa fa-flag fa-lg fa-fw me-2"></i> Important</a></li> -->
						<li  class="active"><a href="#"><i class="fa fa-envelope fa-lg fa-fw me-2"></i> 발신함</a></li>
						<!-- <li><a href="email_inbox.html"><i
								class="fa fa-save fa-lg fa-fw me-2"></i> Drafts</a></li> -->
						<li><a href="email_inbox.html"><i class="fa fa-trash-alt fa-lg fa-fw me-2"></i> 휴지통</a></li>
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
					<div class="btn-group me-2" onclick="send();">
						<a href="#" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-envelope"></i> <span class="hidden-xs">Send</span></a>
					</div>
					<div>
						<select style="width: 120px; float: left;" name="dep" id="dep"
							class="form-select">
							<option value="">-부서 선택-</option>
							<c:forEach items="${depList }" var="dep">
								<option value="${dep.depCode }">${dep.depName }</option>
							</c:forEach>

						</select>
					</div>
					&nbsp;&nbsp;
					<div>
						<button type="button" class="btn btn-white me-1 mb-1" onclick="getList();">찾기</button>
					</div>
					<!-- <div class="ms-auto">
						<a href="email_inbox.html" class="btn btn-white btn-sm"><i
							class="fa fa-fw fa-times"></i> <span class="hidden-xs">Discard</span></a>
					</div> -->
				</div>

			</div>
			<div class="mailbox-content-body">

				<div data-scrollbar="true" data-height="100%"
					data-skip-mobile="true" class="ps" data-init="true"
					style="height: 100%;">

					<form action="regist.do" method="post" enctype="multipart/form-data" name="sendForm">

						<div class="mailbox-to">
						 <table class="table">
							  <thead>
								<tr>
									<th>직급</th>
									<th>이름</th>
									<th>선택</th>
								</tr>
							</thead>
								<tbody id="depList"></tbody>		
							  </table>
						</div>
						<div class="mailbox-to">
							<label class="control-label">To: </label>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<u id="addList"></u>
						</div>						
				
						<div data-id="extra-cc"></div>

						<div class="mailbox-subject">
							<input type="text" class="form-control" id="paTitle" name="title" placeholder="제목을 입력하세요">
						</div>


						<div class="mailbox-input">
							<textarea class="summernote" style="display: none;" name="content"></textarea>
						</div>
							<input hidden="" value="" id="empList" name="empList">
					</form>

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
			<!-- <div
				class="mailbox-content-footer d-flex align-items-center justify-content-end">
				<button type="submit" class="btn btn-white ps-40px pe-40px me-5px">Discard</button>
				<button type="submit" class="btn btn-primary ps-40px pe-40px">Send</button>
			</div> -->
		</div>

	</div>
	
	
	
	
	<script type="text/javascript">

	
	
	function getList(){
		
		
		
		var depCode = $("#dep option:selected").val();
		
		var data = {
				"depCode":depCode
		}
			
		$.ajax({
			url : "<%=request.getContextPath() %>/mypage/getList",
			type : "post",
			data : JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			success:function(data){
				
				var html="";
				
				for(var i = 0 ; i < data.depEmpList.length;i++){
					html += '<tr>';
					html += '<td>'+data.depEmpList[i].rnkName+'</td>';
					html += '<td>'+data.depEmpList[i].empName+'</td>';
					html += '<td><a href="javascript:addEmp(&#39;'+data.depEmpList[i].empId+'&#39;&#44;&#39;'+data.depEmpList[i].empName+'&#39;);" class="btn btn-info btn-icon btn-circle btn-sm"><i class="fab fa-twitter"></i></a></td>';
					html += '</tr>';
					
				}
				
				$("#depList").empty();
				$("#depList").append(html);
			
			},
			
			error:function(error){
				alert(error.status);
			}
			
		});
		
	}
	
	
		function addEmp(empId,empName){
			
			if($("#"+empId).val() == undefined){
			
			var html="";
			html += '<span id='+empId+' class="empId" value='+empId+'>';
			html += ''+empName+'';
			html += '<a href="javascript:remove(&#39;'+empId+'&#39;);" class="btn btn-danger btn-icon btn-circle btn-sm"><i class="fa fa-times"></i></a>'
			html += '</span>';
			$("#addList").append(html);
				
			return;
			}
			
			alert("이미 추가하였습니다");	
		
		}
		
		
		
		function remove(empId){
			
			
			$("#"+empId).remove();
			
		}
		
		
		function send(){
			var html='';
			var len = $(".empId").length;
			for(var i = 0; i < len; i++){
				$(".empId")[i].innerHTML='';
			}
		
			if(len == 1){
				 var id= $(".empId");
				html += ''+id.attr('id')+'';
				$('#empList').val(html);   
			}else {
			
			for(var i = 0; i < len; i++){
				
				 var id= $(".empId").eq(i);
				 if(i == 0 ){
				 html += ''+id.attr('id')+'';
				 continue;
				 }
				 
				 html += ',';
				 html += ''+id.attr('id')+'';
				 
				  $('#empList').val(html);   
			}
			
			}
			document.sendForm.submit();
			
			
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
<div class="note-modal-backdrop" style="display: none;"></div>

<script type="text/javascript">

window.setTimeout(function(){
	
	$(".note-insert").hide();
	
},100);
	


</script>



</body>









































































