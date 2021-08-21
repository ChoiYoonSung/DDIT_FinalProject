<%@page import="com.spring.dto.TotalKnowledgeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkList.jsp" %>

<!DOCTYPE html>
<html>
<c:set var="list" value="${dataMap.list }" />
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
				<h1 style="color: black;">프로젝트 보고서 게시판</h1>
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
																<table id="data-table-combine"
																	style="background-color: white;"
																	class="table table-hover mb-0 text-inverse"
																	style="width:100%;">
																	<thead>
																		<tr role="row" style="text-align: center;">
																			<th class="sorting sorting_desc" id="hiding01"></th>
																			<th width="15%" class="sorting sorting_desc">자료코드</th>
																			<th width="40%" class="text-nowrap sorting">프로젝트 명</th>
																			<th width="9%" class="text-nowrap sorting">담당자</th>
																			<th width="19%" class="text-nowrap sorting">등록일</th>
																			<th width="6%" class="text-nowrap sorting">조회수</th>
																			<th width="6%" class="text-nowrap sorting">추천수</th>
																	</thead>
																	<tbody>

																	<c:forEach items="${list }" var="prb" >
																		<tr style="text-align: center;"	onclick="OpenWindow('prbDetail.do?prCode=${prb.prCode }','상세보기',700,700);">
																			<td class="fw-bold text-inverse dtr-control hide"
																				tabindex="0" id="hiding02">
																				<div id="hiding03"
																					style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																					<input type="text" tabindex="0">
																				</div></td>
																			<td class="fw-bold text-inverse dtr-control"
																				tabindex="0">
																				<div
																					style="position: absolute; height: 1px; width: 0px; overflow: hidden;">
																					<input type="text" tabindex="0">
																				</div>${prb.prCode }</td>
																			<td style="text-align: left;">${prb.pName }</td>
																			<td>${prb.empName }</td>
																			<td>${prb.prRegdate }</td>
																			<td>${prb.prViewcnt }</td>
																			<td>${prb.prLikecnt}</td>
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
	<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(
				function() {
					$('#hiding01').attr('style', "display:none;"); //숨기기
					$('.fw-bold text-inverse dtr-control hide').attr('style',
							"display:none;"); //숨기기

				});
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-md-8 d-block d-sm-flex d-xl-block justify-content-left"<"d-block d-lg-inline-flex me-0 me-md-3"l><"d-block d-lg-inline-flex"B>><"col-md-4 d-flex d-xl-block"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
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

	</script>
	
</body>
</html>