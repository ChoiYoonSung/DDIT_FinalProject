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
					<div class="mb-1">QNA	</div>
				</div>
				<div class="register-content row">
					<div class="mb-3 col-8">
						<label class="mb-2">QNA 제목</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qd.qnaTitle }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
						<label class="mb-2">작성자</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qd.empId  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-2">
						<label class="mb-2">조회수</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<input type="text" class="form-control fs-13px"
									placeholder="" value="${qd.qnaViewcnt  }"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="mb-3 col-12">
						<label class="mb-2">QNA 내용</label>
						<div class="row gx-3">
							<div class="col-md-12 mb-2 mb-md-0">
								<textarea class="form-control fs-13px"
									style="height: 140px; resize: none;" readonly="readonly">${qd.qnaContent}</textarea>
							</div>
						</div>
					</div>
					
				</div>
			<div class="panel panel-inverse" data-sortable-id="index-2">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">답변</h4>
				</div>
				<div class="panel-body bg-light">
					<c:if test="${empty qr }" >
					<form name="send_message_form" data-id="message-form">
					<input type="hidden" name="qnaNo" value="${qd.qnaNo }">
						<div class="input-group card-footer">
							<label for="newReplyWriter"></label> <input type="hidden" id="newReplyWriter" value="mimi">
							<label for="newReplyText"></label> <input type="text" class="form-control" name="message" id="newRpContent" placeholder="답변을 입력해주세요.">
							<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">등록</button>
						</div>
					</form>
					</c:if>
					<c:if test="${!empty qr }" >
					<c:forEach var="qr" items="${qr }">
						${qr.qnaRpContent }
					</c:forEach>
					<div class="col-6" style="margin-right: 0; float: right; text-align: right;">
						<button type="button" id="modifyBtn" class="btn btn-primary" style="display: inline;" onclick="location.href='<%=request.getContextPath() %>/admin/qnaModify.do?qnaNo=${qd.qnaNo }'">수정</button>
						<button type="button" id="deleteBtn" class="btn btn-danger" style="display: inline;" onclick="location.href='<%=request.getContextPath() %>/admin/qnareplyDelete.do?qnaNo=${qd.qnaNo }'">삭제</button>
					</div>
					</c:if>
				</div>
			</div>
			<div class="mb-3 app-content col-12">
				<div class="row">
					<div class="col-6">
						<a type="button" href="<%=request.getContextPath() %>/admin/qnaDelete.do?qnaNo=${qd.qnaNo }"
							class="btn btn-danger d-block w-100 btn-lg h-45px fs-13px">삭제</a>
					</div>
					<div class="col-6">
						<a type="button" href="<%=request.getContextPath() %>/admin/qnaManage"
							id="cancelButton"
							class="btn btn-secondary d-block w-100 btn-lg h-45px fs-13px">돌아가기</a>
					</div>
				</div>
			</div>
		</div>
		</div>

	</div>
	<script>
	function replyRegist_go(){
		//alert("add reply btn");
		var rpWriter = $('#newReplyWriter').val();
		var rpContent = $('#newRpContent').val();
		var qnaNo = $('input[name="qnaNo"]').val()
		
		if(!(rpWriter && rpContent)){
			swal({
				title: '',
				text: '작성자 혹은 내용은 필수입니다.',
				icon: 'warning', // info success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-warning', // primary success warning danger
			                closeModal: true
			              }
			        }
			});
			return;
		}
		
		var param = {
				qnaNo:""+qnaNo+"",
				rpWriter:rpWriter,
				rpContent:rpContent	
		}
		
		console.log(param)
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/qnaRegister.do",
			type:"POST",
			data:param,
			success:function(data){
				swal({
					title: '성공',
					text: '답변이 등록되었습니다.',
					icon: 'success', // info success warning danger
					buttons: {
				        	confirm: {
						text: '확인',
				                value: true,
				                visible: true,
				                className: 'btn btn-success', // primary success warning danger
				                closeModal: true
				              }
				        }
				}).then(function(e){
					window.location.reload()
				});
			},
			error:function(error){
				swal({
					title: 'Error',
					text: '시스템 에러가 발생하였습니다.\n Error Code : ' + error,
					icon: 'error', // info success warning danger
					buttons: {
				        	confirm: {
						text: '확인',
				                value: true,
				                visible: true,
				                className: 'btn btn-danger', // primary success warning danger
				                closeModal: true
				              }
				        }
				});
			}
			
		});
	}

	</script>
</body>