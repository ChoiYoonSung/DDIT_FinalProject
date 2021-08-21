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
			<div class="col-md-2" >
				<button class="btn btn-primary"  style="float:right;" type="button" id="registBtn"	onclick="OpenWindow('registForm.do','자료등록',1000,800);"><span>자료등록</span></button>
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
									<div class="panel-heading ui-sortable-handle"></div>
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
																	class="table table-striped table-bordered align-middle"
																	style="width:100%;">
																	<thead>
																		<tr role="row" style="text-align: center;">
																			<th class="sorting sorting_desc" id="hiding01"></th>
																			<th width="7%" class="sorting sorting_desc">자료코드</th>
																			<th width="56%" class="text-nowrap sorting">제목</th>
																			<th width="10%" class="text-nowrap sorting">작성자</th>
																			<th width="10%" class="text-nowrap sorting">등록일</th>
																			<th width="6%" class="text-nowrap sorting">조회수</th>
																			<th width="6%" class="text-nowrap sorting">추천수</th>
																			<th width="5%" data-orderable="false"
																				class="sorting_disabled">첨부</th>
																		</tr>
																	</thead>
																	<tbody>

																	<c:forEach items="${tkList }" var="tk" >
																		<tr style="text-align: center;"	onclick="OpenWindow('detail.do?tkCode=${tk.tkCode }','상세보기',1100,1200);">
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
																				</div>${tk.tkCode }</td>
																			<td style="text-align: left;">${tk.tkTitle }</td>
																			<td>${tk.empId }</td>
																			<td>${tk.tkRegdate }</td>
																			<td>${tk.tkViewCnt }</td>
																			<td>${tk.tkLikeCnt}</td>
																			<td>
																				<c:if test="${!empty tk.attachList }">
																					<i class="far fa-lg fa-fw me-10px fa-file"></i>
																				</c:if>																			
																			</td>
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
	<script>
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

		$(document).ready(
				function() {
					$('#hiding01').attr('style', "display:none;"); //숨기기
					$('.fw-bold text-inverse dtr-control hide').attr('style',
							"display:none;"); //숨기기

				});
	</script>
	
</body>
</html>