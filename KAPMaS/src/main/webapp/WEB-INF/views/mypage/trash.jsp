<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<div class="app-content">
	<h1 class="page-header">휴지통 | <small>임시 삭제한 게시글이 저장됩니다.</small></h1>
	<div class="row">
	<c:forEach items="${trashTable }" var="table" varStatus="status">
				<!-- BEGIN col-3 -->
				<div class="col-3">
					<div class="widget widget-stats bg-gray on-click-class-${status.index}">
						<div class="stats-icon"></div>
						<div class="stats-info">
							<h4>${trashName[status.index] }</h4>
							<p>${trashCnt[status.index] }</p>
						</div>
						<div class="stats-link">
<%-- 							<a href="javascript:" onclick="clickEvent('${table }', ${status.index }, ${trashCnt[status.index] });">View List<i class="fa fa-arrow-alt-circle-right"></i></a> --%>
							<a id="trashListBtn-${table }" href="javascript:getTrashList();" onclick="clickEvent('${table }', ${status.index }, ${trashCnt[status.index] });">View List<i class="fa fa-arrow-alt-circle-right"></i></a>
						</div>
					</div>
				</div>
				<!-- END col-3 -->
	</c:forEach>
	</div>
		<div class="panel"  onchange="selectCheckBox();">
			<div class="panel-body">
				<div class="btn-toolbar align-items-center">
					<div class="form-check me-2 hide">
						<input type="checkbox" class="form-check-input" id="trashSelectAll" data-checked="check-checkbox">
						<label class="form-check-label" for="trashSelectAll">전체선택</label>
					</div>
					<div class="w-100 d-sm-none d-block mb-2 hide" data-email-action="divider"></div>
					<!-- BEGIN btn-group -->
					<div class="btn-group hide" id="deleteRestorateBtn">
						<button class="btn btn-sm btn-white" onclick="deleteTrash()"><i class="fa fa-trash me-1"></i> <span class="hidden-xs">삭제</span></button>
						<button class="btn btn-sm btn-white" onclick="restoreTrash()"><i class="fa fa-folder me-1"></i> <span class="hidden-xs">복원</span></button>
					</div>
					<!-- END btn-group -->
				</div>
				<!-- END btn-toolbar -->
				<table class="table table-striped table-bordered align-middle dataTable no-footer dtr-inline collapsed">
					<thead>
						<tr>
							<th >#</th>
							<th >게시글 코드</th>
							<th >게시판 이름</th>
							<th >제목</th>
							<th >관리</th>
						</tr>
					</thead>
					<tbody id="trashList">
					</tbody>
				</table>
			</div>
		</div>
		<!-- END panel-body -->
	</div>
<input type="hidden" id="deleteList" name="deleteList" value=""/>
<input type="hidden" id="restoreList" name="restoreList" value=""/>
<input type="hidden" id="trashTable" name="trashTable" value="" >
<script type="text/javascript">
var jscnt = 0;
var jsindex = 0;
var jstable = '';
function clickEvent(table , index, count){
	$('input[name="trashTable"]').val(table);
	for(i = 0; i < 7; i++){
		if(i != index){
			$('div.on-click-class-'+i).addClass('bg-gray');
			$('div.on-click-class-'+i).removeClass('bg-yellow');
		}
	}
	
	$('div.on-click-class-'+index).removeClass('bg-gray');
	$('div.on-click-class-'+index).addClass('bg-yellow');
	
	$('div.form-check').removeClass('hide');
	jscnt = count;
	jsindex = index;
	jstable = table;
}


function selectCheckBox(){
	var count = $('input.check-checkbox').length;
	
	if($('.form-check-input').prop('checked')){
		$('#deleteRestorateBtn').removeClass('hide');
	}else{
		for(var i = 0; i < count; i++){
			if($('input.check-checkbox').eq(i).prop('checked')){
				$('#deleteRestorateBtn').removeClass('hide');
				return;
			}
		}
		$('#deleteRestorateBtn').addClass('hide');
	}
}


