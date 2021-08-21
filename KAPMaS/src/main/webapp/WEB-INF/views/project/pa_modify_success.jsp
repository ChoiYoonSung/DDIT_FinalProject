<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
	swal({
	    title: '자료실',
	    text: '수정이 완료되었습니다.',
	    icon: 'success', // primary success warning danger
	    buttons: {
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
	    	  location.href="paDetail.do?pacode=${pa.paCode}"
	       }
	    });
</script>