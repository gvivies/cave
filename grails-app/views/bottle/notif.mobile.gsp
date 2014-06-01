<%@ page import="mycompany.Bottle"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" /> 
		<g:set var="entityName"	value="${message(code: 'bottle.label', default: 'Bottle')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
		<r:require module="export" />
	</head>
	
	<body>
	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			<h1><g:message code="index.notifications.title.mobile" defaults="Notificationss" /></h1>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="content-primary">
				<ul data-role="listview" data-autodividers="true" data-filter="true">
					<g:each in="${notificationList}" status="i" var="notifInstance">
						<li>
							<span class="ui-li-count">${notifInstance.quantity}</span>
							<g:link action="show" id="${notifInstance.id}"><g:hiddenField name="wine${notifInstance.id}"	value="${notifInstance?.name}" />
								<h3>${fieldValue(bean: notifInstance, field: "name")}</h3>
								<p><g:message code="wine.region.label" /> : ${fieldValue(bean: notifInstance, field: "wine.region.name")}</p>
								<p><g:message code="bottle.wine.label" /> : ${fieldValue(bean: notifInstance, field: "wine.name")}</p>
								<p><g:message code="bottle.type.label" /> : ${fieldValue(bean: notifInstance, field: "type")}</p>
							</g:link>
						</li>
					</g:each>
				</ul>
				</div>
		</div> <!-- data-role content -->
	
		<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
       		<div class="ui-grid-d">
           		<div id="button-block-a" class="ui-block-a"></div>
           		<div id="button-block-b" class="ui-block-b"></div>
           		<div id="button-block-c" class="ui-block-c"></div>
           		<div id="button-block-d" class="ui-block-d"></div>
           		<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
           	</div>	
			
		</div>	 <!-- data-role footer -->

	</div> <!-- data-role page -->

</body>
</html>
