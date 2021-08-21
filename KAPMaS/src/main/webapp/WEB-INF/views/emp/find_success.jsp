<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script>
// 	alert("비밀번호를 초기화 하였습니다.다시 로그인 해주세요");
	swal({
		title: '성공',
		text: '비밀번호를 초기화 하였습니다.다시 로그인 해주세요',
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