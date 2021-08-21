<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<head></head>
<body style="padding: 40px; background: white;">
		<section class="content container">
			<h2 style="text-align: center">리스크 & 이슈 - ${pi.piTitle }</h2>
			<input type="hidden" id="piCode" name="piCode" value="${pi.piCode }">
			<input type="hidden" id="empId" name="empId" value="${pi.empId }">
			
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px; margin-bottom: 20px;">
				<div class="row">
				<div class="col-12" style="text-align: right;">
				<c:if test="${loginUser.empId eq pi.empId }">
					<input type="button" id="completeBtn" class="btn btn-primary w-80px" onclick="completePi();" value="완료">
					<input type="button" id="modifyBtn" class="btn btn-yellow w-80px"  onclick="modifyPi();" value="수정">
					<input type="button" id="deleteBtn" class="btn btn-danger w-80px" onclick="deletePi();" value="삭제">
				</c:if>
					<button type="button" id="listBtn" class="btn btn-gray w-80px" onclick="CloseWindow();">닫기</button>
				</div>
					<div class="col-12">
						<p style="float: right">작성자 : ${empName } &nbsp; &nbsp; &nbsp; &nbsp;작성일 : ${pi.piRegDate }</p>
					</div>
					<div class="col-6">
						<div style="min-height: 300px; font-size: 15px; background-color: #f0f8ff; padding: 10px;">
							${pi.piContent }
						</div>
					</div>
					<div class="col-6 row" style="margin-bottom: 20px;">
						<div class="widget-chart-info-progress">
							<b>${pi.piMileStone }</b>
							<span class="float-end">${piMileStonePercent }%</span>
							<div class="progress h-10px">
								<div class="progress-bar progress-bar-striped progress-bar-animated rounded-pill bg-orange" style="width: ${piMileStonePercent }%">${piMileStonePercent }%</div>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
<!-- 										<th width="1%">코드</th> -->
										<th width="5%">이슈 제목</th>
										<th width="2%">작성자</th>
										<th width="1%">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pilist" items="${piList }">
										<tr onclick="javascript:OpenWindow('<%=request.getContextPath() %>/project/piDetail/${pilist.piCode }', '이슈&리스크 상세보기', '1000', '800');" style="cursor: pointer;">
<%-- 											<td>${pilist.piCode }</td> --%>
											<td>${pilist.piTitle }</td>
											<td>${pilist.empName }</td>
											<td>${pilist.piStatus eq 0 ? '완료' : '미완료' }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

 		<section class="content container">
			<!-- reply component start -->
			<div class="row">
				<div class="col-md-12">
					<div class="card card-info">
						<div class="card-body">
							<!-- The time line -->
							<div class="">
								<!-- timeline time label -->

								<div class="panel panel-inverse" data-sortable-id="index-2">
									<div class="panel-heading ui-sortable-handle">
										<h4 class="panel-title">댓글 목록</h4>
										<span class="badge bg-teal">${RpCnt} 개의 댓글</span>
									</div>
									<div class="panel-body bg-light">


										<div class="chats ps ps--active-y" data-scrollbar="false"
											data-height="225px" data-init="true">
											<div id="piRepliesDiv">
											</div>
										</div>


										<div class='text-center'>
											<ul id="pagination"
												class="pagination justify-content-center m-0">

											</ul>
										</div>


									</div>
									<div class="panel-footer">
										<form name="send_message_form" data-id="message-form">
											<div class="input-group card-footer">
												<label for="newReplyWriter"></label>
												<input class="form-control" type="hidden" placeholder="USER ID" id="newReplyWriter" readonly value="${loginUser.empId }">

												<label for="newReplyText"></label> <input type="text" class="form-control" name="message" id="newPiRpContent" placeholder="댓글을 입력해주세요.">

												<button type="button" class="btn btn-primary"
													id="replyAddBtn" onclick="replyRegist_go();">등록</button>
											</div>
										</form>
									</div>
								</div>


							</div>
						</div>
						<div class="card-footer"></div>
					</div>
				</div>
				<!-- end col-md-12 -->
			</div>
			<!-- end row -->
		</section>
<%@ include file="./pi_reply_js.jsp"%>
<script type="text/javascript">
function completePi(){
	swal({
        title: '이슈&리스크 완료',
        text: '정말 완료하시겠습니까?\n완료할 시 삭제할 수 없습니다.',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == true){
	        	 window.location.href="<%=request.getContextPath() %>/project/piComplete?piCode=${pi.piCode}";
               } else {
            	   return;
               }
      });
}

function modifyPi(){
	window.location.href="<%=request.getContextPath() %>/project/piModifyForm?piCode=${pi.piCode}";
}

function deletePi(){
	swal({
        title: '이슈&리스크 삭제',
        text: '정말 삭제하시겠습니까?',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == true){
	        	 window.location.href="<%=request.getContextPath() %>/project/piRemove?piCode=${pi.piCode}";
               } else {
            	   return;
               }
      });
}
</script>
</body>