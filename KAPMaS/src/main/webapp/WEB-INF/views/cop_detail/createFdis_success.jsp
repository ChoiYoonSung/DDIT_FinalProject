<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '토론방 생성 성공',
		text : '토론방 생성에 성공하였습니다.',
		icon : 'success', // primary success warning error
		buttons : {
			confirm : {
				text : '확인',
				value : true,
				visible : true,
				className : 'btn btn-success',
				closeModal : true
			}
		}
	}).then(function(val){
		if(val == true){
			location.href="<%=request.getContextPath()%>/cop/detail/discussion/${copCode}";
		}
	});
</script>
