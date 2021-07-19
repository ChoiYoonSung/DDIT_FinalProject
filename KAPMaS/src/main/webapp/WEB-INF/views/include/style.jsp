<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet" />
<!-- ================== BEGIN core-css ================== -->
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/vendor.min.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/default/app.min.css" rel="stylesheet">
<!-- ================== END core-css ================== -->

<!-- ================== BEGIN page-css ================== -->
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/jvectormap-next/jquery-jvectormap.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/css/default/theme/yellow.min.css" rel="stylesheet" id="themeCss">
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" />
<link href="<%=request.getContextPath() %>/resources/css/css.css" rel="stylesheet" id="innerCss">
	<!-- gritter(화면 로딩 후 나타나는 alert) -->
<%-- <link href="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet"> --%>
<!-- ================== END page-css ================== -->
<style type="text/css">
	.jqstooltip {
		position: absolute;
		left: 0px;
		top: 0px;
		visibility: hidden;
		background: rgb(0, 0, 0) transparent;
		background-color: rgba(0, 0, 0, 0.6);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,endColorstr=#99000000);
		-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
		color: white;
		font: 10px arial, san serif;
		text-align: left;
		white-space: nowrap;
		padding: 5px;
		border: 1px solid white;
		box-sizing: content-box;
		z-index: 10000;
	}
	
	.jqsfield {
		color: white;
		font: 10px arial, san serif;
		text-align: left;
	}
   .app-sidebar-content::-webkit-scrollbar {
       display: none; /* Chrome, Safari, Opera*/
   }
</style>
