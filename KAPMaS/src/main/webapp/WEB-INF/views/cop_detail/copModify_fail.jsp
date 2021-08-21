<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '오류',
		text : '오류가 발생했습니다. 다른 방법으로 시도하거나 관리자에게 문의바랍니다.',
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
	}).then(function(val) {
		if (val == true) {
			location.href = "<%=request.getContextPath()%>/cop/detail/copManage/getCopInfoForm.do?copCode=${copCode}";
		}
	})
</script>