function getTrashList(){ 
	var trTable = $('input[name="trashTable"]').val();
	var data = {
			"trTable":trTable 
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/getTrashList",
		type : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		success : function(data){
			var html = "";
			for(var i = 0; i < data.trashList.length; i++){
				if(i%2 == 0){
					html += "<tr class='odd'>";
				}else{
					html +=	"<tr class='even'>";
				}
				 
				html +=	"<td class='col-2'><input type='checkbox' id='check-"+i+"' class='form-check-input check-checkbox' data-checked='check-checkbox' role='trashCheck' value='"+data.trashList[i].code+"'>";
				html += "<label class='form-check-label' for='check-"+i+"'>"+i+"</label></td>";
				html +=	"<td class='col-2'>"+data.trashList[i].code+"</td>";
				html +=	"<td class='col-2'>"+data.trashList[i].trName+"</td>";
				html +=	"<td class='col-4'>"+data.trashList[i].trTitle+"</td>";
				html += "<td class='col-2'><div class='btn-group' id='deleteRestorateBtn'>";
				html +=	"<button class='btn btn-sm btn-white'><i class='fa fa-trash me-1'></i> <span class='hidden-xs'>삭제</span></button>";
				html +=	"<button class='btn btn-sm btn-white'><i class='fa fa-folder me-1'></i> <span class='hidden-xs'>복원</span></button>";
				html +=	"</div></td>";
				
				html +=	"</tr>";
			}
			
			$("#trashList").empty();
			$("#trashList").append(html);
		},
		error : function(error){
			alert("서버장애가 발생하였습니다.\n관리자에게 문의하십시오.");
		}
	});
}


function restoreTrash(){
	var html='';
	$('#restoreList').val(html);   
	
	var num = $("input[role='trashCheck']:checked").not("#trashSelectAll").length;
	
	if(num == 0 ){
		alert("복원할 게시글을 선택하십시오.");
		return;
	}

	if(!confirm("선택한 게시글을 복원하시겠습니까?")) return;
	
	if(num == 1){
		var id= $("input[role='trashCheck']:checked");
		html += ''+id.attr('value')+'';
		$('#restoreList').val(html);   
	}else {
	
	for(var i = 0; i < num; i++){
		
		 var id= $("input[role='trashCheck']:checked").eq(i);
		 if(i == 0 ){
		 html += ''+id.attr('value')+'';
		 continue;
		 }
		 html += ',';
		 html += ''+id.attr('value')+'';
		 
		  $('#restoreList').val(html);   
		}
	}
	
	var checked = $('#restoreList').val();
	var trashTable = $('#trashTable').val();
	var data = {
			"checked" : checked
			, "trTable" : trashTable
	}
	console.log(data);
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/restoreTrash",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			
			alert("선택하신 게시글을 복원하였습니다.");
			history.go(0);
		},
		
		error:function(error){
			alert("선택하신 게시글을 복원하였습니다.");
			history.go(0);
		}
		
	});
};

function deleteTrash(){
	var html='';
	$('#restoreList').val(html);   
	
	var num = $("input[role='trashCheck']:checked").not("#trashSelectAll").length;
	
	if(num == 0 ){
		alert("삭제할 게시글을 선택하십시오.");
		return;
	}

	if(!confirm("선택한 게시글을 삭제하시겠습니까?")) return;
	
	if(num == 1){
		var id= $("input[role='trashCheck']:checked");
		html += ''+id.attr('value')+'';
		$('#restoreList').val(html);   
	}else {
	
	for(var i = 0; i < num; i++){
		
		 var id= $("input[role='trashCheck']:checked").eq(i);
		 if(i == 0 ){
		 html += ''+id.attr('value')+'';
		 continue;
		 }
		 html += ',';
		 html += ''+id.attr('value')+'';
		 
		  $('#restoreList').val(html);   
		}
	}
	
	var checked = $('#restoreList').val();
	var trashTable = $('#trashTable').val();
	var data = {
			"checked" : checked
			, "trTable" : trashTable
	}
	
	$.ajax({
		url : "<%=request.getContextPath() %>/mypage/deleteTrash",
		type : "post",
		data : JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		success:function(data){
			alert("선택하신 게시글을 삭제하였습니다.");
			history.go(0);
		},
		error:function(error){
			alert("선택하신 게시글을 삭제하였습니다.");
			history.go(0);
		}
		
	});
};



</script>
</body>
</html>