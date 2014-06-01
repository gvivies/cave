
<%@ page import="mycompany.Wine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			
			<h1><g:message code="index.wine.label" default="List" /></h1>
		</div>
		<div data-role="content">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<div class="content-primary">
				<div data-role="collapsible-set" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-content-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-inset="false">
				
					<% firstChar = ''
					   saveChar = ''
					%>
					<g:each in="${wineInstanceList}" status="i" var="wineInstance">
						<% firstChar = wineInstance.name.substring(0,1)
						   if (saveChar != firstChar) { 
							   if (i != 0) { %>
							   </div></ul>
							   
							   <% }
							   saveChar = firstChar
							    %>
					    <div data-role="collapsible"><h2>${firstChar}</h2>
						<ul data-role="listview">
						<% }
						   
						 %>
            			<li>
            				<g:link action="show" id="${wineInstance.id}">
								<h3>${fieldValue(bean: wineInstance, field: "name")}</h3>
								<p><label><g:message code="wine.region.label" default="Region" /> : </label>${fieldValue(bean: wineInstance, field: "region.name")}</p>
							</g:link>
            			</li>
					</g:each>
				
				</div>
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
