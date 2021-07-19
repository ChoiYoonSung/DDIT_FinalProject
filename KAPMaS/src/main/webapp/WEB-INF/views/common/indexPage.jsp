<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<iframe class="content-wrapper"name="ifr" src="main.do" frameborder="0"></iframe>
 	 


<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>

<script type="text/x-handlebars-template"  id="subMenu-list-template" >
{{#each .}}
			<div class="menu-item subMenu kapmas-submenu-{{mcode}}">
				<a href="javascript:goPage('{{murl}}','{{mcode}}');isActive('{{mcode}}');menuSelect('{{mcode}}','${fn:length(menuList) }');" class="menu-link"><div class="menu-text">{{mname}}</div></a>
			</div>
{{/each}}
</script>
<script>
Handlebars.registerHelper('ifEq', function(v1, v2, options) {
	  if(v1 == v2) {
	    return options.fn(this);
	  }
	  return options.inverse(this);
	});
	
var url = window.location.href;
var mcode = url.substr(-7);
function init(){
	goPage('${menu.murl}','${menu.mcode}');
	subMenu('${menu.mcode}'.substring(0,3)+"0000");
	menuSelect(mcode, 10);
};

</script>








