<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script>
	alert("프로젝트비활성화를 완료하였습니다!");	
	window.location.href="<%=request.getContextPath() %>/project/main.do";
</script>