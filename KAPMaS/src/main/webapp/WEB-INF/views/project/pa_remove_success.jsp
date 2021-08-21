<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
swal({
    title: '자료실',
    text: '자료가 삭제되었습니다.',
    icon: 'success', // primary success warning danger
    buttons: {
          confirm: {
            text: '확인',
            value: true,
            visible: true,
            className: 'btn btn-primary',
            closeModal: true
          }
    }
  });
	window.close();
	window.opener.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M010800";	
</script>