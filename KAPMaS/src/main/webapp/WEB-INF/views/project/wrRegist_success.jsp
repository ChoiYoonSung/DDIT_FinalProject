<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	swal({
		title: '양식 확인',
		text: '${pName}의 주간 보고서가 수정되었습니다.',
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
		window.close();
		window.opener.location.reload();
	});
</script>