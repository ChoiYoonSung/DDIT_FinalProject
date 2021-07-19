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
		
		<button class="btn btn-yellow me-1 mb-1" onclick="OpenWindow('paRegistForm.do','글 등록',700,700);" >글 등록하기</button>
		<div class="input-group mb-3" style="float:right;width: 300px;">
			<input type="text" class="form-control" placeholder="키워드를 입력하세요" name="keyword" value="${pageMaker.cri.keyword }">
			<div class="input-group-text" onclick="palist_go(1);" style="cursor:pointer;"><i class="fa fa-search"></i></div>
		</div><br><br><br>
		<div id="gallery" class="gallery" style="position: relative; height: 1368px;">
			<% int i = 0; %>
			<c:forEach items="${paList }" var="pa" >
			<c:set var="paAtType" value="${pa.paAtType }" />
			<% i++; %>
				<div class="image gallery-group-<%=i %>" style="position: absolute; left: 0px; top: 0px;box-shadow: 2px 2px 10px silver;">
				<div class="image-inner">
				<a href="javascript:OpenWindow('paDetail.do?pacode=${pa.paCode }','상세보기',700,700);" data-lightbox="gallery-group-1">
				<div class="img">
					<c:if test="${paAtType eq 'DOCX'}">
			    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/docx.png">
					</c:if>
					<c:if test="${paAtType eq 'XLSX'}">
			    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/XLSX.png">
					</c:if>
					<c:if test="${paAtType eq 'XLS'}">
			    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/XLSX.png">
					</c:if>
					<c:if test="${paAtType eq 'HWP'}">
			    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/hwp.png">
					</c:if>
				</div>
				</a>
				<p class="image-caption">
				첨부파일 다운로드
				</p>
				</div>
				<div class="image-info">
				<h5 class="title">${pa.paTitle }</h5>
				<div class="d-flex align-items-center mb-2">
				<div class="ms-auto">
				<small>by</small> <a href="javascript:;">${pa.empName }</a>
				</div>
				</div>
				<div style="font-size:15px;">
				등록일 : 20${pa.paRegdate.split("/")[0] }년 ${pa.paRegdate.split("/")[1] }월 ${pa.paRegdate.split("/")[2] }일
				</div>
				</div>
				</div>
			</c:forEach>
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
