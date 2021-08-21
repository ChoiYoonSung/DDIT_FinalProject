<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title : 'COP 개설 성공',
		text : 'CoP개설에 성공하였습니다. My CoP 페이지로 이동합니다.',
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
			CloseWindow();
		}
	});
</script>