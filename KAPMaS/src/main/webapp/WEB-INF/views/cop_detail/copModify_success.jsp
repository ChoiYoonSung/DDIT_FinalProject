<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : 'COP 정보 수정 성공',
		text : '수정에 성공하였습니다. 페이지를 갱신합니다.',
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
			parent.history.go(0);	
		}
	})
</script>