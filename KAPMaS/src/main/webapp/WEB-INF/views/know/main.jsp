<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkList.jsp" %>
<% int b = 0 ; %>

<head>
<meta charset="UTF-8">
<title></title>
<style>

.dataTables_wrapper.dt-bootstrap .dataTable, .dataTables_wrapper.dt-bootstrap4 .dataTable{

	width: 99%;

}
div.col-2_4{
	width: 20%;
}
</style>
</head>

<body style="background-color: #f0f4f7;">
	<div id="content" class="app-content">
		<div class="row" style="padding: 20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">노하우 게시판</h1>
			</div>
		<div class="col-md-2" >
		<button class="btn btn-primary me-1 mb-1" tabindex="0" style="float:right;"
			aria-controls="data-table-combine" type="button" id="registBtn"
			onclick="OpenWindow('knowRegistForm.do','노하우 요청',680,700);">
			<span>노하우 요청</span>
		</button>
		</div>
		</div>
		<div class="row" style="padding: 0 15px;">

			<div class="col-2_4">
				<div class="widget widget-stats bg-blue on-click-class-1">
					<div class="stats-icon"></div>
					<div class="stats-info">
						<h4>전체</h4>
					</div>
					<div class="stats-link">
						<a id="trashListBtn-1" href="javascript:getTrashList();"
							onclick="clickEvent('전체', 1);">View List<i
							class="fa fa-arrow-alt-circle-right"></i></a>
					</div>
				</div>
			</div>


			<div class="col-2_4">
				<div class="widget widget-stats bg-info on-click-class-2">
					<div class="stats-icon"></div>
					<div class="stats-info">
						<h4>연구</h4>
					</div>
					<div class="stats-link">
						<a id="trashListBtn-2" href="javascript:getTrashList();"
							onclick="clickEvent('연구', 2);">View List<i
							class="fa fa-arrow-alt-circle-right"></i></a>
					</div>
				</div>
			</div>


			<div class="col-2_4">
				<div class="widget widget-stats bg-orange on-click-class-3">
					<div class="stats-icon"></div>
					<div class="stats-info">
						<h4>기술</h4>
					</div>
					<div class="stats-link">
						<a id="trashListBtn-3" href="javascript:getTrashList();"
							onclick="clickEvent('기술', 3);">View List<i
							class="fa fa-arrow-alt-circle-right"></i></a>
					</div>
				</div>
			</div>


			<div class="col-2_4">
				<div class="widget widget-stats bg-red on-click-class-4">
					<div class="stats-icon"></div>
					<div class="stats-info">
						<h4>법률</h4>
					</div>
					<div class="stats-link">
						<a id="trashListBtn-4" href="javascript:getTrashList();"
							onclick="clickEvent('법률', 4);">View List<i
							class="fa fa-arrow-alt-circle-right"></i></a>
					</div>
				</div>
			</div>


			<div class="col-2_4">
				<div class="widget widget-stats bg-blue on-click-class-5">
					<div class="stats-icon"></div>
					<div class="stats-info">
						<h4>기타</h4>
					</div>
					<div class="stats-link">
						<a id="trashListBtn-5" href="javascript:getTrashList();"
							onclick="clickEvent('기타', 5);">View List<i
							class="fa fa-arrow-alt-circle-right"></i></a>
					</div>
				</div>
			</div>



		</div>


		<div class="row">
			<div class="col-xl-12 ui-sortable">
				<div class="panel panel-inverse">


					<div class="panel-body" style="background-color: #f0f4f7;">
						<div id="data-table-combine_wrapper"
							class="dataTables_wrapper dt-bootstrap4 no-footer">
							<div class="dataTables_wrapper dt-bootstrap">
								<div class="row"></div>
								<div class="panel panel-inverse"
									data-sortable-id="ui-media-object-1" data-init="true">
									<div class="panel-heading">
										<div class="panel-title" style="height: 16px;"></div>
									</div>
									<div class="panel-body">
										<div class="col-xl-12 ui-sortable">
											<div class="panel panel-inverse">
												<div class="panel-body">
													<div id="data-table-combine_wrapper"
														class="dataTables_wrapper dt-bootstrap4 no-footer">
														<div class="dataTables_wrapper dt-bootstrap">
															<div class="row">
																<table id="data-table-combine" style="text-align:center;"
																	class="table table-hover mb-0 text-inverse">
																	<thead>
																		<tr role="row" >
																			<th class="sorting sorting_desc"
																				tabindex="0" aria-controls="data-table-combine"
																				rowspan="1" colspan="1" 
																				data-column-index="0"
																				aria-label=": activate to sort column descending"
																				aria-sort="ascending" id="hiding01"></th>
																			<th width="12%" class="sorting sorting_desc"
																				tabindex="0" aria-controls="data-table-combine"
																				rowspan="1" colspan="1" 
																				data-column-index="0"
																				aria-label=": activate to sort column descending"
																				aria-sort="ascending">노하우코드</th>
																			<th width="5%" class="text-nowrap sorting" tabindex="0"
																				aria-controls="data-table-combine" rowspan="1"
																				colspan="1" 
																				data-column-index="7"
																				aria-label="CSS grade: activate to sort column ascending">카테고리</th>
																			<th width="30%" class="text-nowrap sorting sorting_desc"
																				tabindex="0" aria-controls="data-table-combine"
																				rowspan="1" colspan="1" 
																				data-column-index="2"
																				aria-label="Rendering engine: activate to sort column ascending"
																				aria-sort="descending">제목</th>
																			<th width="5%" class="text-nowrap sorting" tabindex="0"
																				aria-controls="data-table-combine" rowspan="1"
																				colspan="1" 
																				data-column-index="3"
																				aria-label="Browser: activate to sort column ascending">요청자</th>
																			<th width="10%" class="text-nowrap sorting" tabindex="0"
																				aria-controls="data-table-combine" rowspan="1"
																				colspan="1" 
																				data-column-index="4"
																				aria-label="Platform(s): activate to sort column ascending">등록일</th>
																			<th width="5%"class="text-nowrap sorting" tabindex="0"
																				aria-controls="data-table-combine" rowspan="1"
																				colspan="1" 
																				data-column-index="5"
																				aria-label="Engine version: activate to sort column ascending">조회수</th>
																			<th width="5%"class="text-nowrap sorting" tabindex="0"
																				aria-controls="data-table-combine" rowspan="1"
																				colspan="1" 
																				data-column-index="6"
																				aria-label="CSS grade: activate to sort column ascending">앤서</th>
																		</tr>
																	</thead>
																	<tbody id="trashList">
																		<c:forEach items="${knowList}" var="know">
																			<tr
																				onclick="OpenWindow('knowDetail.do?khCode=${know.khCode}','상세보기',850,780);">
																				<td width="1%"
																					class="fw-bold text-inverse dtr-control hide"
																					tabindex="0" id="hiding02">
																					<div id="hiding03"
																						style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																						<input type="text" tabindex="0">
																					</div><%=b++%></td>
																				<td 
																					class="fw-bold text-inverse dtr-control"
																					tabindex="0">
																					<div
																						style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																						<input type="text" tabindex="0">
																					</div>${know.khCode}</td>
																				<td>${know.khCategory}</td>
																				<!-- <td width="1%"></td> -->
																				<td class="sorting_1" style="text-align:left;">${know.khTitle}</td>
																				<td>${know.empName}</td>
																				<td>${know.khRegdate}</td>
																				<td>${know.khViewcnt}</td>
																				<td>${know.answercnt}</td>
																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
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
					</div>
				</div>
			</div>
		</div>



	</div>
	<!-- script -->
	<input type="hidden" id="deleteList" name="deleteList" value=""/>
	<input type="hidden" id="restoreList" name="restoreList" value=""/>
	<input type="hidden" id="trashTable" name="trashTable" value="" > 
	<script>
	
	var jsindex = 0;
	var jstable = '';
	
	function clickEvent(table , index){
		$('input[name="trashTable"]').val(table);
		for(i = 0; i < 6; i++){
			if(i != index){
				if(i == 0){ $('div.on-click-class-'+i).addClass('bg-blue'); }
				if(i == 1){ $('div.on-click-class-'+i).addClass('bg-info'); }
				if(i == 2){ $('div.on-click-class-'+i).addClass('bg-orange'); }
				if(i == 3){ $('div.on-click-class-'+i).addClass('bg-red'); }
				if(i == 4){ $('div.on-click-class-'+i).addClass('bg-blue'); }
				$('div.on-click-class-'+i).removeClass('bg-gray');
			}
		}
		
		if(index == 0){ $('div.on-click-class-'+index).removeClass('bg-blue'); }
		if(index == 1){ $('div.on-click-class-'+index).removeClass('bg-info'); }
		if(index == 2){ $('div.on-click-class-'+index).removeClass('bg-orange'); }
		if(index == 3){ $('div.on-click-class-'+index).removeClass('bg-red'); }
		if(index == 4){ $('div.on-click-class-'+index).removeClass('bg-blue'); }
		$('div.on-click-class-'+index).addClass('bg-gray');
		
		$('div.form-check').removeClass('hide');
		jsindex = index;
		jstable = table;
	}
	
	
	
	function getTrashList(){ 
		var trTable = $('input[name="trashTable"]').val();
		var data = {
				"trTable":trTable 
		}
		
		$.ajax({
			url : "<%=request.getContextPath() %>/kms/getKnowList",
			type : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			success : function(data){
				var html = "";
				 for(var i = 0; i < data.knowList.length; i++){
					html += "<tr onclick='OpenWindow(&#39;knowDetail.do?khCode="+data.knowList[i].khCode+"&#39;,&#39;상세보기&#39;,850,780)'>";											
					html += '<td width="1%" class="fw-bold text-inverse dtr-control hide" tabindex="0">';
					html += '<div style="position: absolute; height: 1px; width: 0px; overflow: hidden;">';
					html += '<input type="text" tabindex="0">';
					html += '</div>'+(i+1)+'</td>';
					html += '<td class="fw-bold text-inverse dtr-control"tabindex="0">';
					html += '<div style="position: absolute; height: 1px; width: 0px; overflow: hidden;">';
					html += '<input type="text" tabindex="0">';
					html += '</div>'+data.knowList[i].khCode+'</td>';
					html += '<td>'+data.knowList[i].khCategory+'</td>';
					html += '<td class="sorting_1">'+data.knowList[i].khTitle+'</td>';
					html += '<td>'+data.knowList[i].empName+'</td>';
					html += '<td>'+data.knowList[i].khRegdate+'</td>';
					html += '<td>'+data.knowList[i].khViewcnt+'</td>';
					html += '<td>'+data.knowList[i].answercnt+'</td>';
					html += '</tr>';
				}
				
				$("#trashList").empty();
				$("#trashList").append(html);
			},
			error : function(error){
				swal({
					title : '에러',
					text : '에러발생으로 인해 실행에 실패하였습니다.\n관리자에게 문의하세요.',
					icon : 'error',
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-danger me-1',
							closeModal : true
						}
					}
				});
			}
		});
	} 
	
	
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-5 justify-content-left"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-7"fr>>t<"row"<"col-5"><"col-7"p>>>',
			buttons : [ ],
			responsive : true,
			colReorder : true,
			keys : true,
			rowReorder : true,
			select : true
		};

		if ($(window).width() <= 767) {
			options.rowReorder = false;
			options.colReorder = false;
		}

		
		$('#data-table-combine').DataTable(options);

		$(document).ready(
				function() {
					$('#hiding01').attr('style', "display:none;"); //숨기기
					$('.fw-bold text-inverse dtr-control hide').attr('style',
							"display:none;"); //숨기기

				});
	</script>
</body>


