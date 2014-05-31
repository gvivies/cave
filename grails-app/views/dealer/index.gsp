
<%@ page import="com.gvivies.cave.Dealer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dealer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dealer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'dealer.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="telephone" title="${message(code: 'dealer.telephone.label', default: 'Telephone')}" />
					
						<g:sortableColumn property="ownerId" title="${message(code: 'dealer.ownerId.label', default: 'Owner Id')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'dealer.city.label', default: 'City')}" />
					
						<g:sortableColumn property="comment" title="${message(code: 'dealer.comment.label', default: 'Comment')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'dealer.email.label', default: 'Email')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dealerInstanceList}" status="i" var="dealerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: dealerInstance, field: "telephone")}</td>
					
						<td>${fieldValue(bean: dealerInstance, field: "ownerId")}</td>
					
						<td>${fieldValue(bean: dealerInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: dealerInstance, field: "comment")}</td>
					
						<td>${fieldValue(bean: dealerInstance, field: "email")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dealerInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
