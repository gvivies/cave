
<%@ page import="com.gvivies.cave.Wine" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-wine" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-wine" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list wine">
			
				<g:if test="${wineInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="wine.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${wineInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.ownerId}">
				<li class="fieldcontain">
					<span id="ownerId-label" class="property-label"><g:message code="wine.ownerId.label" default="Owner Id" /></span>
					
						<span class="property-value" aria-labelledby="ownerId-label"><g:fieldValue bean="${wineInstance}" field="ownerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${wineInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="wine.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:link controller="region" action="show" id="${wineInstance?.region?.id}">${wineInstance?.region?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:wineInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${wineInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
