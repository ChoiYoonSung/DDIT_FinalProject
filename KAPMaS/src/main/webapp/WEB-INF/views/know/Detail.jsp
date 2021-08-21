<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/forum/vendor.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet" />

<style>
 #writerImg{width:50px;height:50px;border-radius: 10%;}
 #writerImgDiv{text-align:center;}
 .popover {popover-border-color:rgba($black, .2);}
 
 .content{
 	margin: 0;
 	padding-top: 20px;
 }
</style>
<!-- bootstrap5 -->
<body style="background: white;">
<input type="hidden" value="${loginUser.empId}" id="loginID">
	<div style="max-width: 1000px; min-width: 800px; margin: 0 auto; min-height: 900px;">
		<section class="content container">
			<h2 style="text-align: center">${know.khTitle}</h2>
			<input type="hidden" id="scTitle" value="${know.khTitle}">
			<input type="hidden" id="empId" value="${loginUser.empId }">
			<input type="hidden" id="bdCode" name="tkCode" value="${know.khCode }">
			<input type="hidden" id="tkWriter" value="${know.empId }">
			
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
							onclick="submit_go('knowModifyForm.do','${know.khCode }');">수정</button>
						<button type="button" id="removeBtn" class="btn btn-danger"
							onclick="submit_go2('knowDisable.do','${know.khCode }');">삭제</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="CloseWindow();">닫기</button>
					</div> 
				</div>
			</div>
			<div>
				<p style="float: right">작성일 : ${know.khRegdate}</p>
				<p id="qtipInfo"class="maninfo" style="float: right; margin-right: 10px;">작성자 : ${know.empName }(${know.empId })</p>
			</div>


			<br> <br> <br>
			<div style="padding: 10px; min-height: 200px; font-size: 15px;background: aliceblue; border-radius: 7px;">
				${know.khContent }</div>
		</section>

 		<section class="content container">
 		<div style="float:right;" >
								<ul style="list-style:none;">
									<c:forEach var="Keyword" items="${KeywordArr}">
										<li onclick="search_go('${Keyword }')"style="float:left;"><a href="#">#${Keyword }</a>&nbsp; &nbsp;</li>
									</c:forEach>
								</ul>
						</div><br>
			<!-- reply component start -->
			<div class="row">
				<div class="col-md-12">
					<div class="card card-info">
					<br>
					
						<div class="card-body">
							<!-- The time line -->
							<div>
								<!-- timeline time label -->

								<div class="panel panel-inverse" data-sortable-id="index-2" id="answerDiv">
										<h4 class="panel-title">앤서 목록</h4>
										<span class="badge bg-teal">${know.answercnt} 개의 앤서</span>
									<div class="panel-body">


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
													id="newTkRpContent" placeholder="앤서를 입력해주세요">

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

<div class="modal fade" id="modal-dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">앤서 수정</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
      </div>
      <div class="modal-body">
       <p><input type="text" id="replytext" class="form-control" value=""></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" id="replyModBtn"
						onclick="replyModify_go();">수정</button>
					<!-- <button type="button" class="btn btn-danger" id="replyDelBtn"
						onclick="replyRemove_go();">DELETE</button> -->
      </div>
    </div>
  </div>
</div>
	<form role="form">
		<input type="hidden" id="khCode" name="khCode" value="${know.khCode }" />
	</form>
	<form id="arrForm" action="searchResultWindow.do" method="post">
		<input type="hidden" id="arrFormInput" value="" name="arrFromInput">
	</form>			
	
		<input type="hidden" id="aCode" name="aCode" value="" />
	<!-- 클립보드 알림 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<!-- popper -->
<script	src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	
<script>

window.onload = function(){


	if( $('#tkWriter').val() != $('#empId').val()){
		$('#modifyBtn').remove();
		$('#removeBtn').remove();
		
		
		  $('#qtipInfo').popover({
			  title: "<h5>작성자 정보</h5>", 
			  content: '<div id="writerImgDiv"><img class="img-circle" id="writerImg"src="<%=request.getContextPath()%>/emp/getPictureById/${tk.empId}"></div><hr><div><span>이름:${emp.empName}</span><br><span>부서명:${dep.depName}</span></div>', 
			  html: true, 
			  placement: "left"}); 
		
	}
	
	$('#writerImg').attr("class", "img-circle");

	var iconS = $('#scrapIcon');
	var iconL = $('#likeIcon');	
	var iconR = $('#reportIcon');	
	var scUrl = window.document.location.href;
	var empId = $('#empId').val();
	var bdCode = $('#bdCode').val();
	var dataScrap ={
			"scUrl":scUrl,
			"empId":empId	
	}
	var dataLike ={
			"empId":empId,
			"bdCode":bdCode
	}
	var dataReport ={
			"empId":empId,
			"bdCode":bdCode
	}	
	$.ajax({
		url:"<%=request.getContextPath()%>/kms/scrapCount",
		type:"post",
		data:JSON.stringify(dataScrap),	
		contentType:'application/json;charset=utf-8',
		success:function(dataScrap){
			if(dataScrap > 0){
				iconS.css("color", "red");
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});	

	$.ajax({
		url:"<%=request.getContextPath()%>/kms/likeCountKnow",
		type:"post",
		data:JSON.stringify(dataLike),	
		contentType:'application/json;charset=utf-8',
		success:function(dataLike){
			if(dataLike > 0){
				iconL.css("color", "red");
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});	

	$.ajax({
		url:"<%=request.getContextPath()%>/kms/reportCountKnow",
		type:"post",
		data:JSON.stringify(dataReport),	
		contentType:'application/json;charset=utf-8',
		success:function(dataReport){
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
		var bdCode = $('#bdCode').val();
		
		if (icon.css("color") == "rgb(255, 0, 0)") {
			var data ={
					"bdCode":bdCode,
					"empId":empId	
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/likeCancelKnow",
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
					"empId":empId	
					
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/likeKnow",
				type:"post",
				data:JSON.stringify(data),
				contentType:'application/json;charset=utf-8',
				success:function(data){
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
				},
				error:function(request,status,error){
					swal({
						title : '에러',
						text : "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error,
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
		}
	}
	function report() {
		var icon = $('#reportIcon');
		var empId = $('#empId').val();
		var bdCode = $('#bdCode').val();
		
		if (icon.css("color") == "rgb(255, 0, 0)") {
			var data ={
					"bdCode":bdCode,
					"empId":empId	
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/reportCancelKnow",
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
					"empId":empId	
					
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/reportKnow",
				type:"post",
				data:JSON.stringify(data),	
				contentType:'application/json;charset=utf-8',
				success:function(data){
				},
				error:function(error){
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
// 					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	}
</script>
<script>
	function submit_go(url, khCode) {
		location.href = url + "?khCode=" + khCode;
	}
	
	function submit_go2(url, khCode) {
		
        swal({
            title : '삭제',
            text : '해당 노하우를 휴지통에 보냅니다\n삭제한 노하우는 휴지통에서 복구할 수 있습니다.',
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
				location.href = url + "?khCode=" + khCode;
            }
         });
		
		}
	
	function search_go(obj){
		
		$('#arrFormInput').val(obj);
		
		document.getElementById("arrForm").submit();
		
	}	
	
</script>
<%@ include file="./reply_js.jsp"%>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkDetail.jsp"%>
</body>























