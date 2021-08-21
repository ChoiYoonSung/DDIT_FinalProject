<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("해당 게시글을 초기화하였습니다.");
	location.href="<%=request.getContextPath()%>/admin/reportManage";
	window.opener.location.reload();
</script>