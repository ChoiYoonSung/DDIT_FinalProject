<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<script>
window.onload = function(){
	swal({
	    title : '확인',
	    text : '게시물이 삭제되었습니다.',
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
	    	window.close();
	    	window.opener.parent.location.href="<%=request.getContextPath()%>/index.do?mCode=M020300";	
	 	}
	});
	
}
</script>