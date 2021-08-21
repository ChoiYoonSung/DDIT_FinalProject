<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<script>
	swal({
		title : '오류',
		text : '추가한 패밀리중 이미 추가되어있는 패밀리가 존재합니다.',
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
			history.go(-1);
		}
	});
</script>