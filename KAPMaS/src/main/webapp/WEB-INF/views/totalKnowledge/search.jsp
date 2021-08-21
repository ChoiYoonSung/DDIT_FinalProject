<%@page import="com.spring.dto.TotalKnowledgeVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkList.jsp" %>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<% int b = 0 ; %>
<c:set var="tkListArr" value="${dataMap.tkList }" />
<c:set var="knowList" value="${dataMap.knowList }" />
<c:set var="prbList" value="${dataMap.prbList }" />
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<style>
ul li {list-style-type: none; float: left;}
a{
	color: black;
}
</style>

</head>
<body style="background-color: #f0f4f7;">
<div class="app-content">
	<div id="content">
		<div class="search-banner" style="padding:0px;">

			<div class="container" style="text-align:center; padding-top: 30px">
				<h1 style="color:black; padding-bottom:30px"> 통합 검색</h1>
				<div class="input-group" style="margin: 0 auto; width: 800px;">
					<div class="btn-group me-1 mb-1">
						<a href="javascript:;" class="btn btn-default">내부 검색</a> <a
							href="#" data-bs-toggle="dropdown"
							class="btn btn-default dropdown-toggle" aria-expanded="false"><i
							class="fa fa-caret-down"></i></a>
						<div class="dropdown-menu dropdown-menu-end" style="">
							<a href="externalSearch.do" class="dropdown-item">외부검색</a>
						</div>
					</div>
					<input type="text" class="form-control form-control-lg" id="addKW" onkeyup="enterkey()"
						placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
					<button type="button" class="btn btn-lg" onclick="addKeyword()">
						<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
					</button>
					<button type="button" class="btn btn-lg" onclick="goSearch()">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div style="height:30px; margin:0 auto; padding:0px; width:800px;" >
					<ul class="popular-tags" id="KWList" >
					</ul>
				</div>
 
			</div>
		</div>
	</div>

