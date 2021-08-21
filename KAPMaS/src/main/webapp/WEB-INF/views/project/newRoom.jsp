<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title>채팅 서비스</title>

</head>

<body>

<div class="container">
<br>
    <form class="form-signing" action="<%=request.getContextPath() %>/project/room/new"method= "post">
        <h2 class="form-signing-heading">새로운 채팅방 생성</h2>
        <label for="title" class="sr-only">채팅방 이름</label>
        <input type="text" name="name" id="title" class="form-control" placeholder="채팅방 이름을 입력해주세요" required autofocus>
        <br>
        <button class="btn btn-primary" type="submit">생성하기</button>
        <button class="btn btn-danger" onclick = "history.go(-1);">돌아가기</button>
    </form>

</div> <!-- /container -->


</body>