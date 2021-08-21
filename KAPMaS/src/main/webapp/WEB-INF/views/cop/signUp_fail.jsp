<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title : '오류',
		text : '이미 가입되어 있거나 신청 승인이 대기중입니다.',
		icon : 'warning', // primary success warning danger
		buttons : {
			confirm : {
				text : '확인',
				value : true,
				visible : true,
				className : 'btn btn-warning',
				closeModal : true
			}
		}
	}).then(function(val){
		CloseWindow();
	});
</script>