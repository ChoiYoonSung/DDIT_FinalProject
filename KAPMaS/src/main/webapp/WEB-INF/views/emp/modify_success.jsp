<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	swal({
		title: '수정 성공',
		text: '${emp.empName }님의 정보가 수정되었습니다.',
		icon: 'success', // primary success warning danger
		buttons: {
        	confirm: {
				text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-success',
                closeModal: true
	              }
	        }
	}).then(function(val){
		window.location.href='<%=request.getContextPath()%>/emp/detail/${emp.empId}';
		window.parent.location.href.reload();
	});
</script>