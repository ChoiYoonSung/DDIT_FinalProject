<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	swal({
	    title: '이관',
	    text: '이관이 되었습니다!',
	    icon: 'success', // primary success warning danger
	    buttons: {
	          confirm: {
	            text: '확인',
	            value: true,
	            visible: true,
	            className: 'btn btn-primary',
	            closeModal: true
	          }
	    }
	  }).then(function(val){
		window.opener.parent.location.reload();
		window.close();			
	});
</script>