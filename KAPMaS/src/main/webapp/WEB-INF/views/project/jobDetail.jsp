<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<head>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jquery/dist/jquery.js"></script>

<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/css/colReorder.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/css/keyTable.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/css/rowReorder.bootstrap4.min.css"	rel="stylesheet" />
<link	href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/css/select.bootstrap4.min.css"	rel="stylesheet" />

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net/js/jquery.dataTables.js"></script>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder/js/dataTables.colReorder.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-colreorder-bs4/js/colReorder.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-keytable-bs4/js/keyTable.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder/js/dataTables.rowReorder.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-rowreorder-bs4/js/rowReorder.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select/js/dataTables.select.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-select-bs4/js/select.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/dataTables.buttons.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons-bs4/js/buttons.bootstrap4.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.colVis.min.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.flash.min.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.html5.js"></script> --%>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/datatables.net-buttons/js/buttons.print.js"></script>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/pdfmake/build/vfs_fonts.js"></script>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jszip/dist/jszip.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/jstree.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/moment/min/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>



</head>

<body style="">
			<div class="project-wrapper">
				<div class="panel panel-inverse" data-sortable-id="index-6">
					<div class="panel-heading ui-sortable-handle">
<!-- 						<h4 class="panel-title">Analytics Details</h4> -->
							<h3 class="panel-title">업무 상세 정보 화면</h3>
					</div>
					<div class="table-responsive">

<!-- 				<div class="col-lg-4" style="padding-left: 5px; padding-top: 15px; padding-right: 5px;"> -->
<!-- 					<div class="col-md-12"> -->
<!-- 						<div class="alert alert-primary alert-dismissible fade show mb-2"> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<form id="sub" style="padding-left: 100px; padding-top: 25px; padding-right: 100px;" action="jobRegist.do" method="post" name="sendForm">
			
			<div class="row mb-15px">
						<span class="badge  text-black col-3" style=" height: 30px;">
			<h6 style="line-height: 25px;">업무 이름</h6>
			</span>
				<div class="col-md-9">
					<input type="text" readonly="readonly" name="name" id="name" class="form-control mb-5px" placeholder="${job.jobName }">
				</div>
			</div>
			
			<div class="row mb-15px">
							<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height: 25px;">업무 내용</h6>
				</span>
				<div class="col-md-9">
					<textarea class="form-control" readonly="readonly" rows="5" name="content" id="content" style="resize: none; overflow: auto;">${job.jobContent }</textarea>
				</div>
			</div>
			
			
			<div class="row mb-15px">
								<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height: 25px;">업무 기간</h6>
				</span>
				<div class="col-md-9">
								<div class="input-group" id="default-daterange">
									<input type="text" readonly="readonly" name="default-daterange"
										class="form-control" value=""
										placeholder="${job.jobStartdate} ~ ${job.jobEnddate}">
									<div class="input-group-text">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
							
					<input type="text" hidden="" id="start" name="start" value="">
					<input type="text" hidden="" id="end" name="end" value="">		
							
			</div>
			
			<div class="row mb-15px">
								<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height:25px;">담당 사원</h6>
				</span>
				<div class="col-md-9">
						<input type="text" readonly="readonly" name="name" id="name" class="form-control mb-5px" placeholder="-${emp.empName }-">
				</div>
			</div>
			
			<div class="row mb-15px">
							<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height:25px;">진척도</h6>
				</span>
				<div class="col-md-9">
				<div class="progress progress-striped">
				  <div class="progress-bar bg-warning" style="width: ${job.jobPrograss}%">
				   ${job.jobPrograss}%
				  </div>
				</div>
				</div>
			</div>
			
			<div class="row mb-15px">
								<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height:25px;">기능 분류</h6>
				</span>
				<div class="col-md-9">
						<input type="text" readonly="readonly" name="name" id="name" class="form-control mb-5px" placeholder="-${job.jobFile }-">
				</div>
			</div>
			
			
</form>


				<div class="btn-wrapper" style="padding-left: 250px;">
					<button class="btn btn-gray " onclick="CloseWindow();">취소</button>
					<c:if test="${job.jobEnabled == '1' }">
					<c:if test="${loginUser.empId == pjm.empId }">
						<button class="btn btn-warning "
							onclick="OpenWindow('JobModifyForm.do?jobCode=${job.jobCode}','업무 수정',800,472);">
							수정&nbsp;
						</button>
					</c:if>
					
					<button class="btn btn-info "
						onclick="OpenWindow('JobCome.do?jobCode=${job.jobCode}','업무 공유',530,425);">
						업무 공유&nbsp;
					</button>
					</c:if>
					
					<c:if test="${loginUser.empId == pjm.empId }">
						<c:if test="${job.jobEnabled == '0' }">
							<button type="button" class="btn btn-primary " onclick="doJob();">
								활성화&nbsp;
							</button>
						</c:if>
						<c:if test="${job.jobEnabled == '1' }">
							<button type="button" class="btn btn-red "
								onclick="doNotJob();">
								중지&nbsp;
							</button>
						</c:if>
					</c:if>
					
				</div>


			</div>
			</div>
		</div>

	<form id="pp" action="<%=request.getContextPath() %>/project/doNotJob.do" method="post">
		<input name="jobCode" hidden="" value="${job.jobCode }">
	</form>
	
	<form id="pd" action="<%=request.getContextPath() %>/project/doJob.do" method="post">
		<input name="jobCode" hidden="" value="${job.jobCode }">
	</form>




<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/vendor.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/app.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/theme/default.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>


<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/@highlightjs/cdn-assets/highlight.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/js/demo/render.highlight.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/jstree/dist/jstree.min.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap./assets/js/demo/ui-tree.demo.js" type="6fa72fa030d19bea1f3dc6bb-text/javascript"></script>

<script type="6fa72fa030d19bea1f3dc6bb-text/javascript">
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-53034621-1', 'auto');
		ga('send', 'pageview');

	</script>
<script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="6fa72fa030d19bea1f3dc6bb-|49" defer=""></script><script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"670faf0938ea5647","version":"2021.6.0","r":1,"token":"4db8c6ef997743fda032d4f73cfeff63","si":10}'></script>




<script type="text/javascript">

function doNotJob(){
/* 	if(confirm("업무를 중지하시겠습니까? 다시 활성화 할수 있습니다.")){
		var form=document.getElementById('pp');
		form.submit();
}else{
	return;
} */
	 swal({
         title: '업무 중지',
         text: '업무를 중지하시겠습니까? 다시 활성화 할수 있습니다.',
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


function doJob(){
	/* 	if(confirm("업무를 활성화 하게시겠습니까? 다시 중지 할수 있습니다.")){
			var form=document.getElementById('pd');
			form.submit();
	}else{
		return;
	} */
		   swal({
               title: '업무 활성화',
               text: '업무를 활성화 하게시겠습니까? 다시 중지 할수 있습니다.',
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


</script>

</body>


























