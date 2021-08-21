<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></c:set> 
<head>
    <meta charset="UTF-8">
    <title>채팅 서비스</title>
   	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/nvd3/build/nv.d3.css" rel="stylesheet" />
	<script src="<%=request.getContextPath() %>/resources/sockjs.min.js"></script>

</head>
<body>
		<div class="panel panel-inverse" data-sortable-id="index-2" style="width: 100%; height : 95%;">
						<div class="panel-heading">
							<h3 class="panel-title">${room.name} 회의방</h3>
						</div>
								<button class = "btn btn-primary" id = "name" onclick="nameOpen('${loginUser.empName}');">회의 시작</button>
						<div class="panel-body bg-light" style="height:97%;">
							<div class="chats" id = "chatroom" data-scrollbar="true" data-height="95%">
								<div style="background-color: green; border-radius: 50px; width: 50%">
									<h4 style="padding: 10px; color: white;"><c:out value="${sysYear}" /> 회의록</h4>
								</div> 
								
							</div>
						</div>
						<div class="panel-footer">
							<form name="send_message_form" data-id="message-form">
								<div class="input-group">
									<input type="text" class="form-control"id = "message" name="message" placeholder="보낼내용을 입력하시오">
									<button class="btn btn-info" type="button"onclick="send();">전송</button>
									<button class="btn btn-primary" type="button"onclick="PDF();">PDF만들기<i class="fa fa-link"></i></button>
									<button class="btn btn-warning" type="button"onclick="cl();">나가기</button>
								</div>
							</form>
						</div>
					</div>
					
	<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
	<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/d3/d3.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/nvd3/build/nv.d3.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/jvectormap-next/jquery-jvectormap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/jvectormap-next/jquery-jvectormap-world-mill.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/bootstrap-calendar/js/bootstrap_calendar.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/gritter/js/jquery.gritter.js"></script>
		<input type="text" id="roomid" hidden="" value="${room.roomId}">
		<input type="text" id="titl" hidden="" value="">
		<input type="text" id="hhh" hidden="" value="">			

