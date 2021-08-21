<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
.titlebox{
	margin:0 auto;
	background: #ffd900;
    width: 300px;
    height: 50px;
    color: white;
    font-size: 20px;
    text-align: center;
    font-weight:bold;
    line-height: 50px;
}
.project-info{
	margin: 0 auto;
	margin-top:100px;
	width:500px;
}
.project-info-item{
	box-shadow: 2px 2px 10px silver;
	margin-bottom:30px;
	display: inline-block;
	border-radius:5px;
	width:100%;
}
.item-front{
	float:left;
	padding:10px;
	width:10%;
	height:100%;
	background: #ffd900;
	text-align: center;
	font-weight: bold;
}
.item-content{
	float: left;
	width:90%;
	padding:10px;
	height:100%;
	background: white;
}
.btn-wrapper{
	width:100%;
	display: flex;
	justify-content: space-between;
}
button{
    width: 120px;
}
</style>
<link href="<%=request.getContextPath() %>/resources/bootstrap/assets/plugins/countdown/jquery.countdown.css" rel="stylesheet">
</head>
<body>
<div class="project-wrapper">
	<div class="panel panel-inverse" data-sortable-id="index-6">
			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">프로젝트 상세정보</h4>
				<div class="panel-heading-btn">
				</div>
			</div>
			<div class="table-responsive">
			
	<div class="coming-soon" style="min-height: 94vh;">
		<div class="coming-soon-header">
			<div class="bg-cover"></div>
			<div class="brand">
				<span class="logo"></span> <b>${pro.pName }</b> 상세정보
			</div>
			<br>
			<div class="desc">
				<b style="color: white; font-size: x-large;">주제 | </b><span style="color: white;">${pro.pTitle }</span><br><br>
				<b style="color: white; font-size: x-large;">개요 | </b><span style="color: white;">${pro.pSummary }</span><br><br>
				<b style="color: white; font-size: x-large;">내용 | </b><span style="color: white;">${pro.pContent }</span>
			</div>
			<div class="timer">
				<div id="timer" class="is-countdown" style="margin: 0 auto; margin-right: 90px;">
					<span class="countdown-row countdown-show4">
						<span class="countdown-section">
							<span class="countdown-amount" id="Days"></span>
							<span class="countdown-period">Days</span>
						</span>
						<span class="countdown-section">
							<span class="countdown-amount" id="Hours"></span>
							<span class="countdown-period">Hours</span>
						</span>
						<span class="countdown-section">
							<span class="countdown-amount" id="Minutes"></span>
							<span class="countdown-period">Minutes</span>
						</span>
						<span class="countdown-section">
							<span class="countdown-amount" id="Seconds"></span>
							<span class="countdown-period">Seconds</span>
						</span>
					</span>
				</div>
			</div>
		</div>


		<div class="coming-soon-content">
		
		<div class="btn-wrapper">
		<button class="btn btn-gray " onclick="CloseWindow();">닫기</button>
		
		
		
		<c:if test="${loginUser.empId == pjm.empId }">
			<c:if test="${pro.pEnabled == '0' }">
				<button type="button" class="btn btn-warning " onclick="doPro();">활성화&nbsp;</button>
			</c:if>
			<c:if test="${pro.pEnabled == '1' }">
			<button class="btn btn-warning " onclick="OpenWindow('ProModifyForm.do?pCode=${pro.pCode}','프로젝트 수정',900,550);">수정&nbsp;</button>
				<button class="btn btn-warning " onclick="OpenWindow('relegateForm.do?pCode=${pro.pCode}','프로젝트 이관',700,770);">프로젝트 이관&nbsp;</button>
				<button type="button" class="btn btn-primary" onclick="doNotPro();">비활성화&nbsp;</button>
			</c:if>
		</c:if>
		
	</div>
		</div>
	</div>

		</div>
	</div>
</div>



<input type="text" hidden="" id="end" value="${pro.pEnddate }">

	<form id="pp" action="<%=request.getContextPath() %>/project/doNotPro.do" method="post">
	<input name="pCode" hidden="" value="${pro.pCode }">
</form>

<form id="pd" action="<%=request.getContextPath() %>/project/doPro.do" method="post">
	<input name="pCode" hidden="" value="${pro.pCode }">
</form>


<script>


window.onload=function(){
	counter();
	
}


function doNotPro(){
	
	/* 
		if(confirm("프로젝트를 비활성화 하시겠습니까? 다시 활성화 할수 있습니다.")){
			var form=document.getElementById('pp');
			form.submit();
	}else{
		return;
	} */
		
		   swal({
               title: '프로젝트 비활성화',
               text: '프로젝트를 비활성화 하시겠습니까? 다시 활성화 할수 있습니다.',
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
                	var form=document.getElementById('pp');
        			form.submit();
                } else {
                	return;
                }
             });	
		
		
}


function doPro(){

	
/* 	if(confirm("프로젝트를 활성화 하시겠습니까? 다시 비활성화 할수 있습니다.")){
				var form=document.getElementById('pd');
				form.submit();
		}else{
			return;
		} */
	
	   swal({
           title: '프로젝트 활성화',
           text: '프로젝트를 활성화 하시겠습니까? 다시 비활성화 할수 있습니다.',
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
            	var form=document.getElementById('pd');
				form.submit();
            } else {
            	return;
            }
         });		
			
			
			
}


function counter(){
	
	var end = $('#end').val();
	var date = end.split("-");
	
	var year =  date[0];
	var month =  date[1];
	var day =  date[2].split(" ")[0];
	
	if(month == 1){
		month = "Jan";
	}else if(month == 2){
		month = "Feb";
	}else if(month == 3){
		month = "Mar";
	}else if(month == 4){
		month = "Apr";
	}else if(month == 5){
		month = "May";
	}else if(month == 6){
		month = "Jun";
	}else if(month == 7){
		month = "Jul";
	}else if(month == 8){
		month = "Aug";
	}else if(month == 9){
		month = "Sep";
	}else if(month == 10){
		month = "Oct";
	}else if(month == 11){
		month = "Nov";
	}else if(month == 12){
		month = "Dec";
	}
	
	var dday = new Date(""+month+" "+day+","+year+",09:00:00").getTime(); //디데이
	setInterval(function(){
		var now = new Date(); //현재 날짜 가져오기
		var distance = dday - now;
		var d = Math.floor(distance / (1000 * 60 * 60 * 24));
		var h = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		var m = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var s = Math.floor((distance % (1000 * 60)) / 1000);
		if(s < 10){
			s = '0'+s;
		}
		if(d<0){
			d = "기";
			h = "간";
			m = "종";
			s = "료";
			$('#Days').html(d)
			$('#Hours').html(h)
			$('#Minutes').html(m)
			$('#Seconds').html(s)
		}else{
		$('#Days').html(d)
		$('#Hours').html(h)
		$('#Minutes').html(m)
		$('#Seconds').html(s)
		}
	}, 1000);
}








</script>







</body>


