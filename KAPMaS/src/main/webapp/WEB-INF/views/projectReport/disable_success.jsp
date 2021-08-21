<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<script>
	alert("비활성화 되었습니다.\n 휴지통에서 해당 게시물을 복구 또는 영구삭제 할 수 있습니다.");
	window.close();
	window.opener.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M020100";	
</script>