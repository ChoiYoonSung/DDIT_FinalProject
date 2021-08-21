<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/color_admin/template/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
<style>
 #writerImg{width:50px;height:50px;border-radius: 10%;}
 #writerImgDiv{text-align:center;}
 .popover {popover-border-color:rgba($black, .2);}
 table{
	display:flex;
	display: -webkit-box;
	display: -ms-flexbox;
	overflow-x: auto;
	overflow-y: hidden;

	}
tbody{display:flex}
th,td{display:block;}
#icons {
	display: flex;
	justify-content: space-between;
	list-style: none;
    margin: 0px;
    padding: 0px;
}
</style>
<!-- bootstrap5 -->
<body style="padding: 40px; background: white;">
	<div style="max-width: 1000px; min-width: 500px; margin: 0 auto;">
		<section >
			<h2 style="text-align: center">${prb.pName}</h2>
			<input type="hidden" id="scTitle" value="${prb.prTitle}">
			<input type="hidden" id="empId" value="${loginUser.empId }">
			<input type="hidden" id="prCode" value="${prb.prCode }">
			<input type="hidden" id="prWriter" value="${prb.empId }">
			
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
				<div class="row" style="margin-bottom: 20px">
					<div class="col-3" >
						<ul id="icons">
							<li>
								<a onclick="clip(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-clipboard"
									data-toggle="tooltip" data-placement="top" title="클립보드에 복사">
								</i>
								</a>
							</li>
							<li>
								<a onclick="scrap(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-save" data-toggle="tooltip"
									data-placement="top" title="스크랩" id="scrapIcon"
									style="color: black;"></i>
								</a>
							</li>
							<li>
								<a onclick="like(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-thumbs-up" id="likeIcon"
									style="color: black;" data-toggle="tooltip"
									data-placement="top" title="추천"></i>
								</a>							
							</li>
						</ul>

					</div>
					<div class="col-3"></div>
					<div class="col-6"
						style="margin-right: 0; float: right; text-align: right;">
						<button type="button" id="removeBtn" class="btn btn-danger" style="display:none;"
							onclick="disable_go();">삭제</button>
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="javascript:window.close();">닫기</button>
					</div> 
				</div>
			</div>
			<div>
			</div>

<%-- 
			<br> <br> <br>
			<div style="min-height: 300px; font-size: 20px; margin: 0 auto;">
				<table>
					<thead>
						<tr>
							<th>프로젝트 명  &nbsp;&nbsp;</th>
							<th>주제  &nbsp;&nbsp;</th>
							<th>요약  &nbsp;&nbsp;</th>
							<th>내용  &nbsp;&nbsp;</th>
							<th>첨부파일  &nbsp;&nbsp;</th>
						</tr>
					</thead>
					<tbody>		
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${prb.pName}</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${prb.pTitle}</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${prb.pSummary}</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;${prb.pContent}</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="#">
								<span style="cursor: pointer;"
								 onclick="location.href='<%=request.getContextPath()%>/kms/getPrbFile.do?savedPath=${prb.prAttachPath}&fileName=${fileName}';">
									${fileName}
								</span></a>
							</td>
						</tr>
					</tbody>
				</table> --%>
				
				<div class="mb-3">
				<label class="form-label" for="proName">프로젝트명</label>
				<input class="form-control" type="text" id="proName" name="pName" readonly value="${prb.pName}">
				</div><%-- 
				<div class="mb-3">
				<label class="form-label" for="proPeriod">제작 기간</label>
				<input class="form-control" type="text" id="proPeriod" name="proPeriod" readonly value="${prb.pStartdate.split(' ')[0]} ~ ${prb.pEnddate.split(' ')[0]}" >
				</div> --%>
				<div class="mb-3">
				<label class="form-label" for="producer">대표자</label>
				<input class="form-control" type="text" id="producer" name="producer" readonly value="${prb.empName }" >
				</div>
				<div class="mb-3">
				<label class="form-label" for="content">프로젝트 개요</label>
				<input class="form-control" type="text" id="content" name="content" readonly value="${prb.pSummary}">
				</div>
				<div class="mb-3">
				<label class="form-label" for="content">프로젝트 내용</label>
				<input class="form-control" type="text" readonly value="${prb.pContent}">
				</div>
				<div class="mb-3">
				<label class="form-label" for="content">프로젝트 이관일</label>
				<input class="form-control" type="text" readonly value="${prb.prRegdate}">
				</div>
				<div class="mb-3">
				<h5 style="display:inline;line-height:40px;">프로젝트 자료 : </h5>
				&nbsp;&nbsp;
				<a href="#">
				<span style="cursor: pointer;"
				 onclick="location.href='<%=request.getContextPath()%>/kms/getPrbFile.do?savedPath=${prb.prAttachPath}&fileName=${fileName}';">
					${fileName}
				</span>
				</a>
				</div>
			</div>
		</section>
	</div>
	<form role="form">
		<input type="hidden" name="prCode" value="${prb.prCode }" />
	</form>
	<form id="arrForm" action="searchResultWindow.do" method="post">
		<input type="hidden" id="arrFormInput" value="" name="arrFromInput">
	</form>		

	
<script>
window.onload = function(){

	if( $('#prWriter').val() == $('#empId').val()){
		$('#removeBtn').css("display","inline");
	}
	
	$('#qtipInfo').popover({
		title: "<h5>작성자 정보</h5>", 
		content: '<div id="writerImgDiv"><img class="img-circle" id="writerImg"src="<%=request.getContextPath()%>/emp/getPictureById/${prb.empId}"></div><hr><div><span>이름:${emp.empName}</span><br><span>부서명:${dep.depName}</span></div>', 
		html: true, 
		placement: "left"
	}); 
	
	$('#writerImg').attr("class", "img-circle");

	var iconS = $('#scrapIcon');
	var iconL = $('#likeIcon');	
	var scUrl = window.document.location.href;
	var empId = $('#empId').val();
	var bdCode = $('#prCode').val();
	var prCode = $('#prCode').val();
	var dataScrap ={
			"scUrl":scUrl,
			"empId":empId	
	}
	var dataLike ={
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
		url:"<%=request.getContextPath()%>/kms/likeCountPrb",
		type:"post",
		data:JSON.stringify(dataLike),	
		contentType:'application/json;charset=utf-8',
		success:function(count){
			console.log("count : " + count);
			if(count > 0){
				iconL.css("color", "red");
			}	
		},
		error:function(error){
			console.log("error : " + error);
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
		var bdCode = $('#prCode').val();
		var prCode = $('#prCode').val();
		
		if (icon.css("color") == "rgb(255, 0, 0)") {
			var data ={
					"bdCode":bdCode,
					"empId":empId,	
					"prCode":prCode		
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/likeCancelPrb",
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
					"prCode":prCode	
					
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/kms/likePrb",
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
</script>
<script>
	function disable_go(){
        swal({
            title : '자료실 글 수정',
            text : '보고서를 비활성화 하시겠습니까?',
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
				submit_go('prbDisable.do',$('#prCode').val());
            }else{
            	return;
            }
         });		
	}
	function submit_go(url, prCode) {
		location.href = url + "?prCode=" + prCode;
	}
</script>
</body>


