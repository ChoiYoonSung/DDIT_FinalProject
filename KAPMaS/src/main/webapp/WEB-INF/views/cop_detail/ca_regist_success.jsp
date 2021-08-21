<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '자료실 글 등록 성공',
		text : '자료실 글 등록에 성공하였습니다. 자료실 메인 페이지로 이동합니다.',
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
			location.href="<%=request.getContextPath()%>/cop/detail/coppds/${copCode}";
		}
	});
</script>