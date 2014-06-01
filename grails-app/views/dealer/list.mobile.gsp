
<%@ page import="mycompany.Dealer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			
			<h1><g:message code="index.dealer.label" default="List" /></h1>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="content-primary">
				<ul data-role="listview" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-autodividers="true" data-filter="true">
					<g:each in="${dealerInstanceList}" status="i" var="dealerInstance">
            			<li>
            				<g:link action="show" id="${dealerInstance.id}" >
								<h3>${fieldValue(bean: dealerInstance, field: "name")}</h3>
								<p>&nbsp;<g:if test="${dealerInstance?.city}">(${fieldValue(bean: dealerInstance, field: "city")})</g:if></p>
							</g:link>
            			</li>
					</g:each>
				</ul>
			</div>
			<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
            	<div class="ui-grid-d">
            		<div id="button-block-a" class="ui-block-a"><g:link data-role="button" data-mini="true" data-icon="plus" data-iconpos="top" action="create"><g:message code="default.button.create.label" default="Create" /></g:link></div>
            		<div id="button-block-b" class="ui-block-b"></div>
            		<div id="button-block-c" class="ui-block-c"></div>
            		<div id="button-block-d" class="ui-block-d"></div>
            		<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" data-direction="reverse"><g:message code="default.home" /></a></div>
            	</div>	
			</div>
		</div>
	</div> 	
	</body>
</html>
