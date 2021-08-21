<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script>
// 	alert("등록된 사원이 아닙니다");
	swal({
		title: 'error',
		text: '등록된 사원이 아닙니다',
		icon: 'warning', // primary success warning danger
		buttons: {
	        	confirm: {
			text: '확인',
	                value: true,
	                visible: true,
	                className: 'btn btn-warning',
	                closeModal: true
	              }
	        }
	});
	location.href='<%=request.getContextPath()%>/';
</script>