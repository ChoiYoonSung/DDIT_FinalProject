<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>

<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/gc.spread.sheets.excel2013white.14.1.1.css" />
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/gc.spread.sheets.designer.14.1.1.min.css" />
<style type="text/css">
	body{
	  margin: 0;
	  background-color: white;
	}
	
	.gc-ribbon-bar .ribbon-navigation .fileButton{
		display: none;
	}
	
</style>

<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.all.14.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.charts.14.1.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.shapes.14.1.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.print.14.1.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.barcode.14.1.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.pdf.14.1.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.excelio.14.1.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.designer.resource.ko.14.1.1.min.js " type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/resources/js/gc.spread.sheets.designer.all.14.1.1.min.js" type="text/javascript"></script>
<script>
window.onload = function () {
	
	
	var designer = new GC.Spread.Sheets.Designer.Designer(document.getElementById("designerHost"));
    var spread = new GC.Spread.Sheets.Workbook(document.getElementById('designerHost'));
    var excelIo = new GC.Spread.Excel.IO();
    
    document.getElementById('fileDemo').onchange = function () {
    var excelFile = document.getElementById("fileDemo").files[0];
    excelIo.open(excelFile, function (json) {
        var workbookObj = json;
		spread.fromJSON(workbookObj);
    }, function (e) {
        // process error
      		swal({
		    title: '?????? ??????',
		    text: e.errorMessage + "\n.xlsx????????? ???????????????.",
		    icon: 'warning',
		    buttons: {
		      alert: {
		        text: '??????',
		        value: true,
		        visible: true,
		        className: 'btn btn-warning',
		        closeModal: true
		      }
		    }
		  });
        return;
    });
    $('#fileName').val($('#fileDemo').val(n).split('\\')[2]);
    };
    
    
    
    
    document.getElementById('saveExcel').onclick = function () {
    	var html="";
    	 var uuid = guid();
    	 
    	 
    	 
    	   swal({
    	       title: '??????',
    	       text: '????????? ??????????????? ???????????????.',
    	       icon: 'info', // primary success warning danger
    	       content : {
    	          element: 'input',
    	          attributes: {
    	             placeholder: "????????? ??????????????? ???????????????",
    	             type: "text"
    	          }
    	       },
    	       buttons: {
    	             confirm: {
    	               text: '??????',
    	               value: true,
    	               visible: true,
    	               className: 'btn btn-primary',
    	               closeModal: true
    	             }
    	       }
    	     }).then(function(fileName){
    	          if (fileName.substr(-5, 5) !== '.xlsx') {
    	              fileName += '.xlsx';
    	          }

    	          html += ''+uuid+''+fileName+'';
    	          
    	          $("#name").val(html);
    	          var json = spread.toJSON();

    	          // here is excel IO API
    	          excelIo.save(json, function (blob) {
    	              saveAs(blob, html);
    	          });
    	          setTimeout(function() {
    	        	  ajx();
    	        	  
    	       		}, 3500);
    	        
    	     });
    	 
    };
    
}


function guid() {
    function s4() {
      return ((1 + Math.random()) * 0x10000 | 0).toString(16).substring(1);
    }
    return s4() + s4() + '-' + s4() + '-' + s4();
    /* + '-' + s4() + '-' + s4() + s4() + s4(); */
  }



function ajx(){
	
	var fileName = $("#name").val();
	
	
	var data={
  			"fileName":fileName
  		}
  	
          $.ajax({
      		url : "<%=request.getContextPath() %>/mypage/insertDocument",
      		type : "post",
      		data : JSON.stringify(data),
      		contentType:"application/json;charset=utf-8",
      		success:function(data){
      	  	swal({
      			title: '??????',
      			text: 'MyDocument ?????? ??????',
      			icon: 'success', 
      			buttons: {
      		        	confirm: {
      				text: '??????',
      		                value: true,
      		                visible: true,
      		                className: 'btn btn-success',
      		                closeModal: true
      		              }
      		        }
      		}).then(function(e){
      			window.opener.parent.location.reload();
      			window.close();		
      		});
      	    	
      			
      		},
      		error:function(request,status,error){
      			swal({
      				title: 'Error',
      				text: "code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error,
      				icon: 'error', // info success warning danger
      				buttons: {
      			        	confirm: {
      					text: '??????',
      			                value: true,
      			                visible: true,
      			                className: 'btn btn-danger', // primary success warning danger
      			                closeModal: true
      			              }
      			        }
      			});

      		}
      		
      	});

}


function reportDownload(){
	var selectReportValue = $('#selectReport').val();
	if(selectReportValue == '????????? ??????'){
		swal({
			title: '?????? ??????',
			text: '???????????? ??? ????????? ???????????????.',
			icon: 'warning', // primary success warning danger
			buttons: {
		        	confirm: {
				text: '??????',
		                value: true,
		                visible: true,
		                className: 'btn btn-warning',
		                closeModal: true
		              }
		        }
		});
		return;
	};
	location.href="<%=request.getContextPath() %>/mypage/getOfficeForm?fileName="+selectReportValue;
	return;
}

</script>
</head>
<body>
<input type="file" id="fileDemo" class="input" hidden="hidden">
<div class="row" style="padding: 0; margin: 0;">
	<div class="col-11">
		<input readonly="readonly" id="fileName" value="?????????.xlsx" class="form-control" style="width: 150px; display: inline-block;"/>
		<button type="button" class="btn btn-primary" style="width: 100px;"><label for="fileDemo">?????? ??????</label></button>
		<select id="selectReport" class="form-select"  style="width: 150px;  display: inline-block;">
			<option>????????? ??????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="????????? ??????.xlsx">?????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="??????????????? ??????.xlsx">???????????????</option>
			<option value="????????????????????? ??????.xlsx">?????????????????????</option>
			<option value="????????????????????? ??????.xlsx">?????????????????????</option>
		</select>
		<button type="button" class="btn btn-primary" onclick="reportDownload();" style="width: 120px;">?????? ????????????</button>
		<button type="button" class="btn btn-primary"  id="saveExcel" style="width: 140px;">My Document ??????</button>
	</div>
	<div class="col-1">
		<button type="button" class="btn btn-gray border-0 w-50px" onclick="CloseWindow();" style="width: 100px;">??????</button>
	</div>
</div>
  <div id="designerHost" style="width:100%; height:600px;border: 1px solid gray;"></div>
  <input type="text" hidden="" id="name" value="">
</body>
</html>


