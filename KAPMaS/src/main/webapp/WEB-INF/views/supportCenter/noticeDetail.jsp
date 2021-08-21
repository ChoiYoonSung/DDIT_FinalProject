<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
 #writerImg{width:50px;height:50px;border-radius: 10%;}
 #writerImgDiv{text-align:center;}
 .popover {popover-border-color:rgba($black, .2);}
</style>
<!-- bootstrap5 -->
<body style="padding: 40px; background: white;">
	<div style="max-width: 1000px; min-width: 800px; margin: 0 auto;">
		<section class="content container">
			<h2 style="text-align: center">${notice.noticeTitle}</h2>
			<hr>
			<br>
			<div class="app-content" style="padding: 0px; margin-left: 0px;">
				<div class="row" style="margin-bottom: 20px">
					<div class="col-md-2">
						<div class="row">
							<div class="col-md-3">
								<a onclick="clip(); return false;"> <i
									class="far fa-lg fa-fw me-10px fa-clipboard"
									data-toggle="tooltip" data-placement="top" title="클립보드에 복사">
								</i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-7"></div>
					<div class="col-md-3" style="margin-right: 0; float: right; text-align: right;">
						<button type="button" id="listBtn" class="btn btn-primary"
							onclick="javascript:window.close();">닫기</button>
					</div> 
				</div>
			</div>
			<div>
				<p style="float: right">작성일 : ${notice.noticeRegdate}</p>
			</div>


			<br> <br> <br>
			<div style="min-height: 300px; font-size: 15px;">
				${notice.noticeContent}
			</div>
			<hr>
		</section>

	</div>

	<!-- 클립보드 알림 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/assets/plugins/sweetalert/dist/sweetalert.min.js"></script>
<!-- popper -->
<script	src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
	
<script type="text/javascript">
	function clip() {

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		swal({
			title : '알림',
			text : '클립보드에 복사되었습니다.',
			icon : 'success',
			buttons : {
				confirm : {
					text : '확인',
					value : true,
					visible : true,
					className : 'btn btn-success me-1',
					closeModal : true
				}
			}
		});
	}

</script>
</body>


