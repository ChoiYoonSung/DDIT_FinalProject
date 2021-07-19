<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<% System.out.println("오긴하냐?"); %>


<script>
	alert("등록된 사원이 아닙니다");	
	location.href='<%=request.getContextPath()%>/';
</script>