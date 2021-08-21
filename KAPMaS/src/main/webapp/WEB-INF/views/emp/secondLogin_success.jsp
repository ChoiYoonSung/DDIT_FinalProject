<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script>
<%-- 
	alert("환영합니다!");
	location.href="<%=request.getContextPath() %>/index.do"; --%>
	
	
	swal({
		title: '성공',
		text: '환영합니다!',
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
		location.href="<%=request.getContextPath() %>/index.do";
	});
</script>