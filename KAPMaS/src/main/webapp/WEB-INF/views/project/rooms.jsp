<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>채팅 서비스</title>

</head>

<body>
	<div class="row" style="padding: 20px;">
		<div class="project-wrapper" style="height: 95%;">
			<div class="panel panel-inverse" data-sortable-id="index-6">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">회의방 목록</h4>
					<button type="button" id="listBtn" class="btn btn-gray w-100px" onclick="CloseWindow();">닫기</button>
				</div>
				<div class="table-responsive">
					<div class="container">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>번호</th>
									<th>방 이름</th>
									<th>입장</th>
									<th>토론방 삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${rooms }" var="room">
									<tr>
										<td>${room.roomId}</td>
										<td>${room.name}</td>
										<td><a class="btn btn-primary" href="<%=request.getContextPath() %>/project/rooms/${room.roomId}">입장</a>
										</td>
										<td><a class="btn btn-warning" onclick="del('${room.roomId}');">삭제</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="text-end">
						<a class="btn btn-primary text-end" href="<%=request.getContextPath() %>/project/new">새로 만들기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	function del(roomId){
	<%-- 	if(confirm("채팅방을 삭제하시겠습니까?")){
			
			window.location.href="<%=request.getContextPath() %>/project/rdelete?roomId="+roomId;
	}else{
		return;
	} --%>
		
		
		   swal({
               title: '채팅방 삭제',
               text: '채팅방을 삭제하시겠습니까?',
               icon: 'warning', // primary success warning danger
               buttons: {
                   cancel: {
                       text: '취소',
                       value: false,
                       visible: true,
                       className: 'btn btn-default',
                       closeModal: true,
                     },
                     confirm: {
                       text: '확인',
                       value: true,
                       visible: true,
                       className: 'btn btn-primary',
                       closeModal: true
                     }
               }
             }).then(function(val){
                if(val == true){
                	window.location.href="<%=request.getContextPath() %>/project/rdelete?roomId="+roomId;
                } else {
                	return;
                }
             });
		
		
	}
	
	</script>
</body>