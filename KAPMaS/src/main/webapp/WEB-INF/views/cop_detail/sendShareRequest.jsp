<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '성공',
		text : '프로젝트 소유자에게 공유 요청 메시지를 성공적으로 전송했습니다.',
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
	}).then(function(val) {
		if (val == true) {
			location.href = '<%=request.getContextPath()%>/cop/detail/shareProject/${copCode}';
		}
	});
</script>