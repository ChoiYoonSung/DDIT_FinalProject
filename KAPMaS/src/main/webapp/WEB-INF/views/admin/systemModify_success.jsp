<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
<%-- 	alert("이용가이드를  수정하였습니다.");
	location.href="<%=request.getContextPath() %>/admin/systemDetail/${system2.sgCode }"; --%>
	
	swal({
		title: '성공',
		text: '이용가이드를  수정하였습니다.',
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
		location.href="<%=request.getContextPath() %>/admin/systemDetail/${system2.sgCode }";
	});
</script>

