<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title>채팅 서비스</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

<div class = "container">
    <table class = "table table-striped">
        <thead>
        <tr>
            <th>번호</th>
            <th>방 이름</th>
            <th>입장버튼</th>
        </tr>
        </thead>
        <tbody>
        
        	<c:forEach items="${rooms }" var="rooms" >
        <tr>
            <td>${room.roomId}</td>
            <td>${room.name}</td>
            <td>
                <a class = "btn btn-primary" href = "<%=request.getContextPath() %>/project/rooms/{id} (id = ${room.roomId})}"></a>
            </td>
        </tr>
        </c:forEach>
        
        </tbody>
    </table>
    <a class = "btn btn-primary pull-right" href = "<%=request.getContextPath() %>/project/new">새로 만들기</a>
</div>


</body>