<!-- 	<div style="text-align:center; background-color: #fff; width: 830px; text-align: center;">
		<h4 class="card-title">금주의 인기 게시물</h4>
		<p class="card-text">7일 이내의 가장 조회수가 높은 게시물 입니다.</p>
	</div>	
 -->	<div class="row" style="background-color: #f0f4f7; text-align:center;" >
		<div class="panel panel-inverse col-12"	style="background-color: #f0f4f7;">

			<div class="panel-heading ui-sortable-handle">
				<h4 class="card-title">금주의 인기 게시물</h4>&nbsp;&nbsp;|&nbsp;&nbsp;
				<p class="card-text">7일 이내의 가장 조회수가 높은 게시물 입니다.</p>
			</div>
			<div class="panel-body" style="background-color: white;">
				<h3 class="card-title">프로젝트 보고서</h3>
					<div class="card-body row" style="text-align: center;"></div>

					<div class="table-responsive">
						<table id="data-table-combine" style="text-align: center;"
							class="table table-hover mb-0 text-inverse">
							<thead>
								<tr role="row">
									<th width="10%" class="sorting sorting_desc">자료코드</th>
									<th width="50" class="text-nowrap sorting">프로젝트 명</th>
									<th width="10%" class="text-nowrap sorting">담당자</th>
									<th width="10%" class="text-nowrap sorting">등록일</th>
									<th width="10%" class="text-nowrap sorting">조회수</th>
									<th width="10%" class="text-nowrap sorting">추천수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty prbList }" >
									<tr>
										<td colspan="8">
											<strong>7일 이내에 등록된 게시글이 없습니다.</strong>
										</td>
									</tr>
								</c:if>	
								<c:forEach items="${prbList}" var="prb" begin="0" end="4">
									<tr style="text-align: center;"	onclick="OpenWindow('prbDetail.do?prCode=${prb.prCode }','상세보기',700,550);">
										<td class="fw-bold text-inverse dtr-control"tabindex="0"> ${prb.prCode }</td>
										<td style="text-align: left;">${prb.pTitle }</td>
										<td>${prb.empName }</td>
										<td>${prb.prRegdate }</td>
										<td>${prb.prViewcnt }</td>
										<td>${prb.prLikecnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<a href="projectreport.do" class="btn btn-sm btn-warning">더 보기</a>
					</div>			
				
			<hr>
				<h3 class="card-title">노하우</h3>
					<div class="card-body row" style="text-align: center;"></div>

					<div class="table-responsive">
						<table id="data-table-combine" style="text-align: center;"
							class="table table-hover mb-0 text-inverse">
							<thead>
								<tr role="row">
									<th width="10%" >자료 코드</th>
									<th width="10%" >카테고리</th>
									<th width="30%" >제목</th>
									<th width="10%" >요청자</th>
									<th width="10%" >등록일</th>
									<th width="10%" >조회수</th>
									<th width="10%" >추천수</th>
									<th width="10%" >앤서</th>
								</tr>
							</thead>
							<c:if test="${empty knowList }" >
								<tr>
									<td colspan="8">
										<strong>7일 이내에 등록된 게시글이 없습니다.</strong>
									</td>
								</tr>
							</c:if>	
							<tbody >
								<c:forEach items="${knowList}" var="know" begin="0" end="4">
									<tr	onclick="OpenWindow('knowDetail.do?khCode=${know.khCode}','상세보기',850,780);">
										<td class="fw-bold text-inverse dtr-control"tabindex="0">${know.khCode}</td>
										<td>${know.khCategory}</td>
										<td class="sorting_1" style="text-align: left;">${know.khTitle}</td>
										<td>${know.empName}</td>
										<td>${know.khRegdate}</td>
										<td>${know.khViewcnt}</td>
										<td>${know.khLikecnt}</td>
										<td>${know.answercnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<br>
						<a href="knowhow.do" class="btn btn-sm btn-warning">더 보기</a>
					</div>

				<hr>
<h3 class="card-title">기타 자료 게시판</h3>
				<div class="card-body row" style="text-align:center;">
				</div>

				<div class="table-responsive">
					<table id="data-table-combine" style="background-color: white;"
						class="table table-hover mb-0 text-inverse"
						style="width:100%;">
						<thead>
							<tr role="row" style="text-align: center;">
								<th width="12%">자료 코드</th>
								<th width="38%">제목</th>
								<th width="10%">작성자</th>
								<th width="10%">등록일</th>
								<th width="10%">조회수</th>
								<th width="10%">추천수</th>
								<th width="10%">첨부</th>
							</tr>
						</thead>
						<c:if test="${empty tkListArr }" >
							<tr>
								<td colspan="8">
									<strong>7일 이내에 등록된 게시글이 없습니다.</strong>
								</td>
							</tr>
						</c:if>	
						<tbody>
						<c:forEach items="${tkListArr}" var="tk" begin="0" end="4">
							<tr	onclick="OpenWindow('detail.do?tkCode=${tk.tkCode}','상세보기',850,780);">
								<td class="fw-bold text-inverse dtr-control"tabindex="0">${tk.tkCode}</td>
								<td style="text-align: left;">${tk.tkTitle}</td>
								<td>${tk.empName}</td>
								<td>${tk.tkRegdate}</td>
								<td>${tk.tkViewCnt}</td>
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
					<br>
					<a href="pds.do" class="btn btn-sm btn-warning">더 보기</a>
				</div>

				</div>				
				
		</div>
	</div>
</div>	
	<form id="arrForm" action="searchResult.do" method="post">
		<input type="hidden" id="arrFormInput" value="" name="arrFromInput">
	</form>	
<script>
function addKeyword(){
	var KW = $('#addKW').val().trim();
	var len = $(".key").length;
	
	if(KW == null || KW == ""){
		swal({
			title : '알림',
			text : '키워드를 입력해주세요',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});
		return;
	}
	if(KW.length > 10){
		swal({
			title : '알림',
			text : '키워드는 최대 10글자까지 입력 가능합니다.',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});
		return;
	}			
	if(len > 4){
		swal({
			title : '알림',
			text : '키워드는 최대 5개까지 입력 가능합니다.',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});
		$('#addKW').val("");
		return;
	}
	if(len > 0){
		for(var i = 0; i < len; i++){
			if(KW == $(".key")[i].innerText){
				swal({
					title : '알림',
					text : '이미 등록한 키워드입니다.',
					icon : 'warning',
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning me-1',
							closeModal : true
						}
					}
				});
			return;
			}
		}
		
	}	
	var KWList = $('<li><div class="d-flex align-items-center"><a href="#"> <span class="key">' + KW +'</span></a><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
	$('#KWList').append(KWList);
	$('#addKW').val("");
	
}
</script>		
	<script>
	$(document).ready(

		function() {
			$('th[name="hiding"]').attr('style', "display:none;"); //숨기기
			$('td[name="hiding"]').attr('style', "display:none;"); //숨기기
			$('.fw-bold text-inverse dtr-control hide').attr('style',
					"display:none;"); //숨기기

		}
	);
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			addKeyword();
			} 
	}


	
	function delKW(e){
		var KW = $(e);
		KW.closest("li").remove();
	}
	
	function goSearch(){
		
		var len = $(".key").length;
		var arr = [];
		for(var i = 0; i < len; i++){
			arr.push($(".key")[i].innerText);
		}
		if(arr.length < 1){
				swal({
					title : '알림',
					text : '키워드를 추가해주세요',
					icon : 'warning',
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-warning me-1',
							closeModal : true
						}
					}
				});
			return;
		}
		
		
		var arrString = arr.join();
		$('#arrFormInput').val(arrString);
		
		document.getElementById("arrForm").submit();
		
	}
	
	</script>
</body>
