<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/supportCenter/js/noticeList.jsp" %>
<% int b = 1 ; %>
<c:set var="tkList" value="${noticeList }" />
<!DOCTYPE html>
<head>
</head>
<body style="background-color: #f0f4f7;">
	<div class="app-content">
		<div class="row">
			<div class="page-title has-bg" style="padding: 0px">
				<h1 style="color: black;">&nbsp;공지 사항</h1>
			</div>
			<div class="col-12 ui-sortable">
				<div class="panel panel-inverse"
					data-sortable-id="ui-media-object-1" data-init="true">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">공지 목록</h4>
					</div>
					<div class="panel-body" style="height: 725px;">
						<div class="col-xl-12 ui-sortable">
							<div class="panel panel-inverse">
								<div class="panel-body">
									<div id="data-table-combine_wrapper"
										class="dataTables_wrapper dt-bootstrap4 no-footer">
										<div class="dataTables_wrapper dt-bootstrap">
											<div class="row">
												<table id="data-table-combine1"
													class="table table-hover mb-0 text-inverse">
													<thead>
														<tr role="row"  style="text-align:center;">
															<th width="15%">순번</th>
															<th width="55%">제목</th>
															<th width="15%">등록일</th>
															<th width="15%">조회수</th>
														</tr>
													</thead>
													<tbody style="text-align:center;">
													<c:forEach var="list" items="${noticeList}">
														<tr onclick="OpenWindow('noticeDetail.do?noticeNo=${list.noticeNo}','상세보기',857,600);">
															<td><%=b++%></td>
															<td style="text-align:left;">${list.noticeTitle }</td>
															<td>${list.noticeRegdate}</td>
															<td>${list.noticeViewcnt}</td>
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
	<script>
		var options = {
			dom : '<"dataTables_wrapper dt-bootstrap"<"row"<"col-xl-12 d-xl-block justify-content-center"fr>>t<"row"<"col-md-5"i><"col-md-7"p>>>',
			buttons : [],
			pageLength : 10,
			keys : true,
			bLengthChange : false,
			order : [ [ 0, 'desc' ] ],
			ordering : true,
			serverSide : false,
			lengthMenu : false
		};
	
		$('#data-table-combine1').DataTable(options);
	</script>
</body>
