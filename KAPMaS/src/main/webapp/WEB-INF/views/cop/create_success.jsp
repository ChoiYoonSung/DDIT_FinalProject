<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("cop개설에 성공하였습니다.\nMy CoP 페이지로 이동합니다.");
	location.href="<%=request.getContextPath()%>/cop/mycop.do"
</script>