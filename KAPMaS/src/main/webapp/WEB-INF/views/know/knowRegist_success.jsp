<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title: '성공',
		text: '노하우를 요청하였습니다',
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
		window.opener.parent.location.reload();
		window.close();
	});
</script>






