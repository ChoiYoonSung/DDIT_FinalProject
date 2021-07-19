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

					<form action="<%=request.getContextPath() %>/mypage/projecterRegist.do" method="post" enctype="multipart/form-data" name="sendForm">

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
							<input type="text" hidden=""  class="form-control" id="paTitle" name="title" placeholder=""  value="${pro.pName }의 프로젝트 초대">
						</div>
					
						<h2>&nbsp;&nbsp;send를 누르면 초대 쪽지가 갑니다.</h2>
						<textarea class="form-control"  hidden="" rows="15" name="content">
						
						<div style="margin: 0 auto;width:30%;">
							<button type="button" class="btn btn-gray me-1 mb-1" 
								style="float: left;"  onclick="Close();">&nbsp;&nbsp;&nbsp;거 &nbsp;&nbsp;절&nbsp;&nbsp;&nbsp;</button>
							<button type="button"  class="btn btn-yellow me-1 mb-1"
								style="float: left;"  onclick="projecterIn('${pCode}');">&nbsp;&nbsp;&nbsp;승&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;</button>
						</div>
						
						
						</textarea>
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
			if(len==0){
				alert("사원을 선택해야 합니다.");
				return;
			}
			
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
	
	
	
</body>
