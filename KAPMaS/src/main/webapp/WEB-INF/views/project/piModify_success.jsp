<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	alert("이슈 정보가 변경되었습니다.");
	window.location.href="<%=request.getContextPath()%>/project/piDetail/${piCode}";
</script>