<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script>
	swal({
		title : '알림',
		text : '삭제 완료!',
		icon : 'success',
		buttons : {
			confirm : {
				text : '확인',
				value : true,
				visible : true,
				className : 'btn btn-success me-1',
				closeModal : true
			}
		}
	});
	window.opener.parent.location.reload();
	window.close();			
</script>
