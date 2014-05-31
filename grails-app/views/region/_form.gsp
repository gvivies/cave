<%@ page import="com.gvivies.cave.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="region.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${regionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'ownerId', 'error')} required">
	<label for="ownerId">
		<g:message code="region.ownerId.label" default="Owner Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerId" required="" value="${regionInstance?.ownerId}"/>
</div>

