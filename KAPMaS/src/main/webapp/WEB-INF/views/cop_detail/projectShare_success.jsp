<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '성공',
		text : '프로젝트 공유에 성공했습니다.',
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