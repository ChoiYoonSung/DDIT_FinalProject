<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '에러',
		text : '토론방 생성에 실패했습니다. 관리자에게 문의바랍니다.',
		icon : 'error', // primary success warning danger
		buttons : {
			confirm : {
				text : '확인',
				value : true,
				visible : true,
				className : 'btn btn-danger',
				closeModal : true
			}
		}
	}).then(function(val){
		location.href="<%=request.getContextPath()%>/cop/detail/discussion/${copCode}";
	});
</script>