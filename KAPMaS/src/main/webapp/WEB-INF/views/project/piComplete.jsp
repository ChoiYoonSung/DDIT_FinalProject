<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title: '성공',
		text: '이슈 상태가 완료로 변경되었습니다.',
		icon: 'success', // info success warning danger
		buttons: {
	        	confirm: {
			text: '확인',
	                value: true,
	                visible: true,
	                className: 'btn btn-success', // primary success warning danger
	                closeModal: true
	              }
	        }
	}).then(function(e){
		window.opener.parent.location.reload();
		window.close();
	});
</script>