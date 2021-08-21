<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script>
window.onload = function(){
	swal({
	    title : '확인',
	    text : '수정이 완료되었습니다',
	    icon : 'success', // primary success warning danger
	    buttons : {
	       confirm : {
	          text : '확인',
	          value : true,
	          visible : true,
	          className : 'btn btn-success',
	          closeModal : true
	       }
	    }
	 }).then(function(val) {
	    if (val == true) {
			location.href="detail.do?tkCode=${tk.tkCode}"
	 	}
	});
	
}
</script>