<%@ page import="mycompany.Bottle"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" /> 
		<g:set var="entityName"	value="${message(code: 'bottle.label', default: 'Bottle')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" id="bottleListPage" >
		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			<h1><g:message code="index.bottle.label" defaults="Bottles" /> (${bottlesCount})</h1>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="content-primary">
				<ul data-role="listview" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-filter="true">
					<g:each in="${bottleInstanceList}" status="i" var="bottleInstance">
						<li>
							<div id="drinkBottles_${bottleInstance.id}" class="bottleQty ui-li-count">
								<a href="javascript:drinkSomeBottle(${bottleInstance.id});" data-rel="popup" >
									<div id="quantity_${bottleInstance.id}">${bottleInstance.quantity}</div>
								</a>
							</div>
							<g:link action="show" id="${bottleInstance.id}">
								<g:hiddenField name="wine${bottleInstance.id}" value="${bottleInstance?.name}" />
								<g:hiddenField name="hiddenQty_${bottleInstance.id}" value="${bottleInstance.quantity}" />
								<h3>${fieldValue(bean: bottleInstance, field: "name")} - <g:formatNumber format="####" number="${bottleInstance?.year}" /></h3>
								<p>${fieldValue(bean: bottleInstance, field: "wine.name")} - ${fieldValue(bean: bottleInstance, field: "type")}</p>
							</g:link>
						</li>
					</g:each>
				</ul>
			</div>
		</div> <!-- data-role content -->
		<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
       		<div class="ui-grid-d">
           		<div id="button-block-a" class="ui-block-a"><g:link data-mini="true" data-iconpos="top" data-role="button" data-icon="plus" action="create"><g:message code="bottle.new.label.mobile" default="New" /></g:link></div>
           		<div id="button-block-b" class="ui-block-b"></div>
           		<div id="button-block-c" class="ui-block-c"></div>
           		<div id="button-block-d" class="ui-block-d"></div>
           		<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" data-direction="reverse"><g:message code="default.home" /></a></div>
           	</div>	
		</div>	 <!-- data-role footer -->
		<g:render template="drinkPopupMobile" />
	</div> <!-- data-role page -->
	
	<g:javascript library="drinkMobile" />
</body>
</html>
