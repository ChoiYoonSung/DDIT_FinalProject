<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<body>
<input type="hidden" value="${loginUser.empId}" id="loginId">
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="reply-list-template" >
{{#each .}}
<div class="byun">
	<div class="chats-item start">
		<span class="date-time">{{prettifyDate tkRpRegdate}}</span> 
		<a href="javascript:;" class="name"><strong style="display:none;">{{tkRpCode}}</strong>&nbsp;&nbsp;&nbsp;{{empName}}</a> 
		<a href="javascript:;" class="image"><img alt="" src="<%=request.getContextPath()%>/emp/getPictureById/{{tkRpWriter}}" style="width:60px;height:60px;"></a>
		<div class="message" id="{{tkRpCode}}-tkRpContent">
			{{tkRpContent}}
		</div>
		<input type="hidden" class="modal-title" value="{{tkRpCode}}" id="{{tkRpCode}}">
		<input type="hidden" class="tkRpWriter" value="{{tkRpWriter}}" id="{{tkRpWriter}}">
		<input type="hidden" name="tkRpWriter" value="{{tkRpWriter}}">
	</div>
<div>
<hr>
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


<script> //?????? ?????????
var replyPage=1;

window.setTimeout(function(){
	getPage("<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+replyPage);
	
	$('.pagination').on('click','li a',function(event){
		
		if($(this).attr("href")) {
			replyPage = $(this).attr("href");
			getPage("<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+replyPage);
		}
		
		return false;
	});
	
	
}, 200);

Handlebars.registerHelper({
	"prettifyDate":function(timeValue){ //Handlbars??? ?????????????????? ??????
		var dateObj=new Date(timeValue);
		var year=dateObj.getFullYear();
		var month=dateObj.getMonth()+1;
		var date=dateObj.getDate();
		return year+"/"+month+"/"+date;
	},
	"VisibleByLoginCheck":function(tkRpWriter){
		var result="none";
		
		if(tkRpWriter == "${loginUser.empId}"){
			result="visible";
		}
		
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
	var rpArr = document.getElementsByClassName("chats-item start");
	if(rpArr.length == 0){
		return;
	}else{
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
		var removeIcon = '<div class="removeIcon" style="float:right; margin:5px;"><a href="javascript:replyRemove_go();"><i class="fas fa-lg fa-fw me-10px fa-trash-alt"></i></a></div>';
		
		for(var i = 0; i <rpArr.length; i++){
			if($('.tkRpWriter')[i].value == $('#loginID').val()){
				 let div = document.createElement('div');
				 div.innerHTML = removeIcon;
				 rpArr[i].appendChild(div);
				
			}
		}
	}
	
}


function getPage(pageInfo){	 
	$.getJSON(pageInfo,function(data){	
		printData2();
		printData(data.replyList,$('#tkRepliesDiv'),$('#reply-list-template'));
		printPagination(data.pageMaker,$('ul#pagination'),$('#reply-pagination-template'));
	});
	
}

function replyRegist_go(){
	var tkRpWriter=$('#newReplyWriter').val();
	var tkRpContent=$('#newTkRpContent').val();
	var tkCode=$('input[name="tkCode"]').val()
	
	if(!tkRpWriter){
		swal({
			title : '??????',
			text : '?????? ????????? ????????????.',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '??????',
					value : true,
					visible : true,
					className : 'btn btn-warning me-1',
					closeModal : true
				}
			}
		});
		return;
	}
	if(!tkRpContent){
		swal({
			title : '??????',
			text : '????????? ??????????????????.',
			icon : 'warning',
			buttons : {
				confirm : {
					text : '??????',
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
			"tkCode":""+tkCode+"",
			"tkRpWriter":tkRpWriter,
			"tkRpContent":tkRpContent	
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/tkReplies/register",
		type:"post",
		data:JSON.stringify(data),	
		contentType:'application/json',
		success:function(data){
			var result=data.split(',');
			if(result[0]=="SUCCESS"){
				swal({
					title : '??????',
					text : '????????? ?????????????????????.',
					icon : 'success',
					buttons : {
						confirm : {
							text : '??????',
							value : true,
							visible : true,
							className : 'btn btn-success me-1',
							closeModal : true
						}
					}
				}).then(function(val) {
			        if (val == true) {
						replyPage=result[1]; //???????????????
						getPage("<%=request.getContextPath() %>/tkReplies/"+tkCode+"/"+result[1]); //????????? ??????
						$('#newReplyText').val("");				
						window.location.reload() 
			     	}
				});
			}else{
				swal({
					title : '??????',
					text : '????????? ??????????????? ???????????? ???????????????.',
					icon : 'error',
					buttons : {
						confirm : {
							text : '??????',
							value : true,
							visible : true,
							className : 'btn btn-danger me-1',
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


function replyRemove_go(){
    swal({
        title : '??????',
        text : '?????????????????????????\n????????? ????????? ????????? ??? ????????????.',
        icon : 'warning', 
        buttons : {
           cancel : {
              text : '??????',
              value : false,
              visible : true,
              className : 'btn btn-warning',
              closeModal : true,
           },
           confirm : {
              text : '??????',
              value : true,
              visible : true,
              className : 'btn btn-warning',
              closeModal : true
           }
        }
     }).then(function(val) {
        if (val != true) {
			return;
			

     	}else if(val == true){
    		var tkRpCode=$('.modal-title').val();
    		
    		$.ajax({
    			url:"<%=request.getContextPath()%>/tkReplies/${tk.tkCode}/"+tkRpCode+"/"+replyPage,
    			type:"DELETE",
    			headers:{
    				"X-HTTP-Override":"delete"
    			},	
    			success:function(page){
    			    swal({
    			        title : '??????',
    			        text : '?????????????????????.',
    			        icon : 'success', 
    			        buttons : {
    			           confirm : {
    			              text : '??????',
    			              value : true,
    			              visible : true,
    			              className : 'btn btn-success',
    			              closeModal : true
    			           }
    			        }
    			     });
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
	});	
}
	 
	
</script>










