<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="./reply_js.jsp"%>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkDetail.jsp"%>
<!-- 클립보드 알림 -->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/color_admin/template/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>
<body style="padding: 40px; background: white;">
	<div
		style="max-width: 1000px; min-width: 800px; margin: 0 auto; min-height: 900px;">
		<section class="content container">
			<h2 style="text-align: center">${tk.tkTitle}</h2>
			<input type="hidden" id="scTitle" value="${tk.tkTitle}">
			<input type="hidden" id="empId" value="${loginUser.empId }">
			<input type="hidden" id="tkCode" value="${tk.tkCode }">
			
			
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
				<div class="row" style="margin-bottom: 20px">
					<div class="col-md-2">
						<div class="row">
							<div class="col-md-3">
								<a onclick="clip(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-clipboard"
									data-toggle="tooltip" data-placement="top" title="클립보드에 복사">
								</i>
								</a>
							</div>

							<div class="col-md-3" id="scrap">
								<a onclick="scrap(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-save" data-toggle="tooltip"
									data-placement="top" title="스크랩" id="scrapIcon"
									style="color: black;"></i>
								</a>
							</div>

							<div class="col-md-3" id="like">
								<a onclick="like(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-thumbs-up" id="likeIcon"
									style="color: black;" data-toggle="tooltip"
									data-placement="top" title="추천"></i>
								</a>
							</div>

							<div class="col-md-3" id="report">
								<a onclick="report(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-thumbs-down" id="reportIcon"
									style="color: black;" data-toggle="tooltip"
									data-placement="top" title="신고" style="color:black"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-7"></div>
					<div class="col-md-3"
						style="margin-right: 0; float: right; text-align: right;">
						<button type="button" id="modifyBtn" class="btn btn-warning"
							onclick="submit_go('modifyForm.do','${tk.tkCode }');">수정</button>
						<button type="button" id="removeBtn" class="btn btn-danger"
							onclick="submit_go('disable.do','${tk.tkCode }');">삭제</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="CloseWindow();">닫기</button>
					</div> 
				</div>
			</div>
			<div>
				<p style="float: right">작성일 : ${tk.tkRegdate}</p>
				<p style="float: right; margin-right: 10px;">작성자 : ${tk.empId }</p>
			</div>


			<br> <br> <br>
			<div style="min-height: 300px; font-size: 15px;">
				${tk.tkContent }</div>
			<div style="padding: 10px;">
				<span>첨부파일 다운로드</span>
				<div style="float:right;" >
				<ul style="list-style:none;">
					<c:forEach var="tkKeyword" items="${tkKeywordArr}">
						<li style="float:left;">#${tkKeyword }&nbsp; &nbsp;</li>
					</c:forEach>
				</ul>
				</div>
				<hr>
				<c:forEach items="${tk.attachList }" var="attach">
					<div class="col-md-4 col-sm-4 col-xs-12" style="cursor: pointer;"
						onclick="location.href='<%=request.getContextPath()%>/kms/getTkFile.do?tkAtNo=${attach.tkAtNo }';">
						<div class="info-box">
							<i class="far fa-lg fa-fw me-10px fa-file"></i><span
								class="badge bg-yellow">${attach.tkAtName }</span>
						</div>
					</div>
					<br>
				</c:forEach>
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
											<div class="" id="tkRepliesDiv"></div>
											<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
												<div class="ps__thumb-x" tabindex="0"
													style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps__rail-y"
												style="top: 0px; height: 225px; right: 0px;">
												<div class="ps__thumb-y" tabindex="0"
													style="top: 0px; height: 134px;"></div>
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
												<label for="newReplyWriter">Writer</label> <input
													class="form-control" type="hidden" placeholder="USER ID"
													id="newReplyWriter" readonly value="${loginUser.empId }">

												<label for="newReplyText">Reply Text</label> <input
													type="text" class="form-control" name="message"
													id="newTkRpContent" placeholder="Enter your reply here.">

												<button class="btn btn-primary" type="button">
													<i class="fa fa-camera"></i>
												</button>
												<button class="btn btn-primary" type="button">
													<i class="fa fa-link"></i>
												</button>
												<button type="button" class="btn btn-primary"
													id="replyAddBtn" onclick="replyRegist_go();">ADD
													REPLY</button>
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

	<!-- Modal -->
	<div id="modifyModal" class="modal modal-default fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" style="display: none;"></h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" data-rno>
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="replyModBtn"
						onclick="replyModify_go();">Modify</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn"
						onclick="replyRemove_go();">DELETE</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<form role="form">
		<input type="hidden" name="tkCode" value="${tk.tkCode }" />
	</form>
