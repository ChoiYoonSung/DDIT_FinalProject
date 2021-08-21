<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>


<head>
</head>
<body>
<div id="content" class="app-content" >
<div class="row" style="padding:20px">
	<div class="page-title has-bg col-md-10" style="padding: 0px">
		<h1 style="color: black;">${proi.pName } - 회의일지</h1>
	</div>
</div>
<div class="row">
			<div class="project-wrapper" style="width: 48%;  height: 700px;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">타임라인</h4>
					</div>
					<div class="table-responsive">
					<c:if test="${auth ne 'OB' }">
					<c:if test="${pro.pEnabled == 1 }">
						<div style="text-align: center; background-color: #348fe2; color: #fff; height: 50px;" onclick="OpenWindow('<%=request.getContextPath() %>/project/meeting2.do','프로젝트 회의방',535,700);">
							 <h5 style=" line-height: 3;">회의방 참여</h5>
						</div>
					</c:if>
					</c:if>
			<div style="height: 700px; padding: 10px;">
			<div data-scrollbar="true" data-height="100%" data-skip-mobile="true" >
			
			<!-- BEGIN breadcrumb -->
			<!-- END breadcrumb -->
			<!-- BEGIN page-header -->
			<h1 class="page-header">회의 일지<small>&nbsp;&nbsp;&nbsp;회의 일지를 등록하시오</small></h1>
			<!-- END page-header -->
			<!-- BEGIN timeline -->
			<div class="timeline">
				<!-- BEGIN timeline-item -->
				<div class="timeline-item">
					<!-- BEGIN timeline-time -->
				 
				<c:forEach items="${meetingList}" var="meeting">
				<div class="timeline-item">
					<!-- BEGIN timeline-time -->
					<div class="timeline-time">
					<c:set var="mtRegdate" value="${fn:split(meeting.mtRegdate,'/')}"></c:set>
						<span class="date"><c:out value='${mtRegdate[0]}'/></span>
						<span class="time"><c:out value='${mtRegdate[1]}'/></span>
					</div>
					<!-- END timeline-time -->
					<!-- BEGIN timeline-icon -->
					<div class="timeline-icon">
						<a href="javascript:;" class="<c:out value='${mtRegdate[0]}'/>">&nbsp;</a>
					</div>
					<!-- END timeline-icon -->
					<!-- BEGIN timeline-content -->
					<div class="timeline-content" style="width: 70%;background-color: #E0F2F7">
						<!-- BEGIN timeline-header -->
						<div class="timeline-header">
							<div class="username">
								<a href="javascript:;">${meeting.mtTitle }</a>
								<!-- <div class="text-muted fs-12px">1 days ago <i class="fa fa-globe-americas opacity-5 ms-1"></i></div> -->
							</div>
						</div>
						<!-- END timeline-header -->
						<!-- BEGIN timeline-body -->
						<div class="timeline-body">
							<!-- timeline-post -->
							<div class="mb-3">
								<h4 class="mb-1">
								</h4>
								<div class="mb-2">
								<button type="button" class="btn btn-success me-1 mb-1" onclick="location.href='<%=request.getContextPath() %>/project/meetingDown?mtCode=${meeting.mtCode}'">회의록 다운</button>
								</div>
							</div>
						</div>
						<!-- END timeline-body -->
					</div>
					<!-- END timeline-content -->
				</div>
				<!-- END timeline-item -->
				</c:forEach>
				
				
				<!-- BEGIN timeline-item -->
				<div class="timeline-item">
					<!-- BEGIN timeline-icon -->
					<div class="timeline-icon">
						<a href="javascript:;">&nbsp;</a>
					</div>
					<!-- END timeline-icon -->
					<!-- BEGIN timeline-content -->
					<div class="timeline-content" style="width: 70%;">
						<!-- BEGIN timeline-body -->
						<div class="timeline-body" style="background-color: #E0F2F7">
							<div class="d-flex align-items-center">
								<div class="spinner-border spinner-border-sm me-3" role="status">
									<span class="visually-hidden">Loading...</span>
								</div>
								다음회의를 등록하시오
							</div>
						</div>
						<!-- END timeline-body -->
					</div>
					<!-- BEGIN timeline-content -->
				</div>
				<!-- END timeline-item -->
			</div>
			<!-- END timeline -->
		</div>
		
		</div>
		</div>

			</div>
			</div>
		</div>
		
		
		
			<div class="project-wrapper" style="width: 50%;  height: 700px;">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
						<h4 class="panel-title">보고싶은 회의일지의 날짜를 선택하시오</h4>
					</div>
					
					<div class="table-responsive">
						<div id="datepicker-inline">
							<div></div>
						</div>
		
				</div>
			</div>
		</div>
		
		
</div>


</div>
</body>

<script type="text/javascript">
		
window.setTimeout(function(){	
	
	 $('tbody').attr("onclick","find()")
	
}, 200);
		
function find(){
	
 	setTimeout(function() {
		
 		var html ="";
 		
		var day =$(".active").html();
		var asd = $(".datepicker-switch").html();
		var aaa = asd.split(" ");
		var year = aaa[1]
		var month = "";
		
		if(aaa[0] == "January"){
			month = "01";
		}else if(aaa[0] == "February"){
			month = "02";
		}else if(aaa[0] == "March"){
			month = "03";
		}else if(aaa[0] == "April"){
			month = "04";
		}else if(aaa[0] == "May"){
			month = "05";
		}else if(aaa[0] == "June"){
			month = "06";
		}else if(aaa[0] == "July"){
			month = "07";
		}else if(aaa[0] =="August"){
			month = "08";
		}else if(aaa[0] == "September"){
			month = "09";
		}else if(aaa[0] == "October"){
			month = "10";
		}else if(aaa[0] ==  "November"){
			month = "11";
		}else if(aaa[0] == "December"){
			month = "12";
		}
		
		html += ""+year+"-"+month+"-"+day+"";
		
		$('.'+html).focus();
		
	
	}, 100);
}


</script>

