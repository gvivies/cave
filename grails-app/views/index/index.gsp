<!DOCTYPE html>
<html>
    <head>
        <title><g:message code="index.title" default="Cellar management" /></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<link rel="apple-touch-icon" href="/cave/static/images/apple-touch-icon.png">
		<link rel="apple-touch-icon" sizes="114x114" href="/cave/static/images/apple-touch-icon-retina.png">
        <link rel="shortcut icon" href="${resource(dir:'images',file:'bottle.ico')}" type="image/x-icon" />
		
		<r:require module="drinkMobile" />
        <r:require module="application" />		
  		<r:require module="jquery-ui" />
  		<r:require module="jquery-mobile" />
        
        <r:layoutResources/>
		
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.mobile.css')}" >
		<link rel="stylesheet" href="${resource(dir: 'css/themes', file: 'cave.css')}" >
		<link rel="stylesheet" href="${resource(dir: 'css/themes', file: 'cave.min.css')}" >
    </head>
    <body>
    	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" id="main-page" > 
	    	<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >
	    		<h1><g:message code="index.title" /></h1>
	    	</div>
	    	<div data-role="content">
	    	    <ul id ="main-menu" data-inset="true" data-role="listview" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-dividertheme="${message(code: 'jquery.data.theme', default: 'c')}">
      	    		<li id="main-title" data-role="list-divider">
      	    			<div id="main-index">${message(code: 'default.home.label', default: 'c')}</div>
      	    		</li>
      	    		<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:link controller="bottle" rel="external">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></li>
      	    		<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></li>
      	    		<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:link controller="region">${message(code: 'index.region.label', default: 'Areas')}</g:link></li>
      	    		<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></li>
      	    		<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:link controller="bottle" action="notif">${message(code: 'index.notifications.title.mobile', default: 'To be drunk now')}</g:link></li>
   	    			<li data-theme="${message(code: 'jquery.data.theme', default: 'c')}" ><g:userTab device="mobile" /></li>
        		</ul>
	    	</div>
       		<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
       			<div id="log-control">
       				<g:loginControl />
       			</div>
       			
			</div>
    	</div>
    	<r:require module="mapMobile" />
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    	
        <r:layoutResources />
	</body>

</html>