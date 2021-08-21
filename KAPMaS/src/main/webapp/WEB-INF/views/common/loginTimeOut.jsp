<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
swal({
	title: '알림',
	text: '다시 로그인 하십시오.',
	icon: 'info', // primary success warning danger
	buttons: {
        	confirm: {
		text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
}).then(function(e){
	window.location.href="<%=request.getContextPath() %>/";
});
</script>