<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	
<link href="<%=request.getContextPath()%>/resources/css/css.css" rel="stylesheet">

		<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<div class="panel panel-inverse"
				data-init="true">
				<div class="panel-heading">
					<h4 class="panel-title">업무 인수인계</h4>
					<a onclick="changeMember();" class="btn btn-warning">사원 제명</a>
						&nbsp;&nbsp;&nbsp;
					<a href="javascript:window.close();" class="btn btn-gray">사원 제명 취소</a>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body" style="height: 670px;">
								<div id="data-table-combine_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<div class="dataTables_wrapper dt-bootstrap">
										<div class="row">
											<table id="data-table-combine" class="table table-striped table-bordered align-middle">
												<thead>
													<tr role="row">
														<th width="3%" class="sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="0"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															업무 코드
														</th>
														<th width="3%" data-orderable="false"
															class="sorting_disabled" rowspan="1" colspan="1"
															data-column-index="1" aria-label="">
															업무 이름
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															담당자
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															시작일
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="2"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															완료일
														</th>
														<th width="5%" class="text-nowrap sorting sorting_asc" tabindex="0"
															aria-controls="data-table-combine" rowspan="1"
															colspan="1" data-column-index="3"
															aria-label=": activate to sort column ascending"
															aria-sort="descending">
															진척도
														</th>
													</tr>
												</thead>
												<tbody>
												<% int b = 0 ; %>
												<c:forEach var="job" items="${jobList }">
													<tr>
														<td>${job.jobCode}</td>
														<td>${job.jobName}</td>
														<td>
														
														<select style="width: 200px; float: left;"
																name="changeName" id="${job.jobCode}" class="form-select"
																<%-- onchange="changeAu('${job.jobCode}','AU<%=b %>');" --%>
																onclick="event.cancelBubble = true;">
																<c:set var="id" value="${empId }" />
																	<option value="">-인수인계 사원 선택-</option>
																	<c:forEach items="${pjmList}" var="pjm">
																		<c:if test="${pjm.empId != id }">
																		<option value="${pjm.empId }">${pjm.empName }</option>
																		</c:if>
																	</c:forEach>
															</select>
														
														</td>
														<td>${job.jobStartdate}</td>
														<td>${job.jobEnddate}</td>
														<td>
														<div class="progress mb-2">
																<div class="progress-bar fs-10px fw-bold" style="width: ${job.jobPrograss}%">
																</div>	
															</div>
														
														</td>
													</tr>
												</c:forEach>
												</tbody>
											</table>
													<input hidden="" type="text" id="emp" value="${empId }">
													<c:if test="${empty jobList }">
														<input hidden="" type="text" value="없음" id="pass">
													</c:if>
													<c:if test="${not empty jobList }">
														<input hidden="" type="text" value="있음" id="pass">
													</c:if>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>

var options = {
		dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-7 d-block justify-content-center"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-5 d-block justify-content-center"fr>>t<"row"<"col-5"i><"col-7"p>>>',
		buttons : [],
		responsive : true,
		colReorder : true,
		keys : true,
		rowReorder : true,
		select : true,
		order : [ [ 4, 'asc' ] ],
		ordering : true,
		serverSide : false,
		lengthMenu : [10, 25, 50]
	};

	$('#data-table-combine').DataTable(options);

	
	
	
	
	function changeMember(){
		
		if($("#pass").val() == "없음"){
			deleteMember();
		}
		
		
		var na = $("select[name=changeName]");
		var len = $("select[name=changeName]").length;

		
		for(var i = 0; i < len; i++){
			
			var id = na.eq(i).val();
			
			if(id == ""){
				/* alert("인수인계할 사원을 꼭 선택하여야 제명할수있습니다\n 인수인계할 사원을 다 입력해주세요");
				return; */
				swal({
					title: '실패',
					text: '인수인계할 사원을 꼭 선택하여야 제명할수있습니다\n 인수인계할 사원을 다 입력해주세요',
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
				return;
				
			}
			
		}
		
		
		
		
		for(var i = 0; i < len; i++){
			
			
			if(i == len-1){
				var code = na.eq(i).attr( 'id' );
				var id = na.eq(i).val();
			

				var data = {
						"id":id
					   ,"code":code
				} 
				
				$.ajax({
					url : "<%=request.getContextPath() %>/project/deleteMem",
					type : "post",
					data : JSON.stringify(data),
					contentType:"application/json;charset=utf-8",
					success:function(data){
						deleteMember();
					},
					
					error:function(error){
						alert(error.status);
					}
					
				})
				
				
				
			}else{
				var code = na.eq(i).attr( 'id' );
				var id = na.eq(i).val();
			

				var data = {
						"id":id
					   ,"code":code
				} 
				
				$.ajax({
					url : "<%=request.getContextPath() %>/project/deleteMem",
					type : "post",
					data : JSON.stringify(data),
					contentType:"application/json;charset=utf-8",
					success:function(data){

						
						
					},
					
					error:function(error){
						alert(error.status);
					}
					
				})
			}
			
			
		} 
		
	}
	
	
	function deleteMember(){
		
		var empId = $("#emp").val();
		
		var data={
				"empId":empId
		}
		
		$.ajax({
			url : "<%=request.getContextPath() %>/project/proDeleteMem",
			type : "post",
			data : JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			success:function(data){
				/* alert("해당 사원을 제명하였습니다");
				window.opener.parent.location.reload();
				window.close();	 */
				
				swal({
					title: '성공',
					text: '해당 사원을 제명하였습니다',
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
					window.opener.parent.location.reload();
					window.close();	
				});
				
				
			},
			error:function(request,status,error){
				
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

			}
			
		});

		
	}
	
	
	
	
	
	
	
	
	
</script>

























