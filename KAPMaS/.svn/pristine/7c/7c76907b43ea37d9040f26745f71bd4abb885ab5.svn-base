<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    

<body style="background-color:white;">
<a href="#" onclick="clip(); return false;"><i class="fas fa-lg fa-fw me-100px fa-clipboard" ></i></a>
<script src="<%=request.getContextPath() %>/resources/bootstrap/color_admin/template/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

function clip(){

	var url = '';
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	  swal({
		    title: '알림',
		    text: '클립보드에 복사되었습니다.',
		    icon: 'success',
		    buttons: {
		      confirm: {
		        text: '확인',
		        value: true,
		        visible: true,
		        className: 'btn btn-success me-1',
		        closeModal: true
		      }
		    }
		  });
}

</script>
</body>
