<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="pace-done pace-top">
	<div class="pace pace-inactive">
		<div class="pace-progress" data-progress-text="100%"
			data-progress="99" style="transform: translate3d(100%, 0px, 0px);">
			<div class="pace-progress-inner"></div>
		</div>
		<div class="pace-activity"></div>
	</div>

	<div id="loader" class="app-loader loaded">
		<span class="spinner"></span>
	</div>

	<div id="app" class="app">
		<div class="register register-with-news-feed">
			<div class="register-container" style="margin: 0px;width: 100%;">
				<div class="register-header mb-25px h1">
					<div class="mb-1">QNA</div>
				</div>
				<div class="register-content row">
					<div class="mb-3 col-8">
						<label class="mb-2">QNA 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qnaInfo.qnaTitle}"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
						<label class="mb-2">작성자</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qnaInfo.empName}(${qnaInfo.empId})"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
						<label class="mb-2">조회수</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qnaInfo.qnaViewcnt}"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-12">
						<label class="mb-2">QNA 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px"
									style="height: 140px; resize: none;" readonly="readonly">${qnaInfo.qnaContent}</textarea>
							</div>
						</div>
					</div>
					
				</div>
			<div class="panel panel-inverse" data-sortable-id="index-2">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">답변</h4>
				</div>
				<div class="panel-body bg-light">
					<input id="nullCheck" type="hidden" value="${nullCheck}">
					<input id="qnaNo" type="hidden" value="${qnaInfo.qnaNo}">
					<c:if test="${empty qr}" >
					<form name="send_message_form" data-id="message-form">
						<div class="input-group card-footer">	
							<h2>아직 답변이 등록되지 않았습니다.</h2>
						</div>
					</form>
					</c:if>
					<c:if test="${!empty qr}" >
					<c:forEach var="qr" items="${qr}">
						${qr.qnaRpContent}
					</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="mb-3 app-content col-12">
				<div class="row">
					<c:if test="${loginUser eq qnaInfo.empId}">
						<div class="col-4">
							<a type="button" onclick="modifyQna();"
								class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">수정</a>
						</div>
						<div class="col-4">
							<a type="button" onclick="removeQna();"
								id="cancelButton"
								class="btn btn-danger d-block w-100 btn-lg h-45px fs-13px">삭제</a>
						</div>
					</c:if>
					<div class="col-4">
						<a type="button" onclick="javascript:CloseWindow();"
							id="cancelButton"
							class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">닫기</a>
					</div>
				</div>
			</div>
		</div>
		</div>

	</div>
	<script>
		function modifyQna(){
			var nullCheck = $('input[id="nullCheck"]').val();
			var qnaNo = $('input[id="qnaNo"]').val();
			if(nullCheck != "0"){
    			swal({
					title : '경고',
					text : '이미 답변이 작성되어 수정이 불가능합니다',
					icon : 'error', // primary success warning danger
					buttons : {
						confirm : {
							text : '확인',
							value : true,
							visible : true,
							className : 'btn btn-danger',
							closeModal : true
						}
					}
				});
				return;
			}
			
			location.href = "<%=request.getContextPath()%>/center/qnaModify?qnaNo=" + qnaNo; 
			
		}
		
		function removeQna(){
			
    		swal({
				title : 'QNA 삭제',
				text : '정말 삭제하시겠습니까?',
				icon : 'warning', // primary success warning danger
				buttons : {
					cancel : {
						text : '취소',
						value : false,
						visible : true,
						className : 'btn btn-default',
						closeModal : true,
					},
					confirm : {
						text : '확인',
						value : true,
						visible : true,
						className : 'btn btn-primary',
						closeModal : true
					}
				}
			}).then(function(val) {
				if (val == false) {
	    			return	
				}
			});
    		
			var qnaNo = $('input[id="qnaNo"]').val();
			
			var param = {
					qnaNo : qnaNo
			}
			
			$.ajax({
				url:"<%=request.getContextPath()%>/center/qna/qnaDelete.do",
				type:"POST",
				data:param,
				success:function(data){
	    			swal({
						title : '성공',
						text : '삭제에 성공했습니다.',
						icon : 'success', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-primary',
								closeModal : true
							}
						}
					}).then(function(val) {
						if (val == true) {
							CloseWindow();
						}
					});
				},
				error:function(error){
	    			swal({
						title : '경고',
						text : '삭제에 실패하였습니다. 관리자에게 문의하세요',
						icon : 'error', // primary success warning danger
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-danger',
								closeModal : true
							}
						}
					});
				}
			});
		}
	</script>
</body>
