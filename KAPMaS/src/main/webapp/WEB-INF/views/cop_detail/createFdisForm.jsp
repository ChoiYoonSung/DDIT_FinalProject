<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<style>
</style>
</head>
<body>
	<div class="row" style="margin: 0px;">
		<div class="col-xl-12 ui-sortable">
			<br> 
			<a onclick="javascript:history.go(-1)">
			<i class="ion ion-md-arrow-round-back fa-2x fa-fw float-start me-10px text-black-lighter"></i>
			</a>
			<h1 class="page-header">뒤로가기</h1>
			<div class="panel panel-inverse" data-sortable-id="ui-media-object-1"
				data-init="true">
				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">토론방 개설</h4>
				</div>
				<div class="panel-body">
					<div class="col-xl-12 ui-sortable">
						<div class="panel panel-inverse">
							<div class="panel-body">
								<form action="createFdis.do" role="form" method="post">
									<input type="hidden" id="copCode" name="copCode" value="${copCode}">
									토론방 제목 : <input type="text" id="fdisName" name="fdisName">								
									토론방 주제 : <input type="text" id="fdisSubject" name="fdisSubject">
									<button type="button" onclick="createFdis();">토론방 개설</button>								
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	</script>
</body>