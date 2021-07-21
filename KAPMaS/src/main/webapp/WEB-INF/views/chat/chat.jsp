<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script type="text/javascript">
 
window.onload = function() {
        
     /*    $("#sendBtn").click(function(){
            sendMessage();
        });
     */
    }
    
    var sock;
    
    function sendMessage() {
        
        sock = new SockJS("<c:url value='/echo'/>");
        alert("<c:url value='/echo'/>");
     /*    //sock = new SockJS("http://localhost:8080/TestMVC/echo"); */
        sock.onmessage = onMessage;
        sock.onclose = onClose;
        sock.onopen = function() {
            sock.send( $("#message").val() );
        };
    }
    
    function onMessage(evt) {
        var data = evt.data;
        $("#data").append(data);
        sock.close();
    }
    
    function onClose(evt) {
        $("#data").append("Connection Closed!");
    }
    
</script>
</head>
<body>
 
    <input type="text" id="message" />
    <input type="button" id="sendBtn" value="SEND" onclick="sendMessage()" />
    <div id="data"></div>
    
</body>
 
