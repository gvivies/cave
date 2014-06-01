<%@ page import="mycompany.Region" %>



		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="name"><g:message code="region.name.label" default="Name" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: regionInstance, field: 'name', 'error')} required">
				
				<g:textField  name="name" required="" value="${regionInstance?.name}"/>
			</div>
		</div>	
	
