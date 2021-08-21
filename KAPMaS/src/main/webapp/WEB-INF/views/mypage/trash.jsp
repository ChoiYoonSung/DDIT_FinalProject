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
	<div class="row">
	<div class="col-11">
	<h1 class="page-header">휴지통 | <small>임시 삭제한 게시글이 저장됩니다.</small></h1>
	</div>
	<div class="col-1">
		<button type="button" class="btn btn-gray border-0 w-50px" onclick="CloseWindow();">닫기</button>
	</div>
	<c:forEach items="${trashTable }" var="table" varStatus="status">
				<!-- BEGIN col-3 -->
				<div class="col-3">
					<c:if test="${status.index eq 0}">
						<div class="widget widget-stats bg-blue on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 1}">
						<div class="widget widget-stats bg-info on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 2}">
						<div class="widget widget-stats bg-orange on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 3}">
						<div class="widget widget-stats bg-red on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 4}">
						<div class="widget widget-stats bg-blue on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 5}">
						<div class="widget widget-stats bg-info on-click-class-${status.index}">
					</c:if>
					<c:if test="${status.index eq 6}">
						<div class="widget widget-stats bg-orange on-click-class-${status.index}">
					</c:if>
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
		<div class="panel"  onchange="selectCheckBox();" style="height: 420px; margin-bottom: 0; overflow: auto;" >
			<div class="panel-body">
				<div class="btn-toolbar align-items-center">
					<div class="form-check me-2 hide" onchange="selectAll();">
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
			if(i == 0){ $('div.on-click-class-'+i).addClass('bg-blue'); }
			if(i == 1){ $('div.on-click-class-'+i).addClass('bg-info'); }
			if(i == 2){ $('div.on-click-class-'+i).addClass('bg-orange'); }
			if(i == 3){ $('div.on-click-class-'+i).addClass('bg-red'); }
			if(i == 4){ $('div.on-click-class-'+i).addClass('bg-blue'); }
			if(i == 5){ $('div.on-click-class-'+i).addClass('bg-info'); }
			if(i == 6){ $('div.on-click-class-'+i).addClass('bg-orange'); }
			$('div.on-click-class-'+i).removeClass('bg-gray');
		}
	}
	
	if(index == 0){ $('div.on-click-class-'+index).removeClass('bg-blue'); }
	if(index == 1){ $('div.on-click-class-'+index).removeClass('bg-info'); }
	if(index == 2){ $('div.on-click-class-'+index).removeClass('bg-orange'); }
	if(index == 3){ $('div.on-click-class-'+index).removeClass('bg-red'); }
	if(index == 4){ $('div.on-click-class-'+index).removeClass('bg-blue'); }
	if(index == 5){ $('div.on-click-class-'+index).removeClass('bg-info'); }
	if(index == 6){ $('div.on-click-class-'+index).removeClass('bg-orange'); }
	$('div.on-click-class-'+index).addClass('bg-gray');
	
	$('div.form-check').removeClass('hide');
	jscnt = count;
	jsindex = index;
	jstable = table;
}


function selectCheckBox(){
	var count = $('input.check-checkbox').length;
	var select = 0;
	
	for(var i = 0; i < count; i++){
		if($('#check-'+i).prop('checked')){
			select += 1;
		}
	}
	
	if($('.form-check-input').prop('checked')){
		$('#deleteRestorateBtn').removeClass('hide');
		if(select != count){
			$('input#trashSelectAll').prop('checked',false);
		}
	}else{
		if(select == count){
			$('#deleteRestorateBtn').removeClass('hide');
			$('input#trashSelectAll').prop('checked',true);
		}else if(select > 0){
			$('#deleteRestorateBtn').removeClass('hide');
		}else{
			$('#deleteRestorateBtn').addClass('hide');
		}
	}
}

function selectAll(){
	if($('input#trashSelectAll').prop('checked')){
		$('.form-check-input').prop('checked', true);
	}else{
		$('.form-check-input').prop('checked', false);
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
				html +=	"<button class='btn btn-sm btn-white' onclick='deleteOneTrash("+i+")'><i class='fa fa-trash me-1'></i> <span class='hidden-xs'>삭제</span></button>";
				html +=	"<button class='btn btn-sm btn-white' onclick='restoreOneTrash("+i+")'><i class='fa fa-folder me-1'></i> <span class='hidden-xs'>복원</span></button>";
				html +=	"</div></td>";
				
				html +=	"</tr>";
			}
			
			$("#trashList").empty();
			$("#trashList").append(html);
		},
		error : function(error){
			swal({
			    title: '에러',
			    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
			    icon: 'error', // primary success warning danger
			    buttons: {
			          confirm: {
			            text: '확인',
			            value: true,
			            visible: true,
			            className: 'btn btn-danger',
			            closeModal: true
			          }
			    }
			  });
		}
	});
}


