<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>


<head></head>
<body style="padding: 40px; background: white;">
	<div style="max-width: 1000px; min-width: 800px; margin: 0 auto; min-height: 900px;">
		<section class="content container">
			<h2 style="text-align: center">${pi.piTitle }</h2>
			<input type="hidden" id="piCode" value="${pi.piCode }">
			<input type="hidden" id="empId" value="${pi.empId }">
			
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
				<div class="row" style="margin-bottom: 20px">
					<div class="col-md-8"></div>
					<div class="col-md-4">
						<div class="widget-chart-info-progress">
							<b>${pi.piMileStone }</b>
							<span class="float-end">${piMileStonePercent }%</span>
						</div>
						<div class="progress h-10px">
							<div class="progress-bar progress-bar-striped progress-bar-animated rounded-pill bg-orange" style="width: ${piMileStonePercent }%">${piMileStonePercent }%</div>
						</div>
					</div>
				</div>
			<div class="row">
				<div class="col-12">
					<p style="float: right">작성자 : ${pi.empId } &nbsp; &nbsp; &nbsp; &nbsp;작성일 : ${pi.piRegDate }</p>
				</div>
			</div>
			</div>


			<br> <br> <br>
			<div style="min-height: 300px; font-size: 15px;">
				${pi.piContent }
			</div>
			<div class="row" style="margin-bottom: 20px;">
				<div class="col-12" style="margin-right: 0; float: right; text-align: center;">
					<a id="completeBtn" class="btn btn-primary w-100px" href="<%=request.getContextPath() %>/project/piComplete?piCode=${pi.piCode}" onclick="completePi();">완료</a>
					<a id="modifyBtn" class="btn btn-warning w-100px" href="<%=request.getContextPath() %>/project/piModifyForm?piCode=${pi.piCode}">수정</a>
					<a id="deleteBtn" class="btn btn-danger w-100px" href="<%=request.getContextPath() %>/project/piDelete?piCode=${pi.piCode}" onclick="deletePi();">삭제</a>
					<button type="button" id="listBtn" class="btn btn-gray" onclick="CloseWindow();">닫기</button>
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
										<span class="badge bg-teal">--개의 댓글</span>
									</div>
									<div class="panel-body bg-light">
										<div class="chats ps ps--active-y" data-scrollbar="false"
											data-height="225px" data-init="true">
											<div class="" id="tkRepliesDiv"></div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y" style="top: 0px; height: 225px; right: 0px;">
												<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 134px;"></div>
											</div>

										</div>
									</div>
									<div class='text-center'>
										<ul id="pagination"
											class="pagination justify-content-center m-0">

										</ul>
									</div>
									<div class="panel-footer">
										<form name="send_message_form" data-id="message-form">
											<div class="input-group card-footer">
												<label for="newReplyWriter">Writer</label>
												<input class="form-control" type="hidden" placeholder="USER ID" id="newReplyWriter" readonly value="${loginUser.empId }">
												<label for="newReplyText">Reply Text</label>
												<input type="text" class="form-control" name="message" id="newTkRpContent" placeholder="Enter your reply here.">
												<button class="btn btn-primary" type="button">
													<i class="fa fa-camera"></i>
												</button>
												<button class="btn btn-primary" type="button">
													<i class="fa fa-link"></i>
												</button>
												<button type="button" class="btn btn-primary" id="replyAddBtn" onclick="replyRegist_go();">ADD REPLY</button>
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
	</div>
<script type="text/javascript">
function completePi(){
	if(!confirm("정말 완료하시겠습니까?")){
		return;
	}
}
function deletePi(){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}
}
</script>
</body>