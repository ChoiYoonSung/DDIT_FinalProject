<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">
<style type="text/css">

#dom {
	box-shadow: 2px 2px 10px silver;
	border-radius: 10px;
	padding: 17px;
}
.table-responsive{
	overflow-x: visible;
}
.panel-body{
	min-height: 350px;
}
.app-content{
	padding: 10px;
}
a:hover{
	color: #000000;
}
a{
	color: #000000;
}
</style>
</head>
<body>
<div class="app-content">
<div class="row" style="margin-top: 9px; margin-bottom: 18px;">
<div class="col-1"></div>
<h1 class="page-header text-center col-10" style="margin: 0px;">내 활동</h1>
	<div class="col-1">
		<button type="button" class="btn btn-gray border-0 w-50px" onclick="CloseWindow();">닫기</button>
	</div>
</div>
<div class="row">
	<!-- BEGIN col-6 -->
	<div class="col-6 ui-sortable">
		<!-- BEGIN panel -->
		<div class="panel panel-inverse" style="">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">내 업무</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table id="data-table-combine1" class="table table-striped table-bordered align-middle">
						<thead>
							<tr role="row">
								<th width="3%" 
									class="sorting_disabled" rowspan="1" colspan="1"
									data-column-index="1" aria-label="">
									업무 제목
								</th>
								<th width="3%" class="text-nowrap sorting sorting_desc" tabindex="0"
									aria-controls="data-table-combine" 
									aria-label=": activate to sort column ascending"
									aria-sort="descending">
									프로젝트명
								</th>
								<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
									aria-controls="data-table-combine" rowspan="1"
									colspan="1"  data-column-index="3"
									aria-label=": activate to sort column ascending"
									aria-sort="descending">
									마감일
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="job" items="${jobList }">
							<tr>
								<td>${job.jobName }</td>
								<td>${job.pName }</td>
								<td>${job.jobEnddate }</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
		<!-- END panel -->

		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">노하우 활동글</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
				<table id="data-table-combine3" class="table table-striped table-bordered align-middle">
					<thead>
						<tr role="row">
							<th width="5%" data-orderable="false"
								class="sorting_disabled" rowspan="1" colspan="1"
								data-column-index="1" aria-label="">
								카테고리
							</th>
							<th width="5%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine" rowspan="1"
								colspan="1" data-column-index="2"
								aria-label=": activate to sort column ascending"
								aria-sort="descending">
								노하우 제목
							</th>
							<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine" rowspan="1"
								colspan="1" data-column-index="3"
								aria-label=": activate to sort column ascending"
								aria-sort="descending">
								조회수
							</th>
							<th width="3%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine" rowspan="1"
								colspan="1"  data-column-index="3"
								aria-label=": activate to sort column ascending"
								aria-sort="descending">
								등록일
							</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="know" items="${knowList }">
						<tr>
							<td>${know.khCategory }</td>
							<td>
							<c:choose>
						        <c:when test="${fn:length(know.khTitle) gt 16}">
						        <c:out value="${fn:substring(know.khTitle, 0, 15)}...">
						        </c:out></c:when>
						        <c:otherwise>
						        <c:out value="${know.khTitle}">
						        </c:out></c:otherwise>
							</c:choose>
							</td>
							<td>${know.khViewcnt }</td>
							<td>${know.khRegdate }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
		<!-- END panel -->

	</div>
	<!-- END col-6 -->



	<!-- BEGIN col-6 -->
	<div class="col-6 ui-sortable">

		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle" style="padding-top : 5px; padding-bottom: 5px;">
				<h4 class="panel-title">스크랩</h4>
					<div class="btn-toolbar align-items-center">
					<div class="w-100 d-sm-none d-block mb-2 hide" data-email-action="divider"></div>
					<!-- BEGIN btn-group -->
					<div class="btn-group" id="deleteRestorateBtn">
						<button class="btn btn-sm btn-white" onclick="deleteScrap()"><i class="fa fa-trash me-1"></i> <span class="hidden-xs">삭제</span></button>
					</div>
					<!-- END btn-group -->
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
				<table id="data-table-combine2" class="table table-striped table-bordered align-middle">
					<thead>
						<tr role="row">
							<th width="1%" class="sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine"data-column-index="0"
								aria-sort="descending">
								#
							</th>
							<th width="5%" data-orderable="false"
								aria-controls="data-table-combine"
								class="sorting sorting_desc" rowspan="1" colspan="1"
								data-column-index="1" aria-label="">
								스크랩 제목
							</th>
							<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine"
								aria-sort="descending">
								스크랩 URL
							</th>
							<th width="1%" class="text-nowrap sorting sorting_desc tabindex="0""
								aria-controls="data-table-combine"
								aria-sort="descending">
								등록일
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="scrap" items="${scrapList }" varStatus="status">
						<tr>
							<td>
								<input type='checkbox' id='check-${status.index }' class='form-check-input check-checkbox' data-checked='check-checkbox' role='scrapCheck' value='${scrap.scUrl }'>
							</td>
							<td onclick="OpenWindow('${scrap.scUrl }','스크랩 화면','1100','1000');">
							<c:choose>
						        <c:when test="${fn:length(scrap.scTitle) gt 10}">
						        <c:out value="${fn:substring(scrap.scTitle, 0, 9)}...">
						        </c:out></c:when>
						        <c:otherwise>
						        <c:out value="${scrap.scTitle}">
						        </c:out></c:otherwise>
							</c:choose>
							</td>
							<td>
							<c:choose>
							        <c:when test="${fn:length(scrap.scUrl) gt 26}">
							        <c:out value="${fn:substring(scrap.scUrl, 0, 25)}...">
							        </c:out></c:when>
							        <c:otherwise>
							        <c:out value="${scrap.scUrl}">
							        </c:out></c:otherwise>
							</c:choose>
							</td>
							<td>${scrap.scRegdate }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
		<!-- END panel -->

		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">ANSWER 등록글</h4>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
				<table id="data-table-combine4" class="table table-striped table-bordered align-middle">
					<thead>
						<tr role="row">
							<th width="5%" data-orderable="false"
								class="sorting_disabled" rowspan="1" colspan="1"
								data-column-index="1" aria-label="">
								노하우 제목
							</th>
							<th width="2%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine" rowspan="1"
								colspan="1" data-column-index="2"
								aria-label=": activate to sort column ascending"
								aria-sort="descending">
								등록일
							</th>
							<th width="1%" class="text-nowrap sorting sorting_desc" tabindex="0"
								aria-controls="data-table-combine" rowspan="1"
								colspan="1" data-column-index="3"
								aria-label=": activate to sort column ascending"
								aria-sort="descending">
								댓글수
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="answer" items="${answerList }" varStatus="status">
						<tr>
							<td>${khTitleList[status.index] }</td>
							<td>${answer.aRegdate }</td>
							<td>${answer.replyCnt }</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
		<!-- END panel -->
	</div>
	<!-- END col-6 -->
