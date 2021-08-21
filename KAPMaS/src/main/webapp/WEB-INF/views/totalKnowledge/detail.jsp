<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
 #writerImg{width:50px;height:50px;border-radius: 10%;}
 #writerImgDiv{text-align:center;}
 .popover {popover-border-color:rgba($black, .2);}
</style>
<!-- bootstrap5 -->
<body style="padding: 40px; background: white;">
	<div style="max-width: 1000px; min-width: 800px; margin: 0 auto; min-height: 800px;">
		<section class="content container">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">	</div>
				<div class="col-3" style="text-align: right;">
				</div>
			</div>
			<br>
			<div class="row" style="text-align: center">
				<div class="col-1"></div>
				<div class="col-10">
					<h2 >${tk.tkTitle}</h2>
				</div>
				<div class="col-1"></div>
			</div>
			<input type="hidden" id="scTitle" value="${tk.tkTitle}">
			<input type="hidden" id="empId" value="${loginUser.empId }">
			<input type="hidden" id="tkCode" value="${tk.tkCode }">
			<input type="hidden" id="tkWriter" value="${tk.empId }">
			
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
									class="fas fa-lg fa-fw me-10px fa-bullhorn" id="reportIcon"
									style="color: black;" data-toggle="tooltip"
									data-placement="top" title="신고" style="color:black"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-7"></div>
					<div class="col-md-3" style="margin-right: 0; float: right; text-align: right;">
					<button type="button" id="modifyBtn" class="btn btn-warning"
							onclick="submit_go('modifyForm.do','${tk.tkCode }');">수정</button>
						<button type="button" id="removeBtn" class="btn btn-danger"
							onclick="submit_go('disable.do','${tk.tkCode }');">삭제</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="javascript:window.close();">닫기</button>
					</div> 
				</div>
			</div>
			<div>
				<p style="float: right">작성일 : ${tk.tkRegdate}</p>
				<p id="qtipInfo"class="maninfo" style="float: right; margin-right: 10px;">작성자 : ${tk.empName }(${tk.empId })</p>
			</div>


			<br> <br> <br>
			<div style="padding: 10px; min-height: 200px; font-size: 15px;background: aliceblue; border-radius: 7px;">
				${tk.tkContent }</div>
			<div style="padding: 10px;" class="row">
				<c:if test="${!empty tk.attachList }">
					<span class="col-2">첨부파일 다운로드</span>
				</c:if>
				<c:if test="${empty tk.attachList }">
					<div class="col-2"></div>
				</c:if>
				<div class="col-10">
				<div style="float:right;">
				<ul style="list-style:none;">
					<c:forEach var="tkKeyword" items="${tkKeywordArr}">
						<li onclick="search_go('${tkKeyword }')"style="float:left;"><a href="#">#${tkKeyword }</a>&nbsp; &nbsp;</li>
					</c:forEach>
				</ul>
				</div>
				</div>
				<hr>
				<c:forEach items="${tk.attachList }" var="attach">
					<div class="col-2">
						<div class="info-box">
							<span class="badge bg-yellow" onclick="location.href='<%=request.getContextPath()%>/kms/getTkFile.do?tkAtNo=${attach.tkAtNo }';"  style="cursor: pointer;">
							${attach.tkAtName }
							</span>
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
											<div id="tkRepliesDiv">
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
												<label for="newReplyWriter"></label> <input
													class="form-control" type="hidden" placeholder="USER ID"
													id="newReplyWriter" readonly value="${loginUser.empId }">

												<label for="newReplyText"></label> <input
													type="text" class="form-control" name="message"
													id="newTkRpContent" placeholder="댓글을 입력해주세요.">

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
	</div>

	<form role="form">
		<input type="hidden" name="tkCode" value="${tk.tkCode }" />
	</form>
	<form id="arrForm" action="searchResultWindow.do" method="post">
		<input type="hidden" id="arrFormInput" value="" name="arrFromInput">
	</form>		
	
	<!-- 클립보드 알림 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<!-- popper -->
<script	src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	
<script>
window.onload = function(){
	 $('#qtipInfo').popover({
		title: "<h5>작성자 정보</h5>", 
		content: '<div id="writerImgDiv"><img class="img-circle" id="writerImg"src="<%=request.getContextPath()%>/emp/getPictureById/${tk.empId}"></div><hr><div><span>이름:${emp.empName}</span><br><span>부서명:${dep.depName}</span></div>', 
		html: true, 
		placement: "left"
		
	 }); 

	if( $('#tkWriter').val() != $('#empId').val()){
		$('#modifyBtn').remove();
		$('#removeBtn').remove();
	}
	
	
	$('#writerImg').attr("class", "img-circle");

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
	
	console.log("배열길이 :" + document.getElementsByClassName("chats-item start").length);
	
	
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
		if(url == "modifyForm.do"){
		    swal({
		        title : '확인',
		        text : '수정 페이지로 이동하시겠습니까?',
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
		              className : 'btn btn-warning',
		              closeModal : true
		           }
		        }
		     }).then(function(val) {
		        if (val == true) {
					location.href = url + "?tkCode=" + tkCode;
		     	}
			});
		}else if(url == "disable.do"){
		    swal({
		        title : '확인',
		        text : '삭제하시겠습니까?\n삭제한 게시물은 휴지통에서 복구할 수 있습니다.',
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
		              className : 'btn btn-warning',
		              closeModal : true
		           }
		        }
		     }).then(function(val) {
		        if (val == true) {
					location.href = url + "?tkCode=" + tkCode;
		     	}
			});			
		}else{
			swal({
				title : '알림',
				text : '비정상적인 접근경로입니다.',
				icon : 'error',
				buttons : {
					confirm : {
						text : '확인',
						value : true,
						visible : true,
						className : 'btn btn-danger me-1',
						closeModal : true
					}
				}
			});	
		}
	}
	
	function search_go(obj){
		
		$('#arrFormInput').val(obj);
		
		document.getElementById("arrForm").submit();
		
	}

	
	
	
</script>

<%@ include file="./reply_js.jsp"%>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkDetail.jsp"%>
</body>


