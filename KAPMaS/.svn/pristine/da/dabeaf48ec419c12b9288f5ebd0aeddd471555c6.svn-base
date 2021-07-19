<%@page import="com.spring.dto.TotalKnowledgeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkList.jsp" %>
<!DOCTYPE html>
<html>
<c:set var="tkList" value="${dataMap.tkList }" />
<head>
<meta charset="UTF-8">
<title></title>
<style>
	.col-md-4 d-flex d-xl-block{
		padding:0px;
	}
</style>
</head>
<body style="background-color: #f0f4f7;">
	<div id="content" class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">기타 자료 게시판</h1>
			</div>
			<div class="col-md-2" ">
				<button class="btn btn-yellow me-1 mb-1"  style="float:right;" type="button" id="registBtn"	onclick="OpenWindow('registForm.do','자료등록',800,700);"><span>자료등록</span></button>
			</div>
		</div>


		<div class="row">
			<div class="col-xl-12 ui-sortable">
				<div class="panel panel-inverse">


					<div class="panel-body" style="background-color: #f0f4f7;">
						<div id="data-table-combine_wrapper"
							class="dataTables_wrapper dt-bootstrap4 no-footer">
							<div class="dataTables_wrapper dt-bootstrap">
								<div class="row">
								</div>
									<table id="data-table-combine"  style="background-color:white;"
										class="table table-striped table-bordered align-middle">
										<thead>
											<tr role="row">
												<th width="1%" class="sorting sorting_desc" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 6px;" data-column-index="0"
													aria-label=": activate to sort column descending"
													aria-sort="ascending" id="hiding01"></th>
												<th width="1%" class="sorting sorting_desc" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 6px;" data-column-index="0"
													aria-label=": activate to sort column descending"
													aria-sort="ascending"></th>
												<th width="5%" data-orderable="false"
													class="sorting_disabled" rowspan="1" colspan="1"
													style="width: 22px;" data-column-index="1" aria-label=""></th>
												<th class="text-nowrap sorting sorting_desc" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 104px;" data-column-index="2"
													aria-label="Rendering engine: activate to sort column ascending"
													aria-sort="descending">제목</th>
												<th class="text-nowrap sorting" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 118px;" data-column-index="3"
													aria-label="Browser: activate to sort column ascending">작성자</th>
												<th class="text-nowrap sorting" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 109px;" data-column-index="4"
													aria-label="Platform(s): activate to sort column ascending">등록일</th>
												<th class="text-nowrap sorting" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 87px;" data-column-index="5"
													aria-label="Engine version: activate to sort column ascending">조회수</th>
												<th class="text-nowrap sorting" tabindex="0"
													aria-controls="data-table-combine" rowspan="1" colspan="1"
													style="width: 58px;" data-column-index="6"
													aria-label="CSS grade: activate to sort column ascending">추천수</th>
											</tr>
										</thead>
										<tbody>

											<%
												List<TotalKnowledgeVO> list = (List<TotalKnowledgeVO>) request.getAttribute("list");
												String tkCode = "";
												for (int i = 0; i < list.size(); i++) {
													tkCode = list.get(i).getTkCode();
											%>
											<tr
												onclick="OpenWindow('detail.do?tkCode=<%=list.get(i).getTkCode()%>','상세보기',1100,1200);">
												<td width="1%" class="fw-bold text-inverse dtr-control hide"
													tabindex="0" id="hiding02">
													<div id="hiding03"
														style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
														<input type="text" tabindex="0">
													</div><%=i%></td>
												<td width="1%" class="fw-bold text-inverse dtr-control"
													tabindex="0">
													<div
														style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
														<input type="text" tabindex="0">
													</div><%=list.get(i).getTkCode().substring(2)%></td>
												<td width="1%"></td>
												<td class="sorting_1"><%=list.get(i).getTkTitle()%></td>
												<td><%=list.get(i).getEmpId()%></td>
												<td><%=list.get(i).getTkRegdate()%></td>
												<td><%=list.get(i).getTkViewCnt()%></td>
												<td><%=list.get(i).getTkLikeCnt()%></td>
											</tr>
											<%
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- script --> 
	<script>
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-md-8 d-block d-sm-flex d-xl-block justify-content-left"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-md-4 d-flex d-xl-block"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [ {
				extend : 'copy',
				className : 'btn-sm'
			}, {
				extend : 'csv',
				className : 'btn-sm'
			}, {  
				extend : 'excel',
				className : 'btn-sm'
			}, {
				extend : 'pdf',
				className : 'btn-sm'
			}, {
				extend : 'print',
				className : 'btn-sm'
			} ],
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
</html>