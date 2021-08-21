<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title : '신청 성공',
		text : '가입신청에 성공하셨습니다. 개설자가 승인시 쪽지로 알림이 발송됩니다.',
		icon : 'success', // primary success warning danger
		buttons : {
			confirm : {
				text : '확인',
				value : true,
				visible : true,
				className : 'btn btn-success',
				closeModal : true
			}
		}
	}).then(function(val){
		CloseWindow();
	});
</script>