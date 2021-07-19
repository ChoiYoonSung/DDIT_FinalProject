<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<head>
<style type="text/css">

</style>
</head>
<body>
<div class="app-content">
<div class="row">
	<!-- BEGIN col-6 -->
	<div class="col-xl-6 ui-sortable">
		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Project List</h4>
				<div class="panel-heading-btn">
					<a href="javascript:window.parent.location.href='index.do?mCode=M010000';" class="btn btn-xs btn-icon btn-default">
						<i class="fa fa-expand"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload">
						<i class="fa fa-redo"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse">
						<i class="fa fa-minus"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
						<thead>
							<tr>
								<th class="col-2">프로젝트 코드</th>
								<th class="col-6">프로젝트 이름</th>
								<th class="col-2">유형</th>
								<th class="col-2">마감일</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${propjm }" var="pro" begin="0" end="4">
							<tr>
								<td class="col-2">${pro.pCode }</td>
								<td class="col-6">${pro.pName }<c:if test="${pro.pStartdate eq now }"><span class="badge bg-yellow ms-5px">NEW</span></c:if></td>
								<td class="col-2">${pro.pmAuthority eq 'a' ? 'Observe':'Join' }</td>
								<td class="col-2">${pro.pEnddate }</td>
<!-- 								<td class="col-2">프로젝트 코드</td> -->
<!-- 								<td class="col-6">프로젝트 이름</td> -->
<!-- 								<td class="col-2">유형</td> -->
<!-- 								<td class="col-2">마감일</td> -->
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
				<h4 class="panel-title">My CoP List</h4>
				<div class="panel-heading-btn">
					<a href="javascript:window.parent.location.href='index.do?mCode=M030100';" class="btn btn-xs btn-icon btn-default">
						<i class="fa fa-expand"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload">
						<i class="fa fa-redo"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse">
						<i class="fa fa-minus"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
					<c:set var="jcv" value="${cop}"/>
					<c:set var="jcp" value="${copJoinCnt}"/>
						<thead>
							<tr>
								<th class="col-2">CoP 코드</th>
								<th class="col-6">CoP 이름</th>
								<th class="col-2">개설자</th>
								<th class="col-2">참여자 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="jcv" items="${jcv}" begin="0" end="4" varStatus="status">
							<tr>
								<th class="col-2">${jcv.copCode }</th>
								<th class="col-6">${jcv.copName }</th>
								<th class="col-2">${jcv.copOwner }</th>
								<th class="col-2">${jcp[status.index].copPersonnel}</th>
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
	<div class="col-xl-6 ui-sortable">

		<!-- BEGIN panel -->
		<div class="panel panel-inverse">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Project List</h4>
				<div class="panel-heading-btn">
					<a href="javascript:window.parent.location.href='index.do?mCode=M010000';" class="btn btn-xs btn-icon btn-default">
						<i class="fa fa-expand"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload">
						<i class="fa fa-redo"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse">
						<i class="fa fa-minus"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
						<thead>
							<tr>
								<th class="col-2">프로젝트 코드</th>
								<th class="col-6">프로젝트 이름</th>
								<th class="col-2">유형</th>
								<th class="col-2">마감일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-2">P5</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P4</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">observe</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P3</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P2</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P1</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">observe</td>
								<td class="col-2">2021/08/13</td>
							</tr>
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
				<h4 class="panel-title">Project List</h4>
				<div class="panel-heading-btn">
					<a href="javascript:window.parent.location.href='index.do?mCode=M010000';" class="btn btn-xs btn-icon btn-default">
						<i class="fa fa-expand"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload">
						<i class="fa fa-redo"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse">
						<i class="fa fa-minus"></i>
					</a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
						<thead>
							<tr>
								<th class="col-2">프로젝트 코드</th>
								<th class="col-6">프로젝트 이름</th>
								<th class="col-2">유형</th>
								<th class="col-2">마감일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-2">P5</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P4</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">observe</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P3</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P2</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">join</td>
								<td class="col-2">2021/08/13</td>
							</tr>
							<tr>
								<td class="col-2">P1</td>
								<td class="col-6">최종프로젝트 - KAPMaS<span class="badge bg-yellow ms-5px">NEW</span></td>
								<td class="col-2">observe</td>
								<td class="col-2">2021/08/13</td>
							</tr>
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

	<div class="col-xl-12 ui-sortable">
		<div class="panel panel-inverse" data-sortable-id="table-basic-5">
			<!-- BEGIN panel-heading -->
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">공지사항</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand"><i class="fa fa-expand"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload"><i class="fa fa-redo"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse"><i class="fa fa-minus"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove"><i class="fa fa-times"></i></a>
				</div>
			</div>
			<!-- END panel-heading -->
			<!-- BEGIN panel-body -->
			<div class="panel-body">
				<!-- BEGIN table-responsive -->
				<div class="table-responsive">
					<table class="table table-striped mb-0">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
						<c:if test="${noticeList ne null } ">
						<c:forEach items="${noticeList }" var="notice" begin="0" end="4">
							<tr>
								<td>${notice.noticeNo }</td>
								<td>${notice.noticeTitle }</td>
								<td>${notice.noticeRegdate }</td>
								<td>${notice.noticeViewcnt }</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${noticeList eq null }">
							<tr class="odd">
								<td colspan="5" class="dataTables_empty"><h3>공지사항이 없습니다.</h3></td>
							</tr>
						</c:if>
						</tbody>
					</table>
				</div>
				<!-- END table-responsive -->
			</div>
			<!-- END panel-body -->
		</div>
	</div>


</div>
<!-- END row -->
</div>
</body>
