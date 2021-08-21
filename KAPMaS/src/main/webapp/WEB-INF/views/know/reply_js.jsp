<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<script type="text/x-handlebars-template"  id="reply-list-template" >
<ul class="forum-list forum-detail-list mb-4">
{{#each .}}
	<li class="byun">
		<!-- begin media -->
		<div class="media">
			<img src="<%=request.getContextPath()%>/emp/getPictureById/{{aWriter}}" alt="" class="rounded-3" />
			<span class="badge fw-bold fs-10px rounded-2 bg-red">{{empName}}
		</div>
		
		<!-- end media -->
		<!-- begin info-container -->
		<div class="info-container" style="padding-bottom:0px">
			<div class="post-content" style="margin-bottom:0px">
				<div class="message" style="min-height:60px;"id="{{aCode}}-aContent">{{aContent}}</div>
			<div class="post-time" style="float: left;">{{aRegdate}}</div>
			<div style="float: right;"><button type="button" class="btn btn-success me-1 mb-1" onclick="getPage2('{{aCode}}');">댓글보기</button></div>
			<div style="display : none; float: right;margin-right: 5px;" class="removeBtn"><a href="javascript:replyRemove_go('{{aCode}}');" class="btn btn-red">앤서삭제</a></div>
			<div style="display : none; float: right;margin-right: 5px;" class="modifyBtn"><a href="#modal-dialog" class="btn btn-primary"onclick="replyModifyModal_go('{{aCode}}');" data-bs-toggle="modal">앤서수정</a></div>
			<br><br>
<div class="chats ps ps--active-y" data-scrollbar="false"data-height="225px" data-init="true">
											<div id="tkRepliesDiv{{aCode}}">
											</div>
										</div>

		</div>
	</li>
{{/each}}	
</ul>
</script>
<script type="text/x-handlebars-template"  id="reply-pagination-template" >
<li class="paginate_button page-item">
	<a href="1" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-left'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{#if prev}}{{prevPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-left'></i>
	</a>
</li>
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}} ">
	<a href="{{this}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		{{this}}
	</a>
</li>
{{/each}}

<li class="paginate_button page-item ">
	<a href="{{#if next}}{{nextPageNum}}{{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-right'></i>
	</a>
</li>
<li class="paginate_button page-item">
	<a href="{{realEndPage}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
		<i class='fas fa-angle-double-right'></i>
	</a>
</li>	
</script>

