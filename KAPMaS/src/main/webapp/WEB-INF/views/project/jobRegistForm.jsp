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
						<h4 class="panel-title">?????? ??????</h4>
					</div>
					<div class="table-responsive">

<%-- <h1 style="padding-left: 10px;"><img src="<%=request.getContextPath() %>/resources/images/logo-remove.png"  --%>
<!-- 		alt="" style="width: 100px;">?????? ?????? ??????</h1> -->

		<form id="sub" style="padding-left: 100px; padding-top: 25px; padding-right: 100px;" action="jobRegist.do" method="post" name="sendForm">
			
			<div class="row mb-15px">
							<span class="badge  text-black col-3" style=" height: 30px;">
			<h6 style="line-height: 25px;" onclick="fillForm();">?????? ??????</h6>
			</span>
				<div class="col-md-9">
					<input type="text" name="name" id="name" class="form-control mb-5px" placeholder="????????? ??????????????????">
				</div>
			</div>
			
			<div class="row mb-15px">
				<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height: 25px;">?????? ??????</h6>
				</span>
				<div class="col-md-9">
					<textarea class="form-control" rows="5" name="content" id="content" ></textarea>
				</div>
			</div>
			
			
			<div class="row mb-15px">
								<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height: 25px;">?????? ??????</h6>
				</span>
				<div class="col-md-9">
								<div class="input-group" id="default-daterange">
									<input type="text" name="default-daterange"
										class="form-control" value=""
										placeholder="?????? ????????? ???????????????">
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
				<h6 style="line-height:25px;">?????? ??????</h6>
				</span>
				<div class="col-md-9">
						<select style="width: 120px; float: left;" name="emp" id="emp"
							class="form-select">
							<option value="">-?????? ??????-</option>
							<c:forEach items="${pjmList }" var="pjm">
								<option value="${pjm.empId }">${pjm.empName }</option>
							</c:forEach>

						</select>
				</div>
			</div>
			
			<div class="row mb-15px">
							<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height:25px;">?????????</h6>
				</span>
				<div class="col-md-9">
						<select style="width: 120px; float: left;" name="prograss" id="prograss"
							class="form-select">
							<option value="">-????????? ??????-</option>
								<option value=0>0</option>
								<option value=10>10</option>
								<option value=20>20</option>
								<option value=30>30</option>
								<option value=40>40</option>
								<option value=50>50</option>
								<option value=60>60</option>
								<option value=70>70</option>
								<option value=80>80</option>
								<option value=90>90</option>
								<option value=100>100</option>
						</select>
				</div>
			</div>
			
			
			<div class="row mb-15px">
								<span class="badge  text-black col-3" style=" height: 30px;">
				<h6 style="line-height:25px;">?????? ??????</h6>
				</span>
				<div class="col-md-9">
						<select style="width: 120px; float: left;" name="selbox" id="selbox"
							class="form-select" onclick="change();">
							<option value="">-?????? ??????-</option>
								<option value="direct">????????????</option>
								<c:forEach items="${serviceList }" var="service">
									<option value="${service }" class="service">${service}</option>
								</c:forEach>
						</select>
						<input type="text" id="selboxDirect" name="selboxDirect"class="form-control mb-5px" placeholder="??????????????????" value="">
						<input type="text" hidden="" id="ser" name="ser" value="">
				</div>
			</div>
			
			
</form>


<div style="padding-left: 330px;">
<button class="btn btn-gray " onclick="CloseWindow();">??????</button>
<button class="btn btn-warning " onclick="send();">??????</button>
</div>


				</div>
			</div>
		</div>












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
$("#default-daterange").daterangepicker({
    opens: "right",
    format: "MM/DD/YYYY",
    separator: " to ",
    startDate: moment().subtract("days", 29),
    endDate: moment(),
    minDate: "01/01/2021",
    maxDate: "12/31/2021",
  }, function (start, end) {
	  $('#start').val(start.format("YYYY-MM-D"));
	  $('#end').val(end.format("YYYY-MM-D"));
    $("#default-daterange input").val(start.format("YYYY-MM-D") + " ~ " + end.format("YYYY-MM-D"));
  });


$(function(){

    //???????????? ???????????? ???????????? ???????????????

$("#selboxDirect").hide();



$("#selbox").change(function() {

		

              //??????????????? ?????? ??? ?????????

		if($("#selbox").val() == "direct") {

			$("#selboxDirect").show();

		}  else {

			$("#selboxDirect").hide();

		}

		

	}) 
	

});

function fillForm(){
	$('input[name="name"]').val("MyOffice ?????????");
	$('textarea[name="content"]').val("My Office ?????? ?????? ?????????");
};

function send(){
	
	
	if($("#selbox").val()==""){
		
		/* alert("????????? ??????????????? ????????? ????????? ??????????????????");
		return; */
		
		swal({
			title: '??????',
			text: '????????? ??????????????? ????????? ????????? ??????????????????',
			icon: 'danger', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '??????',
		                value: true,
		                visible: true,
		                className: 'btn btn-danger',
		                closeModal: true
		              }
		        }
		});
		return;
	}
	
	
	if($("#selbox").val() == "direct" && $('#selboxDirect').val()==""){
		
		/* alert("??????????????? ?????? ???????????????.????????????????????????");
		return; */
		
		swal({
			title: '??????',
			text: '??????????????? ?????? ???????????????.????????????????????????',
			icon: 'danger', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '??????',
		                value: true,
		                visible: true,
		                className: 'btn btn-danger',
		                closeModal: true
		              }
		        }
		});
		return;
		
	}
	
	
	var html='';
	var len = $(".service").length;
	for(var i = 0; i < len; i++){
		$(".service")[i].innerHTML='';
	}
	
	if(len == 1){
		var ser = $("#selboxDirect").val();
		
		var id= $(".service");
		html += ''+id.val()+'';
		html += ',';
		html += ''+ser+'';
		$('#ser').val(html);   
	}else if(len == 0){
		
		var ser = $("#selboxDirect").val();
		if(ser == ""){
		html += '??????';
		$('#ser').val(html); 
		
		}else{
		html += ''+ser+'';
		$('#ser').val(html); 
		}
		
	}else {
	
		for(var i = 0; i < len; i++){
			
			 var id= $(".service").eq(i);
			 if(i == 0 ){
			 html += ''+id.val()+'';
			 continue;
			 }
			 
			 html += ',';
			 html += ''+id.val()+'';
			
		}
	
		 var ser = $("#selboxDirect").val();
			if(ser == ""){
			$('#ser').val(html); 
			}else{
			html += ',';
			html += ''+ser+'';
			$('#ser').val(html); 
			}
		
	}
	
	 document.sendForm.submit();
	
	
}


function change(){
	
	 $('#selboxDirect').val('');
	
}



</script>

</body>


