function restoreTrash(){
	var html='';
	$('#restoreList').val(html);   
	
	var num = $("input[role='trashCheck']:checked").not("#trashSelectAll").length;
	
	if(num == 0 ){
		swal({
		    title: '게시글 복원',
		    text: '복원할 게시글을 선택하십시오.',
		    icon: 'warning', // primary success warning danger
		    buttons: {
		          confirm: {
		            text: '확인',
		            value: true,
		            visible: true,
		            className: 'btn btn-warning',
		            closeModal: true
		          }
		    }
		  });
		return;
	}

	swal({
        title: '게시글 복원',
        text: '선택한 게시글을 복원하시겠습니까?',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == false){
            	   return;
               } else {
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
							swal({
							    title: '성공',
							    text: '선택하신 게시글을 복원하였습니다.',
							    icon: 'success', // primary success warning danger
							    buttons: {
							          confirm: {
							            text: '확인',
							            value: true,
							            visible: true,
							            className: 'btn btn-success',
							            closeModal: true
							          }
							    }
							  }).then(function(e){
								history.go(0);
							  });
						},
						error:function(error){
							swal({
							    title: '에러',
							    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
							    icon: 'error', // primary success warning danger
							    buttons: {
							          confirm: {
							            text: '확인',
							            value: true,
							            visible: true,
							            className: 'btn btn-danger',
							            closeModal: true
							          }
							    }
							  });
						}
					});
               }
      });
};

function deleteTrash(){
	var html='';
	$('#deleteList').val(html);   
	
	var num = $("input[role='trashCheck']:checked").not("#trashSelectAll").length;
	
	if(num == 0 ){
		swal({
		    title: '게시글 삭제',
		    text: '삭제할 게시글을 선택하십시오.',
		    icon: 'warning', // primary success warning danger
		    buttons: {
		          confirm: {
		            text: '확인',
		            value: true,
		            visible: true,
		            className: 'btn btn-warning',
		            closeModal: true
		          }
		    }
		  });
		return;
	}

	swal({
        title: '게시글 삭제',
        text: '선택한 게시글을 삭제하시겠습니까?\n(*삭제하게되면 복구할 수 없습니다.)',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == false){
          	   return;
             } else {
				if(num == 1){
					var id= $("input[role='trashCheck']:checked");
					html += ''+id.attr('value')+'';
					$('#deleteList').val(html);   
				}else {
				
				for(var i = 0; i < num; i++){
					
					 var id= $("input[role='trashCheck']:checked").eq(i);
					 if(i == 0 ){
					 html += ''+id.attr('value')+'';
					 continue;
					 }
					 html += ',';
					 html += ''+id.attr('value')+'';
					 
					  $('#deleteList').val(html);   
					}
				}
				
				var checked = $('#deleteList').val();
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
						swal({
						    title: '성공',
						    text: '선택하신 게시글을 삭제하였습니다.',
						    icon: 'success', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-success',
						            closeModal: true
						          }
						    }
						  }).then(function(e){
							history.go(0);
						  });
					},
					error:function(error){
						swal({
						    title: '에러',
						    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
						    icon: 'error', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-danger',
						            closeModal: true
						          }
						    }
						  });
					}
					
				});
             }
      });
};

function restoreOneTrash(i){
	swal({
        title: '게시글 복원',
        text: '선택한 게시글을 복원하시겠습니까?',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == false){
          	   return;
             } else {
				var checked = $('#check-'+i).val();
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
						swal({
						    title: '성공',
						    text: '선택하신 게시글을 복원하였습니다.',
						    icon: 'success', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-success',
						            closeModal: true
						          }
						    }
						  }).then(function(e){
							history.go(0);
						  });
					},
					error:function(error){
						swal({
						    title: '에러',
						    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
						    icon: 'error', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-danger',
						            closeModal: true
						          }
						    }
						  });
					}
					
				});
             }
      });
};

function deleteOneTrash(i){
	swal({
        title: '게시글 삭제',
        text: '선택한 게시글을 삭제하시겠습니까?',
        icon: 'info', // info success warning danger
        buttons: {
            cancel: {
                text: '취소',
                value: false,
                visible: true,
                className: 'btn btn-default', // primary success warning danger
                closeModal: true,
              },
              confirm: {
                text: '확인',
                value: true,
                visible: true,
                className: 'btn btn-primary', // primary success warning danger
                closeModal: true
              }
        }
      }).then(function(val){
	         if(val == false){
          	   return;
             } else {
	
				var checked = $('#check-'+i).val();
				var trashTable = $('#trashTable').val();
				var data = {
						"checked" : checked
						, "trTable" : trashTable
				}
				console.log(data);
				
				$.ajax({
					url : "<%=request.getContextPath() %>/mypage/deleteTrash",
					type : "post",
					data : JSON.stringify(data),
					contentType:"application/json;charset=utf-8",
					success:function(data){
						swal({
						    title: '성공',
						    text: '선택하신 게시글을 삭제하였습니다.',
						    icon: 'success', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-success',
						            closeModal: true
						          }
						    }
						  }).then(function(e){
							history.go(0);
						  });
					},
					
					error:function(error){
						swal({
						    title: '에러',
						    text: '서버장애가 발생하였습니다.\n관리자에게 문의하십시오.',
						    icon: 'error', // primary success warning danger
						    buttons: {
						          confirm: {
						            text: '확인',
						            value: true,
						            visible: true,
						            className: 'btn btn-danger',
						            closeModal: true
						          }
						    }
						  });
					}
					
				});
             }
      });
};

</script>
</body>
</html>