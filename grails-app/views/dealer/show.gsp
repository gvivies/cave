
<%@ page import="com.gvivies.cave.Dealer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dealer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dealer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dealer">
			
				<g:if test="${dealerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="dealer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${dealerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="dealer.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${dealerInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.ownerId}">
				<li class="fieldcontain">
					<span id="ownerId-label" class="property-label"><g:message code="dealer.ownerId.label" default="Owner Id" /></span>
					
						<span class="property-value" aria-labelledby="ownerId-label"><g:fieldValue bean="${dealerInstance}" field="ownerId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="dealer.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${dealerInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="dealer.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${dealerInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="dealer.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${dealerInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="dealer.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${dealerInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="dealer.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${dealerInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="dealer.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${dealerInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.webSite}">
				<li class="fieldcontain">
					<span id="webSite-label" class="property-label"><g:message code="dealer.webSite.label" default="Web Site" /></span>
					
						<span class="property-value" aria-labelledby="webSite-label"><g:fieldValue bean="${dealerInstance}" field="webSite"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dealerInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="dealer.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${dealerInstance}" field="zipCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:dealerInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${dealerInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