<script type="text/x-handlebars-template"  id="reply-list-template2" >
{{#each .}}
<div class="asd">
	<div class="chats-item start">
		<div>
		<p class="name" style="float: left;">{{aRpWriter}}</p>
	 	
		{{#likes aRpCode}}
    	{{likes}}
    	{{/likes}}
		
		</div>		
		<div class="message" id="{{aRpCode}}-aRpCode">
			{{aRpContent}}
		</div>

	</div>
<div>

</div>

{{/each}}	
<div class="panel-footer">
										<form name="send_message_form" data-id="message-form">
											<div class="input-group card-footer">
												<label for="newReplyWriter"></label> <input
													class="form-control" type="hidden" placeholder="USER ID"
													id="newReplyWriter2" readonly value="${loginUser.empId }">

												<label for="newReplyText"></label> <input
													type="text" class="form-control" name="message"
													id="newTkRpContent2" placeholder="댓글을 입력해주세요">

												<button type="button" class="btn btn-primary"
													id="replyAddBtn" onclick="replyRegist_go2();">등록</button>
											</div>
										</form>
									</div>
									</div>
</script>

<script>

function printData2(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	console.log(replyArr);
	var html = template(replyArr);	
	$('.asd').remove();
	target.after(html);
}

function printData3(){
	$('.asd').remove();
}


function getPage2(aCode){	
	
	$("#aCode").val(aCode);
	
	
	var data = {
			"aCode":aCode
	} 
	
	$.ajax({
		url:"<%=request.getContextPath()%>/asReply/getList",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
		printData3();
		if(data.asReplyList==""){
			
			var data2 = {
			    	users: [
			            { aRpWriter: "", aRpCode: "", aRpContent: "" }
			        ]
			};
			
			printData2(data2.users,$('#tkRepliesDiv'+data.aacode+''),$('#reply-list-template2'));
		}else{
		printData2(data.asReplyList,$('#tkRepliesDiv'+data.asReplyList[0].aCode+''),$('#reply-list-template2'));
		}
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
		
	});
	
	
}

function replyRegist_go2(){
	var tkRpWriter=$('#newReplyWriter2').val();
	var tkRpContent=$('#newTkRpContent2').val();
	var khCode=$('input[name="tkCode"]').val()
	var aCode = $("#aCode").val();
	
	if(!tkRpWriter){
		swal({
			title : '알림',
			text : '다시 로그인 해주세요',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});			
		return;
	}else if(!tkRpContent){
		swal({
			title : '알림',
			text : '내용을 입력해주세요',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});			
		return;		
	}
	
	var data={
			"khCode":""+khCode+"",
			"aWriter":tkRpWriter,
			"aContent":tkRpContent,
			"aCode":aCode
	}
	
	$.ajax({
		url:"<%=request.getContextPath()%>/asReply/register",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			swal({
				title : '알림',
				text : '댓글이 등록되었습니다',
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
			printData3();
			getPage2(data);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
		
	});
}


function replyRemove_go2(aRpCode){
    swal({
        title : '확인',
        text : '삭제하시겠습니까?',
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
	 		var aCode = $("#aCode").val();
			var sendData={		
					"aRpCode":aRpCode,
					"aCode":aCode
			}
			
			$.ajax({
				url:"<%=request.getContextPath()%>/asReply/AsReplyRemove",
				type:"post",
				data:JSON.stringify(sendData),
				contentType:"application/json",
				success:function(data){
					swal({
						title : '알림',
						text : '삭제하였습니다.',
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
					printData3();
					getPage2(data);
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
     	}
	});
}
</script>

<script> //댓글 리스트
var replyPage=1;

window.setTimeout(function(){
	getPage("<%=request.getContextPath()%>/answer/${know.khCode}/"+replyPage);
	
	$('.pagination').on('click','li a',function(event){
		
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			getPage("<%=request.getContextPath()%>/answer/${know.khCode}/"+replyPage);
		}
		
		return false;
	});
	
	
}, 200);


Handlebars.registerHelper("likes", function (aRpCode) {
	  if (aRpCode != "") {
	    return '<a class="btn btn-danger btn-icon btn-circle btn-xs"  onclick="replyRemove_go2(&#39;'+aRpCode+'&#39;);" ><i class="fa fa-times"></i></a>';
	  } else {
	    return "";
	  }
});


Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars에 날짜출력함수 등록
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(tkRpWriter){
		var result="none";
		
		if(tkRpWriter == "${loginUser.empId}") result="visible";
		
		return result;						  
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});

function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.byun').remove();
	target.after(html);
}

function printData5(){
	$('.byun').remove();
}

function printPagination(pageMaker,target,templateObject){
	var rpArr = document.getElementsByClassName("chats-item start");
	var writerarr = $('.writerarr');
	var loginID = $('#loginID').val();
	
	for (var i = 0; i < $('.likearr2').length; i++){
		if(loginID == $('.writerarr')[i].value){
			$('.removeBtn')[i].style.display = "block";
			$('.modifyBtn')[i].style.display = "block";
		}
		
		var empIdArr = $('.writerarr')[i].value;
		var aCodeArr = $('.likearr2')[i].value;
		var iconS = $('.far fa-lg fa-fw me-10px fa-thumbs-up answer');
		var dataLike = {
				"aCode" : aCodeArr,
				"empId" : empIdArr
		}
		console.log("aCodeArr : " + aCodeArr);
		console.log("empIdArr : " + empIdArr);
		var target2 = document.getElementsByClassName("far fa-lg fa-fw me-10px fa-thumbs-up answer");
		$.ajax({
			url:"<%=request.getContextPath()%>/answer/likeCount",
			type:"post",
			data:JSON.stringify(dataLike),	
			contentType:'application/json;charset=utf-8',
			success:function(count){
				if(count > 0){
					target2[i].style.color = "red";
				}
			},
			error:function(error){
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});	
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	var pageNum = new Array(pageMaker.endPage-pageMaker.startPage+1);
	
	for(var i=0;i<pageMaker.endPage-pageMaker.startPage+1;i++){
		pageNum[i]=pageMaker.startPage+i;
	}	
	pageMaker.pageNum=pageNum;
	pageMaker.prevPageNum=pageMaker.startPage-1;
	pageMaker.nextPageNum=pageMaker.endPage+1;
	
	var template=Handlebars.compile(templateObject.html());	
	var html = template(pageMaker);	
	target.html("").html(html);
}


function getPage(pageInfo){	 
	$.getJSON(pageInfo,function(data){	
		
		printData5();
		printData(data.answerList,$('#tkRepliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
	

}

function replyRegist_go(){
	//alert("add reply btn");
	var tkRpWriter=$('#newReplyWriter').val();
	var tkRpContent=$('#newTkRpContent').val();
	var khCode=$('input[name="tkCode"]').val()
	
	if(!tkRpWriter){
		swal({
			title : '알림',
			text : '다시 로그인 해주세요.',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});
		return;
	}else if(!tkRpContent){
		swal({
			title : '알림',
			text : '내용을 입력해주세요',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});			
		return;	
		return;
	}
	
	var data={
			"khCode":""+khCode+"",
			"aWriter":tkRpWriter,
			"aContent":tkRpContent	
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/answer/register",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			
			swal({
				title : '알림',
				text : '앤서가 등록되었습니다.',
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
				replyPage=data; //페이지이동
				getPage("<%=request.getContextPath() %>/answer/"+khCode+"/"+replyPage); //리스트 출력
				$('#newReplyText').val("");		
				/* window.location.reload() */
		},
		error:function(data){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
		
	});
}

//댓글 수정
function replyModifyModal_go(tkRpCode){
	alert($('div#'+tkRpCode+'-aContent').text());
	$("#aCode").val(tkRpCode);
	$('#replytext').val($('div#'+tkRpCode+'-aContent').text());
}


function replyModify_go(){
	var aCode=$('#aCode').val();
	var aContent=$('#replytext').val();
	var khCode=$('input[name="tkCode"]').val();
	
	var sendData={		
			"aCode":aCode,
			"aContent":aContent,
			"khCode":khCode
	}

	$.ajax({
		url:"<%=request.getContextPath()%>/answer/AnswerModify",
		type:"post",
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			swal({
				title : '알림',
				text : '앤서가 수정되었습니다.',
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
			var result2=result.split(',');
			if(result2[0]=="SUCCESS"){
				replyPage=result2[1]; //페이지이동
				getPage("<%=request.getContextPath() %>/answer/"+result2[1]+"/"+1); //리스트 출력
				$('#newReplyText').val("");			
				$('#modal-dialog').modal('hide');
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
	
}

function replyRemove_go(aCode){
    swal({
        title : '확인',
        text : '해당 앤서를 삭제하시겠습니까?',
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
			var khCode=$('input[name="tkCode"]').val();
			
			var sendData={		
					"aCode":aCode,
					"khCode":khCode
			}
			
			
			$.ajax({
				url:"<%=request.getContextPath()%>/answer/AnswerRemove",
				type:"DELETE",
				type:"post",
				data:JSON.stringify(sendData),
				contentType:"application/json",
				success:function(result){
					
					swal({
						title : '알림',
						text : '삭제하였습니다.',
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
					var result2=result.split(',');
					if(result2[0]=="SUCCESS"){
						replyPage=result2[1]; //페이지이동
						getPage("<%=request.getContextPath() %>/answer/"+result2[1]+"/"+1); //리스트 출력
					}
	
				
				},
				error:function(error){
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
        }else{return;}
     });	
}
function like2(aCode){
//    	var target2 = document.getElementsByClassName("far fa-lg fa-fw me-10px fa-thumbs-up answer");
		
//    		var khCode=$('input[name="tkCode"]').val()
//    		var icon = $('#likeIcon2');
//    		var empId = $('#empId').val();
		
//    		if ($(this).css('color') == "red") {
//    			var data ={
//    					"aCode":aCode,
//    					"khCode":khCode,
//    					"empId":empId
//    			}
//    			$.ajax({
<%-- 				url:"<%=request.getContextPath()%>/answer/likeCancel", --%>
//    				type:"post",
//    				data:JSON.stringify(data),	
//    				contentType:'application/json;charset=utf-8',
//    				success:function(data){			
	
				
//    				},error:function(error){
//    					$(this).css("color", "black");
//    					swal({
//    						title : '알림',
//    						text : '게시물 추천을 취소하였습니다',
//    						icon : 'success',
//    						buttons : {
//    							confirm : {
//    								text : '확인',
//    								value : true,
//    								visible : true,
//    								className : 'btn btn-success me-1',
//    								closeModal : true
//    							}
//    						}
//    				     }).then(function(value) {
//    				         if (value == true) {
//    				 			printData3();
//    				      	}
//    				 	});
//    						AjaxErrorSecurityRedirectHandler(error.status);
//    				}
//    			});
//    		} else {
//    			var data ={
//    					"aCode":aCode,
//    					"khCode":khCode,
//    					"empId":empId
//    			}
			
//    			$.ajax({
<%--  				url:"<%=request.getContextPath()%>/answer/like",  --%>
//    				type:"post",
//    				data:JSON.stringify(data),	
//    				contentType:'application/json;charset=utf-8',
//    				success:function(data){
//    					if(data=="SUCCESS"){
						
//    						swal({
//    							title : '알림',
//    							text : '해당 게시물을 추천하였습니다.',
//    							icon : 'success',
//    							buttons : {
//    								confirm : {
//    									text : '확인',
//    									value : true,
//    									visible : true,
//    									className : 'btn btn-success me-1',
//    									closeModal : true
//    								}
//    							}
//    					     }).then(function(val) {
//    					         if (val == true) {
//    					        	 $(this).css("color", "red");
//    					 			printData3();
//    					      	}
//    					 	});
//    					}
//    				},
//    				error:function(error){
//    					AjaxErrorSecurityRedirectHandler(error.status);
//    				}
//    			});
//    		}
		
}
</script>










