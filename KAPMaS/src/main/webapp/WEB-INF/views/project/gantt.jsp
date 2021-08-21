<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    <head>
		<meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" >
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/gantt.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/css.css" />
        <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
		<style type="text/css">
			body {
		    	font-family: 'ELAND_Choice_M';
				font-size: 13px;
				padding: 0 0 50px 0;
			}
			.app-content {
			    padding: 20px 30px;
			}
			.page-header {
				font-size: 24px;
			    margin: 0 0 15px;
			    padding: 0;
			    border: none;
			    line-height: 32px;
			    font-weight: 500;
			}
			h2 {
				font-size: 1.5em;
				padding-bottom: 3px;
				border-bottom: 1px solid #DDD;
				margin-top: 50px;
				margin-bottom: 25px;
			}
			table th:first-child {
				width: 150px;
			}
			.rightPanel{
			    background: white;
			}
			.panel {
			    background: #fff;
			    border: none;
			    margin-bottom: 1.24688rem;
			    -webkit-box-shadow: none;
			    box-shadow: none;
			    border-radius: 4px;
			    display: -webkit-box;
			    display: -ms-flexbox;
			    display: flex;
			    -webkit-box-orient: vertical;
			    -webkit-box-direction: normal;
			    -ms-flex-direction: column;
			    flex-direction: column;
			}
			.panel.panel-inverse>.panel-heading {
			    background: #f0f4f7;
			}
			.panel .panel-heading {
			    padding: .75rem .9375rem;
			    border: none;
			    display: -webkit-box;
			    display: -ms-flexbox;
			    display: flex;
			    -ms-flex-align: center;
			    align-items: center;
			    -webkit-flex-wrap: nowrap;
			    -ms-flex-wrap: nowrap;
			    flex-wrap: nowrap;
			    -webkit-border-top-left-radius: 4px;
			    border-top-left-radius: 4px;
			    -webkit-border-top-right-radius: 4px;
			    border-top-right-radius: 4px;
			}
			.panel .panel-body {
			    padding: .9375rem .9375rem;
			}	
			.panel .panel-body, .panel .panel-footer, .panel .panel-toolbar {
			    -webkit-box-flex: 1 1 auto;
			    -ms-flex: 1 1 auto;
			    flex: 1 1 auto;
			}
			.h1, h1 {
			    font-size: calc(1.3125rem + .75vw);
			}
			.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
			    margin-top: 0;
			    margin-bottom: .46875rem;
			    font-weight: 600;
			    line-height: 1.2;
			}
			body {.app-content {
			    margin-left: 0px;
			    padding: 20px 30px;
			}
			.row{
				margin-left: calc(var(--bs-gutter-x) * -.5);
			}
		</style>
    </head>
    <body style="background-color: #f0f4f7;">

	<div class="app-content">
		<div class="row" style="padding:20px">
			<div class="page-title has-bg col-md-10" style="padding: 0px">
				<h1 style="color: black;">${proName } - 간트차트</h1>
			</div>
		</div>
		<div class="panel panel-inverse">
			<div class="panel-heading">
				<div class="panel-title" style="height: 16px;"></div>
			</div>
			<div class="panel-body">
				<div class="gantt"></div>
			</div>
		</div>
	</div>
			
    <script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/jquery.fn.gantt.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/prettify/r298/prettify.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
 
   
       <script> 
    
    window.setTimeout(function(){	
            "use strict";
    		var colors = ["ganttRed", "ganttGreen", "ganttOrange"];
            var data;
        	$.ajax({
        		url: "getGanttList.do",
        		type: "get",
        		dataType: "json",
        		async:false,
        		success: function(dataBox){
        			data = dataBox;
        			console.log(dataBox)
        		},
        		error: function (request, status, error){
        		
        		}
        	});
        	
        	var empIdArr = [];
        	var demoSource = new Array();
			for(var i in data){
				if(empIdArr.indexOf(data[i].empId) < 0)  {
					empIdArr.push(data[i].empId);
				}
				
				var ganttItem = new Array();
				ganttItem.desc = data[i].empName;
				ganttItem.name = data[i].jobContent;
        		
        		var values = new Array();	
        		var valueItem = new Array();
        		valueItem.from =  moment(data[i].jobStartdate);
        		valueItem.to =  moment(data[i].jobEnddate);
        		valueItem.label = data[i].jobPrograss + "%";
        		valueItem.customClass = colors[empIdArr.length % 3];
        		values.push(valueItem);
        		ganttItem.values = values;
        		demoSource.push(ganttItem)
        	}

            var offset = new Date().setHours(0, 0, 0, 0) -
                new Date(demoSource[0].values[0].from).setDate(35);
            for (var i = 0, len = demoSource.length, value; i < len; i++) {
                value = demoSource[i].values[0];
                value.from += offset;
                value.to += offset;
            }

            $(".gantt").gantt({
                source: demoSource,
                navigate: "scroll",
                scale: "days",
                maxScale: "months",
                minScale: "hours",
                itemsPerPage: 20,
                scrollToToday: false,
                useCookie: true,
                onRender: function() {
                    if (window.console && typeof console.log === "function") {
                        console.log("chart rendered");
                    }
                }
            });

            $(".gantt").popover({
                selector: ".bar",
                title: "현재 진척도",
                container: '.gantt',
                content: function _getItemText() {
                    return this.textContent;
                },
                trigger: "hover",
                placement: "auto right"
            });

            prettyPrint();

    }, 200);
    </script>
   	<script src="<%=request.getContextPath() %>/resources/js/common.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/index.js"></script>	
     </body>