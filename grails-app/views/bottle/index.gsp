
<%@ page import="com.gvivies.cave.Bottle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bottle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-bottle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'bottle.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'bottle.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="containing" title="${message(code: 'bottle.containing.label', default: 'Containing')}" />
					
						<g:sortableColumn property="quantity" title="${message(code: 'bottle.quantity.label', default: 'Quantity')}" />
					
						<g:sortableColumn property="year" title="${message(code: 'bottle.year.label', default: 'Year')}" />
					
						<g:sortableColumn property="yearMin" title="${message(code: 'bottle.yearMin.label', default: 'Year Min')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${bottleInstanceList}" status="i" var="bottleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: bottleInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: bottleInstance, field: "containing")}</td>
					
						<td>${fieldValue(bean: bottleInstance, field: "quantity")}</td>
					
						<td>${fieldValue(bean: bottleInstance, field: "year")}</td>
					
						<td>${fieldValue(bean: bottleInstance, field: "yearMin")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bottleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
