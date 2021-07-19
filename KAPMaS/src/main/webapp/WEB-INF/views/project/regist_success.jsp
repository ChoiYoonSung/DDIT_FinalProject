<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<script>
	alert("프로젝트등록이 완료되었습니다!");	
	window.opener.parent.location.href="<%=request.getContextPath() %>/index.do?mCode=M010000";
	window.close();			
</script>