</div>
<!-- END row -->
</div>
<input type="hidden" name="" id="deleteScrapList" value="">
<input type="hidden" name="" id="empId" value="${loginUser.empId }">
</body> 
<script type="text/javascript">
window.onload = function() {
	var el = document.getElementById('dom');
	el.setAttribute('hidden', '');
}

var options = {
	dom : '<"dataTables_wrapper dt-bootstrap"t<"row"<"col-12"p>>>',
	buttons : [],
	responsive : true,
	colReorder : true,
	keys : true,
	rowReorder : true,
	select : true,
	order : [ [ 0, 'asc' ] ],
	ordering : true,
	serverSide : false,
	lengthMenu : [5],
	lengthChange : false
};

if ($(window).width() <= 767) {
	options.rowReorder = false;
	options.colReorder = false;
}

$('#data-table-combine1').DataTable(options);
$('#data-table-combine2').DataTable(options);
$('#data-table-combine3').DataTable(options);
$('#data-table-combine4').DataTable(options);

function deleteScrap(){

	var html='';
	$('#deleteScrapList').val(html);   
	
	var num = $("input[role='scrapCheck']:checked").length;
	
	if(num == 0 ){
		swal({
			title: '스크랩',
			text: '삭제할 스크랩을 선택하십시오.',
			icon: 'warning', // info success warning danger
			buttons: {
		        	confirm: {
				text: '확인',
		                value: true,
		                visible: true,
		                className: 'btn btn-warning', // primary success warning danger
		                closeModal: true
		              }
		        }
		});
		return;
	}

	swal({
        title: '삭제 확인',
        text: '선택한 게시글을 삭제하시겠습니까?',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == false){
	        	 return;
               } else {
				if(num == 1){
					var id= $("input[role='scrapCheck']:checked");
					html += ''+id.attr('value')+'';
					$('#deleteScrapList').val(html);   
						}else {
				
				for(var i = 0; i < num; i++){
					
					 var id= $("input[role='scrapCheck']:checked").eq(i);
					 if(i == 0 ){
					 html += ''+id.attr('value')+'';
					 continue;
					 }
					 html += ',';
					 html += ''+id.attr('value')+'';
					 
					  $('#deleteScrapList').val(html);   
					}
				}
			
				var scUrl = $('#deleteScrapList').val();
				var empId = $('#empId').val();
				
				var data = {
						"scUrl":scUrl,
						"empId":empId	
				}
				$.ajax({
					url:"<%=request.getContextPath()%>/mypage/deleteScrap",
					type:"post",
					data:JSON.stringify(data),	
					contentType:'application/json;charset=utf-8',
					success:function(data){
						swal({
							title: '성공',
							text: '해당 스크랩을 삭제하였습니다.',
							icon: 'success', // info success warning danger
							buttons: {
						        	confirm: {
								text: '확인',
						                value: true,
						                visible: true,
						                className: 'btn btn-success', // primary success warning danger
						                closeModal: true
						              }
						        }
						}).then(function(e){
							window.location.reload();
						});
					},
					error:function(error){
						swal({
						    title: '에러',
						    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
						    icon: 'error', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-danger',
						            closeModal: true
						          }
						    }
						  });
					}
				});	
              }
     });
}
</script>
</html>