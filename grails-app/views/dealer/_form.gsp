<%@ page import="com.gvivies.cave.Dealer" %>



<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="dealer.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${dealerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'telephone', 'error')} ">
	<label for="telephone">
		<g:message code="dealer.telephone.label" default="Telephone" />
		
	</label>
	<g:textField name="telephone" maxlength="10" value="${dealerInstance?.telephone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'ownerId', 'error')} required">
	<label for="ownerId">
		<g:message code="dealer.ownerId.label" default="Owner Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerId" required="" value="${dealerInstance?.ownerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="dealer.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${dealerInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="dealer.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${dealerInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="dealer.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${dealerInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'latitude', 'error')} ">
	<label for="latitude">
		<g:message code="dealer.latitude.label" default="Latitude" />
		
	</label>
	<g:textField name="latitude" value="${dealerInstance?.latitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'longitude', 'error')} ">
	<label for="longitude">
		<g:message code="dealer.longitude.label" default="Longitude" />
		
	</label>
	<g:textField name="longitude" value="${dealerInstance?.longitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'street', 'error')} ">
	<label for="street">
		<g:message code="dealer.street.label" default="Street" />
		
	</label>
	<g:textField name="street" value="${dealerInstance?.street}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'webSite', 'error')} ">
	<label for="webSite">
		<g:message code="dealer.webSite.label" default="Web Site" />
		
	</label>
	<g:textField name="webSite" value="${dealerInstance?.webSite}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dealerInstance, field: 'zipCode', 'error')} ">
	<label for="zipCode">
		<g:message code="dealer.zipCode.label" default="Zip Code" />
		
	</label>
	<g:textField name="zipCode" value="${dealerInstance?.zipCode}"/>
</div>

