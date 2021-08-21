<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script>
<%-- 	alert("사원 등록이 완료되었습니다!");	
	location.href='<%=request.getContextPath()%>/';
	 --%>
	
	swal({
		title: '성공',
		text: '사원 등록이 완료되었습니다.\n입력한 이메일로 임시 비밀번호를 받아 로그인하세요.',
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
		location.href='<%=request.getContextPath()%>/';
		
	});
</script>