
function menuSelect(mcode, length){
	if(length == undefined){
		length = 10;
	}
	for (var i = 0; i < length; i++) {
		$('div.kapmas-menu-M0'+i+'0000').removeClass('active');
		$('div.kapmas-menu-M0'+i+'0000').removeClass('sidebar-selected');
		$('div.kapmas-menu-M0'+i+'0000').removeClass('close');
		$('div.kapmas-menu-M0'+i+'0000').removeClass('expand');
		$('div.kapmas-submenu-'+ mcode.substr(0,4) +i+'00').removeClass('active');
	}
	
	if (mcode.substr(3) == "0000"){
		$('div.kapmas-menu-' + mcode).addClass('active');
		$('div.kapmas-menu-' + mcode).addClass('sidebar-selected');
		$('div.kapmas-menu-' + mcode).addClass('expand');
	}else{
		$('div.kapmas-submenu-' + mcode).addClass('active');
		$('div.kapmas-menu-' + mcode.substr(0,3) + "0000").addClass('active');
		$('div.kapmas-menu-' + mcode.substr(0,3) + "0000").addClass('sidebar');
		$('div.kapmas-menu-' + mcode.substr(0,3) + "0000").addClass('expand');
	}
}

function subMenu(mcode){
	if(mcode!="M000000" ){
			$.getJSON("subMenu.do?mCode="+mcode,function(data){	
				//console.log(data);		
				printData(data,$('.subMenuList'),$('#subMenu-list-template'),'.subMenu');
			});
	}else{
		$('.subMenuList').html("");
		$('.subMenuList').css("display",'none');
	}
};

//handelbars printElement (args : data Array, appent target, handlebar template, remove class)
function printData(dataArr,target,templateObject,removeClass){
	
	var template=Handlebars.compile(templateObject.html());
	
	var html = template(dataArr);
	
	$(removeClass).remove();
	target.append(html);
};

function goPage(url,mCode){
	  // HTML5 지원브라우저에서 사용 가능
	if (typeof(history.pushState) == 'function') {
	    //현재 주소를 가져온다.
	    var renewURL = location.href;
	    //현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
	    renewURL = renewURL.substring(0, renewURL.indexOf(".do")+3);
	    
	    if (mCode != 'M000000') {
	        renewURL += "?mCode="+mCode;
	    }
	    //페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
	    history.pushState(mCode, null, renewURL);
	 
	} else {
	    location.hash = "#"+mCode;
	}
	  
	$('iframe[name="ifr"]').attr("src",url);
};
