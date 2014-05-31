<%@ page import="com.gvivies.cave.Wine" %>



<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="wine.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${wineInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'ownerId', 'error')} required">
	<label for="ownerId">
		<g:message code="wine.ownerId.label" default="Owner Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerId" required="" value="${wineInstance?.ownerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wineInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="wine.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${com.gvivies.cave.Region.list()}" optionKey="id" required="" value="${wineInstance?.region?.id}" class="many-to-one"/>
</div>

