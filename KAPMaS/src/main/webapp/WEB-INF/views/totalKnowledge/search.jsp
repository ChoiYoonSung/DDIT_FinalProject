<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
<meta content="" name="description">
<meta content="" name="author">
<style>
ul li {list-style-type: none; float: left;}

</style>
<%-- <link href="<%=request.getContextPath()%>/resources/bootstrap/assets/css/forum/app.min.css" rel="stylesheet"> --%>

</head>
<body style="background-color: #f0f4f7;">
	<div id="content">
		<div class="search-banner" style="padding:0px;">

			<div class="container" style="text-align:center; padding-top: 30px">
				<h1 style="color:black; padding-bottom:30px"> 통합 검색</h1>
				<div class="input-group" style="margin:0 auto; width:800px;">
					<input type="text" class="form-control form-control-lg" id="addKW" 
						placeholder="검색할 키워드를 입력하고 추가버튼을 클릭하세요">
					<button type="button" class="btn btn-lg"  onclick="addKeyword()">
						<i class="fas fa-lg fa-fw  fa-plus-circle"></i>
					</button>
					<button type="button" class="btn btn-lg" onclick="goSearch()">
						<i class="fa fa-search"></i>
					</button>
				</div>
				<div style="height:30px; margin:0 auto; padding:0px; width:800px;" >
					<ul class="popular-tags" id="KWList" >
					</ul>
				</div>
 
			</div>
		</div>
	</div>	
	<div class="row" style="margin-top:50px; background-color: #f0f4f7;" >
		<div class="col-md-4">
			<div class="card-body">
				<h4 class="card-title">Special title treatment</h4>
				<p class="card-text">With supporting text below as a natural
					lead-in to additional content.</p>
				<a href="javascript:;" class="btn btn-sm btn-warning">Go
					somewhere</a>
			</div>
		</div>
		<div class="panel panel-inverse col-md-8" style="background-color: #f0f4f7;">

			<div class="panel-heading ui-sortable-handle">
				<h4 class="panel-title">Hover Table</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
						data-toggle="panel-expand"><i class="fa fa-expand"></i></a> <a
						href="javascript:;" class="btn btn-xs btn-icon btn-success"
						data-toggle="panel-reload"><i class="fa fa-redo"></i></a> <a
						href="javascript:;" class="btn btn-xs btn-icon btn-warning"
						data-toggle="panel-collapse"><i class="fa fa-minus"></i></a> <a
						href="javascript:;" class="btn btn-xs btn-icon btn-danger"
						data-toggle="panel-remove"><i class="fa fa-times"></i></a>
				</div>
			</div>


			<div class="panel-body" style="background-color: white;">

				<div class="table-responsive">
					<table class="table table-hover mb-0 text-inverse">
						<thead>
							<tr>
								<th>#</th>
								<th>Username</th>
								<th>Email Address</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Nicky Almera</td>
								<td>nicky@hotmail.com</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Edmund Wong</td>
								<td>edmund@yahoo.com</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Harvinder Singh</td>
								<td>harvinder@gmail.com</td>
							</tr>
						</tbody>
					</table>
				</div>

			</div>

		</div>
	</div>
			<div class="panel panel-inverse col-md-4" data-sortable-id="table-basic-2">

				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">Hover Table</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand"><i class="fa fa-expand"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-success"
							data-toggle="panel-reload"><i class="fa fa-redo"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-warning"
							data-toggle="panel-collapse"><i class="fa fa-minus"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-danger"
							data-toggle="panel-remove"><i class="fa fa-times"></i></a>
					</div>
				</div>


				<div class="panel-body">

					<div class="table-responsive">
						<table class="table table-hover mb-0 text-inverse">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Email Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Nicky Almera</td>
									<td>nicky@hotmail.com</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Edmund Wong</td>
									<td>edmund@yahoo.com</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Harvinder Singh</td>
									<td>harvinder@gmail.com</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

			</div>
			<div class="panel panel-inverse col-md-4" data-sortable-id="table-basic-2">

				<div class="panel-heading ui-sortable-handle">
					<h4 class="panel-title">Hover Table</h4>
					<div class="panel-heading-btn">
						<a href="javascript:;" class="btn btn-xs btn-icon btn-default"
							data-toggle="panel-expand"><i class="fa fa-expand"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-success"
							data-toggle="panel-reload"><i class="fa fa-redo"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-warning"
							data-toggle="panel-collapse"><i class="fa fa-minus"></i></a> <a
							href="javascript:;" class="btn btn-xs btn-icon btn-danger"
							data-toggle="panel-remove"><i class="fa fa-times"></i></a>
					</div>
				</div>


				<div class="panel-body">

					<div class="table-responsive">
						<table class="table table-hover mb-0 text-inverse">
							<thead>
								<tr>
									<th>#</th>
									<th>Username</th>
									<th>Email Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Nicky Almera</td>
									<td>nicky@hotmail.com</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Edmund Wong</td>
									<td>edmund@yahoo.com</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Harvinder Singh</td>
									<td>harvinder@gmail.com</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

			</div>

	<script>
	function addKeyword(){
		var KW = $('#addKW').val().trim();
		var len = $(".key").length;
		
		if(KW == null || KW == ""){
			alert("키워드를 입력해주세요");
			return;
		}
		if(len > 4){
			alert("키워드는 최대 5개까지 입력 가능합니다.");
			$('#addKW').val("");
			return;
		}
		
		var KWList = $('<li><div class="d-flex align-items-center"><a href="#"><i class="fa fa-circle"></i> <span class="key">' + KW +'</span></a><i class="fas fa-lg fa-fw me-10px fa-times-circle" onclick="delKW(this)"></i></div></li>');
		$('#KWList').append(KWList);
		$('#addKW').val("");
	}
	
	function delKW(e){
		var KW = $(e);
		KW.closest("li").remove();
	}
	
	function goSearch(){
// 		$('#KWList').each(function(index, element){
// 			alert($(this).children('div').text());
// 		});
		var len = $(".key").length;
		var arr = [];
		for(var i = 0; i < len; i++){
			arr.push($(".key")[i].innerText);
		}
		console.log(arr);
		
	}
	
	</script>
</body>
