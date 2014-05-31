<%@ page import="com.gvivies.cave.Classification" %>



<div class="fieldcontain ${hasErrors(bean: classificationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="classification.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${classificationInstance?.name}"/>
</div>

