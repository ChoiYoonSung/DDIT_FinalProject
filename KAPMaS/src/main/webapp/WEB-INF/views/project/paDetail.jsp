<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body style="padding: 40px; background: white;">

<h2 style="text-align: center">자료실 글 상세</h2><hr><br><br>

<div>
	<h4 style="float:left">${pa.paTitle }</h4>
	<p style="float:right">작성일 : ${pa.paRegdate }</p>
	<p style="float:right; margin-right:10px;">작성자 : ${pa.empName }</p>
</div>

<br><br><br>
<div style="padding: 10px; min-height: 200px; font-size: 15px;background: aliceblue; border-radius: 7px;">
	${pa.paContent }
</div>
<div style="padding:10px;">
	<span>첨부파일 다운로드</span><hr>
	<c:forEach items="${pa.attachList }" var="attach">
		<div class="col-md-4 col-sm-10 col-xs-12"  style="cursor:pointer;"
			 onclick="location.href='<%=request.getContextPath()%>/project/getPAFile.do?paatno=${attach.paAtNo }';">
			<div class="info-box">	
				<i class="far fa-lg fa-fw me-10px fa-file"></i><span class="badge bg-primary">${attach.paAtName }</span>
			</div>
		 </div><br>							
	</c:forEach>
</div>
<c:if test="${loginUser.empId eq pa.empId }">
<div style="width:210px;  margin:0 auto; margin-top: 30px;">
	<button type="button" id="modifyBtn" class="btn btn-primary" onclick="submit_go('paModifyForm.do','${pa.paCode }');">수정</button>						
	<button type="button" id="removeBtn" class="btn btn-danger" onclick="submit_go('paRemove.do','${pa.paCode }');">삭제</button>
  	<button type="button" id="listBtn" class="btn btn-gray" onclick="CloseWindow();">닫기 </button>
</div>	
</c:if>
<c:if test="${loginUser.empId ne pa.empId }">
<div style="width:50px;  margin:0 auto; margin-top: 30px;">
  	<button type="button" id="listBtn" class="btn btn-gray" onclick="CloseWindow();">닫기 </button>
</div>	
</c:if>    
<script>
	function submit_go(url,pacode){
		//alert(url);
		if(url == "paRemove.do"){
			swal({
			    title: '자료실',
			    text: '자료를 삭제하시겠습니까?',
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
			    	 location.href=url+"?pacode="+pacode;
			     } else {
			        // false
			     }
			  });
			
		}else{
			location.href=url+"?pacode="+pacode;
		}
	}
	
	
</script>
</body>