<script>
window.onload = function(){
	var iconS = $('#scrapIcon');
	var iconL = $('#likeIcon');	
	var iconR = $('#reportIcon');	
	var scUrl = window.document.location.href;
	var empId = $('#empId').val();
	var bdCode = $('#tkCode').val();
	var tkCode = $('#tkCode').val();
	var dataScrap ={
			"scUrl":scUrl,
			"empId":empId	
	}
	var dataLike ={
			"tkCode":tkCode,
			"empId":empId,
			"bdCode":bdCode
	}
	var dataReport ={
			"tkCode":tkCode,
			"empId":empId,
			"bdCode":bdCode
	}	
	$.ajax({
		url:"<%=request.getContextPath()%>/kms/scrapCount",
		type:"post",
		data:JSON.stringify(dataScrap),	
		contentType:'application/json;charset=utf-8',
		success:function(dataScrap){
			console.log(dataScrap);
			if(dataScrap > 0){
				iconS.css("color", "red");
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});	

	$.ajax({
		url:"<%=request.getContextPath()%>/kms/likeCount",
		type:"post",
		data:JSON.stringify(dataLike),	
		contentType:'application/json;charset=utf-8',
		success:function(dataLike){
			console.log("추천?" + dataLike);
			if(dataLike > 0){
				iconL.css("color", "red");
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});	

	$.ajax({
		url:"<%=request.getContextPath()%>/kms/reportCount",
		type:"post",
		data:JSON.stringify(dataReport),	
		contentType:'application/json;charset=utf-8',
		success:function(dataReport){
			console.log(dataReport);
			if(dataReport > 0){
				iconR.css("color", "red");
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});	
}		

</script>
<script type="text/javascript">
	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		swal({
			title : '알림',
			text : '클립보드에 복사되었습니다.',
			icon : 'success',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-success me-1',
					closeModal : true
				}
			}
		});
	}

	function scrap() {
		var icon = $('#scrapIcon');
		var scTitle = $('#scTitle').val();
		var scUrl = window.document.location.href;
		var empId = $('#empId').val();


		
		
		if (icon.css("color") == "rgb(255, 0, 0)") {

			
			var data ={
					"scUrl":scUrl,
					"empId":empId	
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/deleteScrap",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){
					
					
					alert("허리아파");
					
				/* 	
					console.log(data + "취소1");
					if(data=="SUCCESS"){
					console.log(data + "취소2");
						icon.css("color", "black");
						swal({
							title : '알림',
							text : '스크랩을 취소하였습니다.',
							icon : 'success',
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-success me-1',
									closeModal : true
								}
							}
						});
					}  */
				
				},
				error:function(error){
					icon.css("color", "black");
					swal({
						title : '알림',
						text : '스크랩을 취소하였습니다.',
						icon : 'success',
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-success me-1',
								closeModal : true
							}
						}
					});
				}
			});
		} else {
			var data={
					"scTitle":scTitle,
					"scUrl":scUrl,
					"empId":empId	
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/InsertScrap",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){
					console.log(data);
					if(data=="SUCCESS"){
						icon.css("color", "red");
						swal({
							title : '알림',
							text : '해당 페이지가 스크랩 되었습니다.',
							icon : 'success',
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-success me-1',
									closeModal : true
								}
							}
						});
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	}
	function like() {
		var icon = $('#likeIcon');
		var empId = $('#empId').val();
		var tkCode = $('#tkCode').val();
		var bdCode = $('#tkCode').val();
		
		if (icon.css("color") == "rgb(255, 0, 0)") {
			var data ={
					"bdCode":bdCode,
					"empId":empId,	
					"tkCode":tkCode		
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/likeCancel",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){			

				
				},error:function(error){
					icon.css("color", "black");
					swal({
						title : '알림',
						text : '게시물 추천을 취소하였습니다',
						icon : 'success',
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-success me-1',
								closeModal : true
							}
						}
					});	
// 					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		} else {
			var data ={
					"bdCode":bdCode,
					"empId":empId,	
					"tkCode":tkCode	
					
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/like",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){
					console.log(data);
					if(data=="SUCCESS"){
						icon.css("color", "red");
						swal({
							title : '알림',
							text : '해당 게시물을 추천하였습니다.',
							icon : 'success',
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-success me-1',
									closeModal : true
								}
							}
						});
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	}
	function report() {
		var icon = $('#reportIcon');
		var empId = $('#empId').val();
		var tkCode = $('#tkCode').val();
		var bdCode = $('#tkCode').val();
		
		if (icon.css("color") == "rgb(255, 0, 0)") {
			var data ={
					"bdCode":bdCode,
					"empId":empId,	
					"tkCode":tkCode		
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/reportCancel",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){			

				
				},error:function(error){
					icon.css("color", "black");
					swal({
						title : '알림',
						text : '신고를 취소하였습니다',
						icon : 'success',
						buttons : {
							confirm : {
								text : '확인',
								value : true,
								visible : true,
								className : 'btn btn-success me-1',
								closeModal : true
							}
						}
					});	
				}
			});
		} else {
			var data ={
					"bdCode":bdCode,
					"empId":empId,	
					"tkCode":tkCode	
					
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/report",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){
					console.log(data);
					if(data=="SUCCESS"){
						icon.css("color", "red");
						swal({
							title : '알림',
							text : '해당 게시물을 신고하였습니다.',
							icon : 'success',
							buttons : {
								confirm : {
									text : '확인',
									value : true,
									visible : true,
									className : 'btn btn-success me-1',
									closeModal : true
								}
							}
						});
					}
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	}
</script>
<script>
	function submit_go(url, tkCode) {
		//alert(url);
		location.href = url + "?tkCode=" + tkCode;
	}

	$(function() {
		$('[data-toggle="tooltip"]').tooltip()
	})
	
</script>
</body>


