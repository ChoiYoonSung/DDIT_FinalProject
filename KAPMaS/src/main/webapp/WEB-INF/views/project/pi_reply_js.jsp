<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="rp">
	<div class="chats-item start">
		<span class="date-time">{{prettifyDate piRpRegdate}}</span> 
		<a href="javascript:;" class="name"><strong style="display:none;">{{piRpCode}}</strong>{{empId}}</a> 
		<a href="javascript:;" class="image"><img alt="" src="<%=request.getContextPath()%>/emp/getPictureById/{{empId}}" style="width:60px;height:60px;"></a>
		<div class="message" id="{{piRpCode}}-piRpContent">
			{{piRpContent}}
		</div>
	</div>
<div>
{{/each}}	
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
	getPage("<%=request.getContextPath()%>/piReplies/${pi.piCode}/"+replyPage);
	
	$('.pagination').on('click','li a',function(event){
		
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			getPage("<%=request.getContextPath()%>/piReplies/${pi.piCode}/"+replyPage);
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
	"VisibleByLoginCheck":function(empId){
		var result="none";
		
		if(empId == "${loginUser.empId}") result="visible";
		
		return result;						  
	},
	"signActive":function(pageNum){
		if(pageNum == replyPage) return 'active';
	}
});

function printData(replyArr,target,templateObject){
	var template=Handlebars.compile(templateObject.html());
	var html = template(replyArr);	
	$('.rp').remove();
	target.after(html);
}

function printData2(){
	$('.rp').remove();
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
		printData(data.replyList,$('#piRepliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
}

function replyRegist_go(){
	//alert("add reply btn");
	var empId=$('#newReplyWriter').val();
	var piRpContent=$('#newPiRpContent').val();
	var piCode=$('input[name="piCode"]').val()
	
	if(!(empId && piRpContent)){
		swal({
			title: '이슈&리스크 댓글',
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
	
	var data={
			"piCode":""+piCode+"",
			"empId":empId,
			"piRpContent":piRpContent	
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/piReplies/register",
		type:"post",
		data:JSON.stringify(data),
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				swal({
					title: '성공',
					text: '댓글이 등록되었습니다.',
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
				});
				replyPage=result[1]; //페이지이동
				getPage("<%=request.getContextPath() %>/piReplies/"+piCode+"/"+result[1]); //리스트 출력
				$('#newReplyText').val("");				
				/* window.location.reload() */
			}else{
				swal({
					title: '등록 실패',
					text: '댓글이 등록을 실패했습니다.',
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
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
		
	});
}

//댓글 수정
function replyModifyModal_go(piRpCode){
	//alert("click modify btn");
	//alert(rno);
	//alert("rno:"+rno+"\nreplyer:"+replyer+"\nreplytext:"+replytext);
	
	$('#piRpContent').val($('div#'+piRpCode+'-piRpContent').text());
	$('.modal-title').text(piRpCode);
}


function replyModify_go(){
	var piRpCode=$('.modal-title').text();
	var piRpContent=$('#replytext').val();
	
	var sendData={		
			piRpContent:piRpContent
	}
	

	$.ajax({
		url:"<%=request.getContextPath()%>/piReplies/"+piRpCode,
		type:"PUT",
		headers:{			
			"X-HTTP-Method-Override":"PUT"
		},
		data:JSON.stringify(sendData),
		contentType:"application/json",
		success:function(result){
			swal({
				title: '성공',
				text: '수정되었습니다.',
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
				getPage("<%=request.getContextPath()%>/piReplies/${pi.piCode}/"+replyPage);
			});
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
		url:"<%=request.getContextPath()%>/piReplies/${pi.piCode}/"+piRpCode+"/"+replyPage,
		type:"DELETE",
		headers:{
			"X-HTTP-Override":"delete"
		},	
		success:function(page){
			swal({
				title: '성공',
				text: '삭제되었습니다.',
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
				getPage("<%=request.getContextPath()%>/piReplies/${pi.piCode}/"+page);
				replyPage=page;
			});
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