</body>
<script>
    var webSocket;
    var nickname;
    var roomId = document.getElementById("roomid").value;
    
    function nameOpen(name){
    	
        nickname = name;
        document.getElementById("name").style.display = "none";
        connect();
    
    }
    
    
    function connect(){
        webSocket =new SockJS("<%=request.getContextPath()%>/echo2");
        webSocket.onopen = onOpen;
        webSocket.onclose = onClose;
	   	webSocket.onmessage = onMessage;
    }
    
    
    function disconnect(){
        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
        webSocket.close();
    	
    }
    
    function send(){
        msg = document.getElementById("message").value;
        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
        document.getElementById("message").value = "";
    }
    function onOpen(){
        webSocket.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
        
    }
    
    
    function onMessage(e){
    	var html="";
         data = e.data;
         
         var today = new Date(); 
         var arr=e.data.split(":");
         
         if(arr[1] != undefined){
         var arr1 = arr[0].substring(1);
         var arr2 = arr[1].substring(1,arr[1].length-1);
         }
         
        if(arr[1]==undefined){
        	
        	html += "<div class='chats-item start'>";
            html += "<span class='date-time'>"+today+"</span>";
            html += '<a href="javascript:;" class="name"><span class="badge bg-blue">관리자 알림</span></a>';
            html += '<div class="message">';
            html += ""+arr[0]+"";
            html += '</div>';
            html += '</div>';
            chatroom = document.getElementById("chatroom");
            chatroom.innerHTML = chatroom.innerHTML + "<br>" + html;
            nickname = document.getElementById("nickname").value;
            
    	}else if(arr[0]==nickname){
        	 
         html += "<div class='chats-item end'>";
         html += "<span class='date-time'>"+today+"</span>";
         html += '<a href="javascript:;" class="name"><span class="badge bg-blue">'+arr1+'</span></a>';
         html += '<div class="message">';
         html += ""+arr2+"";
         html += '</div>';
         html += '</div>';
         chatroom = document.getElementById("chatroom");
         chatroom.innerHTML = chatroom.innerHTML + "<br>" + html; 	
         
         }else{
        	 
             html += "<div class='chats-item start'>";
             html += "<span class='date-time'>"+today+"</span>";
             html += '<a href="javascript:;" class="name"><span class="badge bg-blue">'+arr1+'</span></a>';
             html += '<div class="message">';
             html += ""+arr2+"";
             html += '</div>';
             html += '</div>';
             chatroom = document.getElementById("chatroom");
             chatroom.innerHTML = chatroom.innerHTML + "<br>" + html;  
        	 
         }
         
         
    }
    function onClose(){
        disconnect();
    }

    
    function cl(){
    	 disconnect();
    	window.close();			
    }
    
    function PDF(){
    	
    	   swal({
    	       title: '입력',
    	       text: '저장하실 제목을 입력하시오\n입력 후 잠시만 기다려주세요',
    	       icon: 'info', // primary success warning danger
    	       content : {
    	          element: 'input',
    	          attributes: {
    	             placeholder: "제목을 입력하세요",
    	             type: "text"
    	          }
    	       },
    	       buttons: {
    	             confirm: {
    	               text: '확인',
    	               value: true,
    	               visible: true,
    	               className: 'btn btn-primary',
    	               closeModal: true
    	             }
    	       }
    	     }).then(function(titl){
//    	         e가 입력값입니다.

    	         html2canvas($('#chatroom')[0] ,{	
    	           allowTaint : true,	
    	           useCORS: true,		
    	           scale : 2,			
    	           logging : false,
    	           height : window.outerHeight + window.innerHeight,
    	           windowHeight:window.outerHeight + window.innerHeight
    	         }).then(function(canvas) {	
    	           var imgData = canvas.toDataURL('image/png');

    	           var imgWidth = 190; 
    	           var pageHeight = imgWidth * 1.414; 
    	           var imgHeight = canvas.height * imgWidth / canvas.width;
    	           var heightLeft = imgHeight;
    	           var margin = 1; 
    	           var doc = new jsPDF('p', 'mm');
    	           var position = 0;

    	           doc.addImage(imgData, 'PNG', margin, position, imgWidth, imgHeight);
    	           heightLeft -= pageHeight;

    	           while (heightLeft >= 20) {			
    	           position = heightLeft - imgHeight;

    	           doc.addPage();
    	           doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
    	           heightLeft -= pageHeight;
    	           }

    	           var uuid = guid();
    	           var hhh = "";
    	           hhh += ''+uuid+'$$meetingLog.pdf';
    	           
    	           doc.save(''+uuid+'$$meetingLog.pdf');
    	           
    	           
    	           $("#titl").val(titl);
    	           $("#hhh").val(hhh);
    	           
    	           setTimeout(function() {
    	           
    	         	  ajx();
    	         	  
    	         	}, 3500);
    	           
    	         });
    	         

    	     });
        		
    }
    
    
    
    function guid() {
        function s4() {
          return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
        }
        return s4() + s4() + '-' + s4() + '-' + s4();
        /* + '-' + s4() + '-' + s4() + s4() + s4(); */
      }
    
    
    function ajx(){
    	
    	var titl = $("#titl").val();
    	var hhh = $("#hhh").val();
    	
    	var data={
      			"titl":titl,
      			"hhh":hhh
      		}
      	
			          $.ajax({
			      		url : "<%=request.getContextPath() %>/project/insertMeeting",
			      		type : "post",
			      		data : JSON.stringify(data),
			      		contentType:"application/json;charset=utf-8",
			      		success:function(data){
			      			
			      			/* alert("회의록 등록 완료");
			      			disconnect();
			      			window.opener.parent.location.reload();
			      	    	window.close();		
			      	    	 */
			      	    	
			      	    	swal({
			      	  		title: '성공',
			      	  		text: '회의록 등록 완료',
			      	  		icon: 'success', // primary success warning danger
			      	  		buttons: {
			      	  	        	confirm: {
			      	  			text: '확인',
			      	  	                value: true,
			      	  	                visible: true,
			      	  	                className: 'btn btn-success',
			      	  	                closeModal: true
			      	  	              }
			      	  	        }
			      	  	}).then(function(e){
			      	  	disconnect();
		      			window.opener.parent.location.reload();
		      	    	window.close();		
			      	  	});
			      	    	
			      			
			      		},
			      		error:function(request,status,error){
			      			
			      			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			
			      		}
			      		
			      	});
    	
    	
    }
    
    
</script>






