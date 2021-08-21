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
			<span class="badge fw-bold fs-10px rounded-2 bg-red">{{aWriter}}
		</div>
		<!-- end media -->
		<!-- begin info-container -->
		<div class="info-container">
			<div class="post-content">
				<div class="message" id="{{aCode}}-aContent">
			{{aContent}}
		</div>
			</div>
			<div class="post-time">{{aRegdate}}</div>
				<div class="card-body">
							<!-- The time line -->
							<div class="">
								<!-- timeline time label -->

								<div class="panel panel-inverse" data-sortable-id="index-2" style="background-color:#f8f9fa;">
										<span class="badge bg-teal">${know.khReportcnt} 개의 댓글</span>
									<div class="panel-body">


										<div class="chats ps ps--active-y" data-scrollbar="false"
											data-height="225px" data-init="true">
											<div id="tkRepliesDiv">
											</div>
										</div>


										<div class='text-center'>
											<ul id="pagination2"
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
		</div>
	</li>
	<br>
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

function printData2(){
	$('.byun').remove();
}

function printPagination(pageMaker,target,templateObject){
	
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
		
		printData2();
		printData(data.answerList,$('#tkRepliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function replyRegist_go(){
	//alert("add reply btn");
	var tkRpWriter=$('#newReplyWriter').val();
	var tkRpContent=$('#newTkRpContent').val();
	var khCode=$('input[name="tkCode"]').val()
	
	if(!(tkRpWriter && tkRpContent)){
		alert("작성자 혹은 내용은 필수입니다.");
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
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				alert('댓글이 등록되었습니다.');
				replyPage=result[1]; //페이지이동
				getPage("<%=request.getContextPath() %>/answer/"+khCode+"/"+result[1]); //리스트 출력
				$('#newReplyText').val("");				
				/* window.location.reload() */
			}else{
				alert('댓글이 등록을 실패했습니다.');	
			}
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
		
	});
}

//댓글 수정
function replyModifyModal_go(tkRpCode){
	
	$('#tkRpContent').val($('div#'+tkRpCode+'-tkRpContent').text());
	$('.modal-title').text(tkRpCode);
}


function replyModify_go(){
	var tkRpCode=$('.modal-title').text();
	var tkRpContent=$('#replytext').val();
	
	var sendData={		
			tkRpContent:tkRpContent
	}
	

	$.ajax({
		url:"<%=request.getContextPath()%>/tkReplies/"+tkRpCode,
		type:"PUT",
		headers:{			
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			alert("수정되었습니다.");			
			getPage("<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+replyPage);
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
	
}

function replyRemove_go(){
	//alert("click remove btn");
	
	var rno=$('.modal-title').text();
	
	$.ajax({
		url:"<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+tkRpCode+"/"+replyPage,
		type:"DELETE",
		headers:{
			"X-HTTP-Override":"delete"
		},	
		success:function(page){
			alert("삭제되었습니다.");
			getPage("<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+page);
			replyPage=page;
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		},
		complete:function(){
			$('#modifyModal').modal('hide');
		}
	});
}
</script>










