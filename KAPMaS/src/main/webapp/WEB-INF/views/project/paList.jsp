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
<body>
	<div class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">${pro.pName } - 자료실</h1>
			</div>
		</div>
		<div class="panel panel-inverse">
			<div class="panel-heading">
				<div class="panel-title" style="height: 16px;"></div>
			</div>
			<div class="panel-body">
				<c:if test="${auth ne 'OB' }">
					<c:if test="${pro.pEnabled eq '1' }">
						<button class="btn btn-primary me-1 mb-1" onclick="OpenWindow('paRegistForm.do','글 등록',700,700);" >자료 등록</button>
					</c:if>
				</c:if>
				<div class="input-group mb-3" style="float:right;width: 300px;">
					<input type="text" class="form-control" placeholder="키워드를 입력하세요" name="keyword" value="${pageMaker.cri.keyword }"  onkeyup="enterkey()">
					<div class="input-group-text" onclick="palist_go(1);" style="cursor:pointer;"><i class="fa fa-search"></i></div>
				</div><br><br><br>
				<div id="gallery" class="gallery" style="position: relative; height: 1368px;">
					<c:forEach items="${paList }" var="pa" >
					<c:set var="paAtType" value="${pa.paAtType }" />
						<div class="image gallery-group-1" style="box-shadow: 2px 2px 10px silver;width:221px;">
						<div class="image-inner">
						<a href="javascript:OpenWindow('paDetail.do?pacode=${pa.paCode }','상세보기',700,700);" data-lightbox="gallery-group-1">
						<div class="img">
						<c:choose>
							<c:when test="${paAtType eq 'DOCX'}">
					    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/docx.png">
							</c:when>
							<c:when test="${paAtType eq 'XLSX'}">
					    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/XLSX.png">
							</c:when>
							<c:when test="${paAtType eq 'XLS'}">
					    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/XLSX.png">
							</c:when>
							<c:when test="${paAtType eq 'HWP'}">
					    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/hwp.png">
							</c:when>
							<c:when test="${paAtType eq 'PPTX'}">
					    		<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/powerpoint.png">
							</c:when>
							<c:otherwise>
								<img alt="" src="<%=request.getContextPath()%>/resources/images/attachImg/file.png" 
								style="width: 190px; margin: 0 auto;display: block; height: 190px;padding-top: 12px;">
							</c:otherwise>
						</c:choose>
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
						등록일 : ${pa.paRegdate.split("-")[0] }년 ${pa.paRegdate.split("-")[1] }월 ${pa.paRegdate.split("-")[2] }일
						</div>
						</div>
						</div>
					</c:forEach>
				</div>
			<form id="jobForm">
				<input type='hidden' name="page" value="${pageMaker.cri.page}" />
				<input type='hidden' name="keyword" value="${pageMaker.cri.keyword }" />
			</form>
			</div>
		</div>
	</div>
		
		
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
	
	function enterkey() { 
		if (window.event.keyCode == 13) { 
			palist_go(1);
		}
	}

	</script>
	
</body>
