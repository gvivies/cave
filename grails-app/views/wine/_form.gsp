<%@ page import="mycompany.Wine" %>



		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="name"><g:message code="wine.name.label" default="Name" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: wineInstance, field: 'name', 'error')} required">
				
				<g:textField  name="name" required="" value="${wineInstance?.name}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
					<label for="region"><g:message code="wine.region.label" default="Region" /> :</label>
			</div>
			<div class="ui-block-b ${hasErrors(bean: wineInstance, field: 'region', 'error')} required">
				<g:select data-native-menu="false" id="region" name="region.id" from="${regionList}" optionKey="id" required="" value="${wineInstance?.region?.id}" optionValue="name" class="many-to-one"/>
			</div>
		</div>	
	
