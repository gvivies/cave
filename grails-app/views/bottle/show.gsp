
<%@ page import="com.gvivies.cave.Bottle" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bottle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bottle" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bottle">
			
				<g:if test="${bottleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="bottle.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bottleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="bottle.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${bottleInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.containing}">
				<li class="fieldcontain">
					<span id="containing-label" class="property-label"><g:message code="bottle.containing.label" default="Containing" /></span>
					
						<span class="property-value" aria-labelledby="containing-label"><g:fieldValue bean="${bottleInstance}" field="containing"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.quantity}">
				<li class="fieldcontain">
					<span id="quantity-label" class="property-label"><g:message code="bottle.quantity.label" default="Quantity" /></span>
					
						<span class="property-value" aria-labelledby="quantity-label"><g:fieldValue bean="${bottleInstance}" field="quantity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="bottle.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${bottleInstance}" field="year"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.yearMin}">
				<li class="fieldcontain">
					<span id="yearMin-label" class="property-label"><g:message code="bottle.yearMin.label" default="Year Min" /></span>
					
						<span class="property-value" aria-labelledby="yearMin-label"><g:fieldValue bean="${bottleInstance}" field="yearMin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.yearMax}">
				<li class="fieldcontain">
					<span id="yearMax-label" class="property-label"><g:message code="bottle.yearMax.label" default="Year Max" /></span>
					
						<span class="property-value" aria-labelledby="yearMax-label"><g:fieldValue bean="${bottleInstance}" field="yearMax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.ownerId}">
				<li class="fieldcontain">
					<span id="ownerId-label" class="property-label"><g:message code="bottle.ownerId.label" default="Owner Id" /></span>
					
						<span class="property-value" aria-labelledby="ownerId-label"><g:fieldValue bean="${bottleInstance}" field="ownerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="bottle.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${bottleInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.dealer}">
				<li class="fieldcontain">
					<span id="dealer-label" class="property-label"><g:message code="bottle.dealer.label" default="Dealer" /></span>
					
						<span class="property-value" aria-labelledby="dealer-label"><g:link controller="dealer" action="show" id="${bottleInstance?.dealer?.id}">${bottleInstance?.dealer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="bottle.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${bottleInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.purchaseDate}">
				<li class="fieldcontain">
					<span id="purchaseDate-label" class="property-label"><g:message code="bottle.purchaseDate.label" default="Purchase Date" /></span>
					
						<span class="property-value" aria-labelledby="purchaseDate-label"><g:formatDate date="${bottleInstance?.purchaseDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${bottleInstance?.wine}">
				<li class="fieldcontain">
					<span id="wine-label" class="property-label"><g:message code="bottle.wine.label" default="Wine" /></span>
					
						<span class="property-value" aria-labelledby="wine-label"><g:link controller="wine" action="show" id="${bottleInstance?.wine?.id}">${bottleInstance?.wine?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bottleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bottleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
