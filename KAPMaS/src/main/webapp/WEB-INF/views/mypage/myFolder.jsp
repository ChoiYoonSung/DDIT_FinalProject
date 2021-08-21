<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<head>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" />
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">


	#mo:hover{

	font-size: xx-large

	}

 #my_modal {
        display: none;
        width: 300px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }

    #my_modal #modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
         border: 0.2px solid green;
    }
 #my_modal #modal_close2_btn {
        position: absolute;
        right: 10px;
         border: 0.2px solid green;
    }
</style>

</head>

<body>
<div  style="height: 480px;">
			<div class="project-wrapper" style="width: 100%;  height: 95%;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="table-responsive">

<div class = "container" style="width: 100%;padding: 0px;">
		<div style="width: 100%; height: 50px; background-color: #8081d8;" onclick="location.href='<%=request.getContextPath() %>/mypage/mydocument'">
				<i id="mo"  style="float: left;line-height: 9px; padding-left: 15px;" class="icon-action-undo h3 d-block"></i>
				<p style="color: white; line-height: 50px;float: left; padding-left: 10px;">"${name }"의 폴더</p>
			</div>
		<br>
			
	<%--  <div id="mo" onclick="location.href='<%=request.getContextPath() %>/mypage/mydocument'">
	 	<i style="float: left;" class="icon-action-undo h3 d-block"></i><p style="float: left; line-height: 70px;">돌아가기</p>
   	</div>	
   	 --%>
   	
   		<c:forEach items="${docList }" var="doc" >
   		<div style="padding-left: 10px; padding-right: 10px;">
   		<div style="float: left; width: 40px; height: 40px;">
   		<img alt="" width="40px" height="40px" src="<%=request.getContextPath() %>/resources/images/ex.png" onclick="location.href='<%=request.getContextPath() %>/mypage/documentDown?docCode=${doc.docCode}'">
   		</div>
   		<div style="float: left;line-height: 50px;  padding-left:  5px;">
   		
   		<c:set var="TextValue" value="${doc.docName }"/>
   		  <c:set var = "length" value = "${fn:length(TextValue)}"/>
   		${fn:substring(TextValue,18,length) }
   		
   		</div> 
   		<div style="float: right;line-height: 50px;"><a onclick="deleteD('${doc.docCode }');"><i class="far fa-lg fa-fw me-10px fa-trash-alt"></i></a></div>
   		<div class="popup_open_btn" onclick="insert('${doc.docCode }');" style="float: right;line-height: 50px;"><i class="far fa-lg fa-fw me-10px fa-folder-open"></i></div>
   		<div onclick="location.href='<%=request.getContextPath() %>/mypage/documentDown?docCode=${doc.docCode}'" style="float: right;line-height: 50px;"><i class="fas fa-lg fa-fw me-10px fa-cloud-download-alt"></i></div>
   		<br><br>
   		<hr>
   		</div>
   		</c:forEach>
   		
   		
</div>
</div>
</div>
</div>
</div>
<div id="my_modal">
<h5>이동할 폴더를 선택하시오</h5>
    <div>
		<select style="width: 120px; float: left;" name="folder" id="folder"
			class="form-select">
			<option value="전체">-폴더 선택-</option>
			<option value="전체">전체</option>
			<c:forEach items="${dfList }" var="df">
				<option value="${df.fName }">${df.fName }</option>
			</c:forEach>
		</select>
	</div>
    <a id="modal_close_btn" class="btn btn-danger btn-icon btn-circle btn-xs"><i class="fa fa-times"></i></a>
     <a id="modal_close2_btn"  class="btn btn-success btn-icon btn-circle btn-xs" onclick="change('${name}');"><i class="fa fa-redo"></i></a>
</div>

<input type="text" id="qwe" hidden="" value="">


<script type="text/javascript">

function deleteD(code){
	/* 
	if(confirm("파일을 삭제 하시겠습니까?")){
		
		
	}else{
		return;
	} */
	
	   swal({
           title: '파일 삭제',
           text: '파일을 삭제 하시겠습니까?',
           icon: 'warning', // primary success warning danger
           buttons: {
               cancel: {
                   text: '취소',
                   value: false,
                   visible: true,
                   className: 'btn btn-default',
                   closeModal: true,
                 },
                 confirm: {
                   text: '확인',
                   value: true,
                   visible: true,
                   className: 'btn btn-primary',
                   closeModal: true
                 }
           }
         }).then(function(val){
            if(val == true){
            	var data={
        				"code":code
        		}
        		
        		$.ajax({
        			url : "<%=request.getContextPath() %>/mypage/deleteDoc",
        			type : "post",
        			data : JSON.stringify(data),
        			contentType:"application/json",
        			success:function(data){
        				swal({
        					title: '성공',
        					text: '파일이 삭제되었습니다',
        					icon: 'success', // primary success warning danger
        					buttons: {
        				        	confirm: {
        						text: '확인',
        				                value: true,
        				                visible: true,
        				                className: 'btn btn-success',
        				                closeModal: true
        				              }
        				        }
        				}).then(function(e){
        					window.location.href="<%=request.getContextPath() %>/mypage/mydocument.do";
        				});
        			},
        			error:function(request,status,error){
        		<%-- 		alert("파일이 삭제되었습니다");
        				window.location.href="<%=request.getContextPath() %>/mypage/mydocument.do";
        				 --%>
        				/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
        				
        			}
        			
        		});	
            } else {
            	return;
            }
         });
	
	
	
	
	
	
	
	
	
	
	
}

function change(name){
	var docCode = $("#qwe").val();
	var folder = $("#folder").val();
	
	
	var data={
			"docCode":docCode,
			"folder":folder,
			"name":name
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/updateFolder",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json",
		success:function(data){
			swal({
				title: '성공',
				text: '파일이 옮겨졌습니다',
				icon: 'success', // primary success warning danger
				buttons: {
			        	confirm: {
					text: '확인',
			                value: true,
			                visible: true,
			                className: 'btn btn-success',
			                closeModal: true
			              }
			        }
			}).then(function(e){
				window.location.href="<%=request.getContextPath() %>/mypage/mydocument.do";
			});
		},
		error:function(request,status,error){
		<%-- 	alert("파일이 옮겨졌습니다");
			window.location.href="<%=request.getContextPath() %>/mypage/mydocument.do";
			 --%>
			/* alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); */
			
			
		}
		
	});		
	
	
	
	
}




function insert(docCode){
	$("#qwe").val(docCode);
	
}

function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('#modal_close_btn')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}

$('.popup_open_btn').on('click', function() {
    // 모달창 띄우기
    modal('my_modal');
});





</script>


</body>

