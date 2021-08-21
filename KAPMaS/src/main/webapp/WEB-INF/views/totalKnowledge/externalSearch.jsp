<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/totalKnowledge/js/tkList.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.embededKW{
	 font-weight:large;
	 color : blue;
	}
</style>
<body>
<div class="app-content">
	<div id="content">
		<div class="search-banner" style="padding:0px;">
			<a href="https://www.dbpia.co.kr" target="_blank">
				<img style="border-color:black;border-radius:30%;float:right; width:200px; padding:20px;"alt="dbPia" src="<%=request.getContextPath()%>/resources/images/dbpiaLogo.jpg">
			</a>
			<div class="container" style="text-align:center; padding-top: 30px">
				<h1 style="color:black; padding-bottom:30px"> 외부 DB 검색</h1>
				<div class="input-group" style="margin:0 auto; width:800px;">
					<div class="btn-group me-1 mb-1">
						<a href="javascript:;" class="btn btn-default">외부 검색</a> <a
							href="#" data-bs-toggle="dropdown"
							class="btn btn-default dropdown-toggle" aria-expanded="false"><i
							class="fa fa-caret-down"></i></a>
						<div class="dropdown-menu dropdown-menu-end" style="">
							<a href="main.do" class="dropdown-item">내부 검색</a>
						</div>
					</div>
					<input type="text" class="form-control form-control-lg" id="keyword" 
						placeholder="검색어를 입력해주세요">
					<button type="button" class="btn btn-lg" onclick="search_go()">
						<i class="fa fa-search"></i>
					</button>
				</div>
 
			</div>
		</div>
	</div>	
<br>

<input type="hidden" id="searchall"><br>
<input type="hidden" id="resultCount"><br>
	<div class="row">
		<div class="col-xl-12 ui-sortable">
		<div style="text-align : center;" id="pageButtons">
			
		</div>
			<div class="panel panel-inverse">


				<div class="panel-body" style="background-color: #f0f4f7;">
					<div id="data-table-combine_wrapper"
						class="dataTables_wrapper dt-bootstrap4 no-footer">
						<div class="dataTables_wrapper dt-bootstrap">
							<div class="row"></div>

							<table id="data-table-combine" border="1"
								style="background-color: white;"
								class="table table-striped table-bordered align-middle">
								<thead>
									<tr style="text-align:center;">
										<th width="10%"data-orderable="false" class="sorting_disabled">유형</th>
										<th width="10%"data-orderable="false" class="sorting_disabled">저자</th>
										<th width="47%"data-orderable="false" class="sorting_disabled">제목</th>
										<th width="13%"data-orderable="false" class="sorting_disabled">발행일</th>
										<th width="20%"data-orderable="false" class="sorting_disabled">원문URL</th>
									</tr>
								</thead>
								<tbody id="resultTbody">
									<tr style="text-align:center;">
										<td style="text-align:center;" colspan="5">검색결과가 여기에 표시됩니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
</body>
<script>
// $('#data-table-combine').DataTable();

function search_go(){
	var searchall = $('#keyword').val();
	if(searchall.trim() == "" || searchall.trim() == null){
		alert("검색어를 입력해주세요");
		return;
	}
	$.ajax({
		url    : "<%=request.getContextPath()%>/kms/searchDBPia?searchall="+searchall,
		type   : "GET",	
		contentType : "application/json; charset:UTF-8",
		success:function(objString){ 
			var obj = JSON.parse(objString);
			var totalCount = obj[0].paramData.totalCount;
			$('#searchall').val(obj[0].paramData.keyword.searchAll);
			$('#resultCount').val(obj[0].paramData.totalCount);
			$("#resultTbody").empty();
			$("#pageButtons").empty();
			
			if(totalCount == 0){
				 $("#resultTbody").append( "<tr>"
							+ "<td style='text-align:center;' colspan='5'>검색결과가 없습니다.</td>"
							+ "</tr>"
					 );
			}else if(totalCount >= 200){
				for(var i = 1; i < 11; i++){
					$('#pageButtons').append("<button name='pageBtn' class='btn btn-info me-1 mb-1' id='btn"+i+"' onclick='page_go("+i+")''>"+i+"</button>&nbsp&nbsp");
				}
			}else{
				for(var i = 1; i <  Math.round(totalCount/10)+1; i++){
					$('#pageButtons').append("<button name='pageBtn' class='btn btn-info me-1 mb-1' onclick='page_go("+i+")''>"+i+"</button>");
				}
			}
			$('#btn1').attr('class','btn btn-white me-1 mb-1');
			$('#pageButtons').append('<a id="exBtn" target="_blank" class="btn btn-info me-1 mb-1"><i class="fas fa-plus-circle fa-lg"  style="color : #fff;"></i></a>');
			$('#exBtn').attr("href","https://www.dbpia.co.kr/search/topSearch?startCount=0&collection=ALL&range=A&searchField=ALL&sort=RANK&query="+searchall+"&srchOption=*&includeAr=false");
			$('#exBtn').css("color","blue");
			for(var i = 0; i < obj[0].paramData.totalCount; i++){
			var mystring = obj[0].result.item[i].title;
			var find = searchall;
			var regex = new RegExp(find, "g");
			var result = mystring.replace(regex, "<span class='embededKW'>" + find + "</span>"); 
				 $("#resultTbody").append( "<tr>"
						+ "<td>" + obj[0].result.item[i].CType + "</td>"
						+ "<td>"+ obj[0].result.item[i].authors[0].name +"</td>"
						+ "<td style='text-align:left;'>"+ result+"</td>"
						+ "<td>"+ obj[0].result.item[i].issue.yymm+"</td>"
						+ "<td style='text-align:left;'><a href='"+obj[0].result.item[i].link_url+"' target='_blank'>"+ obj[0].result.item[i].link_url+"</a></td>"
						+ "</tr>"
				 );
				
			};
			
			
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}		
	});
	
}
function page_go(pagenumberStr){
	var searchall = $('#searchall').val();
	var pagenumber = pagenumberStr *= 1;
	var data = {
			"searchall" : searchall,
			"pagenumber" : pagenumber	
	}
	$('button[name="pageBtn"]').attr('class','btn btn-info me-1 mb-1');
	$('#btn'+pagenumber).attr('class','btn btn-white me-1 mb-1');
	
	
	$.ajax({
		url    : "<%=request.getContextPath()%>/kms/searchDBPiaPage?searchall="+searchall,
		type   : "POST",	
		data   : JSON.stringify(data),
		dataType : "json",
		contentType : "application/json; charset:UTF-8",
		success:function(objString){ 
			$("#resultTbody").empty();

			for(var i = 0; i < 20; i++){
				var mystring = objString[0].result.item[i].title;
				var find = searchall;
				var regex = new RegExp(find, "g");
				var result = mystring.replace(regex, "<span class='embededKW'>" + find + "</span>"); 
				
				 $("#resultTbody").append( "<tr>"
						+ "<td>" + objString[0].result.item[i].CType + "</td>"
						+ "<td>"+ objString[0].result.item[i].authors[0].name +"</td>"
						+ "<td style='text-align:left;'>"+ result+"</td>"
						+ "<td>"+ objString[0].result.item[i].issue.yymm+"</td>"
						+ "<td style='text-align:left;'><a href='"+objString[0].result.item[i].link_url+"' target='_blank'>"+ objString[0].result.item[i].link_url+"</a></td>"
						+ "</tr>"
				 );
				
			};
			
			
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}		
	});
		
	
}

</script>
</html>