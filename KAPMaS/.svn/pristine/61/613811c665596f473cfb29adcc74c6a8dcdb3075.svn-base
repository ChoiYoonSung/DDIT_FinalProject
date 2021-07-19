<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="paList" value="${dataMap.paList }" />

<head>
<style>
.pds-wrapper{
	margin: 0 auto;
	width:90%;
}
.pds-wrapper h2{
	text-align: center;
}
th:nth-child(n+3), td:nth-child(n+3){
	text-align: center;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #ffc82d;
    border-color: #ffc82d;
}
</style>
</head>
<body style="padding: 40px; background: #f0f4f7;">
	<h2>자료실</h2><hr>
	<div class="panel panel-inverse" data-sortable-id="ui-widget-6" style="">
		<div class="panel-heading ui-sortable-handle">
		<h4 class="panel-title">
		프로젝트 자료실
		</h4>
		</div>
		
		<div class="panel-body" style="height: 600px;">
		
	
	<div class="pds-wrapper">
		
		<button class="btn btn-yellow me-1 mb-1" onclick="OpenWindow('paRegistForm.do','글 등록',900,800);" >글 등록하기</button>
		<div class="input-group mb-3" style="float:right;width: 300px;">
			<input type="text" class="form-control" placeholder="키워드를 입력하세요" name="keyword" value="${pageMaker.cri.keyword }">
			<div class="input-group-text" onclick="palist_go(1);" style="cursor:pointer;"><i class="fa fa-search"></i></div>
		</div><br><br><br>

		<div class="table-responsive">
		  <table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>첨부파일</th>
			</tr>
			<c:forEach items="${paList }" var="pa" >
				<tr>
					<td>${pa.paRowNum }</td>
					<td>
						<a href="javascript:OpenWindow('paDetail.do?pacode=${pa.paCode }','상세보기',900,800);">
							<span class="col-sm-12 " style="color: black;">${pa.paTitle }</span>
						</a>
					</td>
					<td>${pa.empName }</td>
					<td>${pa.paRegdate }</td>
					<td>
						<c:if test="${!empty pa.attachList }">
							<i class="far fa-lg fa-fw me-10px fa-file"></i>
						</c:if>
					</td>
				</tr>
			</c:forEach>		
		  </table>
		</div>
		<div style="display: flex; justify-content: center;">
			<c:set var="list_url" value="pa.do" />
			<div class="pagination">
				<div class="page-item">
				<a class="page-link" href="javascript:palist_go(1,'${list_url }');">
					<i class="fas fa-angle-double-left"></i>
				</a>
				</div>
				<div class="page-item">
					<a class="page-link" href="javascript:palist_go(${pageMaker.prev ? pageMaker.startPage-1 : 1},'${list_url }');">
						<i class="fas fa-angle-left"></i>
					</a>
				</div>
				<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
					<div class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
						<a class="page-link" href="javascript:palist_go(${pageNum},'${list_url }');" >${pageNum }</a>
					</div>
				</c:forEach>
				<div class="page-item">
					<a class="page-link" href="javascript:palist_go(${pageMaker.next ? pageMaker.endPage+1 : pageMaker.cri.page},'${list_url }');">
						<i class="fas fa-angle-right" ></i>
					</a>
				</div>
				<div class="page-item">
					<a class="page-link" href="javascript:palist_go(${pageMaker.realEndPage} ,'${list_url }');">
						<i class="fas fa-angle-double-right"></i>
					</a>
				</div>	
			</div>
		</div>
	</div>
	</div>
	</div>	
	<form id="jobForm">
		<input type='hidden' name="page" value="${pageMaker.cri.page}" />
		<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
	</form>
	<script>
	function palist_go(page, url) {

		if (!url)
			url = "pa.do";

		var jobForm = $('#jobForm');
		// alert($('select#perPageNum').val());
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='keyword']").val(
				$('div.input-group>input[name="keyword"]').val());

		$('form#jobForm').attr({
			action : url,
			method : 'get'
		}).submit();

	}
	</script>
	
</body>