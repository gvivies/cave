<%@ page import="mycompany.Bottle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
        <title><g:message code="index.title" default="Cellar management" /></title>
        <g:javascript library="datepicker" />
    </head>
    <body>
    	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >
		    <g:form method="post" >
	    	<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
				<h1><g:message code="bottle.edit.label.mobile" default="Edit bottle" /></h1>
			</div>
	        <div data-role="content">
            	<h3><g:message code="bottle.edit.label" args="[entityName]" /></h3>
            	<g:if test="${flash.message}">
           			<div class="message">${flash.message}</div>
            	</g:if>
            	<g:hasErrors bean="${bottleInstance}">
            		<div class="errors">
               			<g:renderErrors bean="${bottleInstance}" as="list" />
            		</div>
            	</g:hasErrors>
            	<div class="content-primary">
            		<fieldset id="formContent" class="form ui-body ui-body-${message(code: 'jquery.data.theme', default: 'c')} ui-corner-all">
               		<g:hiddenField name="id" value="${bottleInstance?.id}" />
               		<g:hiddenField name="version" value="${bottleInstance?.version}" />
       				<div class="ui-grid-a">
       					<div class="ui-block-a"><label for="name"><g:message code="bottle.name.label" default="Name" /> :</label></div>
       					<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'name', 'errors')}">
           					<g:textField data-theme="${message(code: 'jquery.data.theme', default: 'c')}" name="name" value="${bottleInstance?.name}" />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="wine"><g:message code="bottle.wine.label" default="Wine" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'wine', 'errors')}">
           					<g:select data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-native-menu="false" name="wine.id" from="${wineList}" optionKey="id" value="${bottleInstance?.wine?.id}" optionValue="name" />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="type"><g:message code="bottle.type.label" default="Type" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'type', 'errors')}">
           					<g:select data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-native-menu="false" name="type" from="${bottleInstance.constraints.type.inList}" value="${bottleInstance?.type}" valueMessagePrefix="bottle.type"  />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="year"><g:message code="bottle.year.label" default="Year" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'year', 'errors')}">
           					<g:selectYear name="year" from="${bottleInstance.constraints.year.inList}" value="${bottleInstance?.year}" valueMessagePrefix="bottle.year"  />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="year"><g:message code="bottle.yearmin.label" default="YearMin" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'yearMin', 'errors')}">
           					<g:selectYear name="yearMin" from="${bottleInstance.constraints.yearMin.inList}" value="${bottleInstance?.yearMin}" valueMessagePrefix="bottle.yearMin"  />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="year"><g:message code="bottle.yearmax.label" default="YearMax" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'yearMax', 'errors')}">
           					<g:selectYear name="yearMax" from="${bottleInstance.constraints.yearMax.inList}" value="${bottleInstance?.yearMax}" valueMessagePrefix="bottle.yearMax"  />
           				</div>
           			</div>
           			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="dealer"><g:message code="bottle.dealer.label" default="Dealer" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'dealer', 'errors')}">
           					<g:select data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-native-menu="false" name="dealer.id" from="${dealerList}" optionKey="id" value="${bottleInstance?.dealer?.id}"  optionValue="name"  />
           				</div>
           			</div>
          			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="quantity"><g:message code="bottle.quantity.label" default="Quantity" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'quantity', 'errors')}">
           					<g:textField data-theme="${message(code: 'jquery.data.theme', default: 'c')}" name="quantity" value="${fieldValue(bean: bottleInstance, field: 'quantity')}" />
           				</div>
           			</div>
          			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="type"><g:message code="bottle.containing.label" default="Containing" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'containing', 'errors')}">
           					<g:select data-theme="${message(code: 'jquery.data.theme', default: 'c')}" data-native-menu="false" name="containing" from="${bottleInstance.constraints.containing.inList}" value="${bottleInstance?.containing}" valueMessagePrefix="bottle.containing"  />
           				</div>
           			</div>
          			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="price"><g:message code="bottle.price.label" default="Price" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'price', 'errors')}">
           					<g:textField data-theme="${message(code: 'jquery.data.theme', default: 'c')}" name="price" value="${bottleInstance?.price}" />
           				</div>
           			</div>
          			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="purchaseDate"><g:message code="bottle.purchaseDate.label" default="Purchase Date" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'purchaseDate', 'errors')}">
           					<g:textField data-theme="${message(code: 'jquery.data.theme', default: 'c')}" name="purchaseDate" value="${formatDate(format: 'dd/MM/yyyy', date: bottleInstance?.purchaseDate)}" />
           				</div>
           			</div>
          			<div class="ui-grid-a">
           				<div class="ui-block-a"><label for="comment"><g:message code="bottle.comment.label" default="Comment" /></label></div>
           				<div class="ui-block-b" class="value ${hasErrors(bean: bottleInstance, field: 'comment', 'errors')}">
           					<g:textArea name="comment" value="${bottleInstance?.comment}" rows="5" cols="50" />
           				</div>
           			</div>
           			</fieldset>
				</div> <!-- content-primary -->
       			
       		</div>  <!-- data-role content -->
       		
       		<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
            	<div class="ui-grid-d">
   	        		<div id="button-block-a" class="ui-block-a"><g:actionSubmit data-mini="true" data-iconpos="top" data-icon="check" action="update" value="${message(code: 'default.button.save.label', default: 'Save')}" /></div>
   					<div id="button-block-b" class="ui-block-b"><g:actionSubmit data-mini="true" data-iconpos="top" data-icon="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></div>
					<div id="button-block-c" class="ui-block-c"><g:link data-mini="true" data-iconpos="top" data-role="button" data-mini="true" data-icon="back" action="list"><g:message code="default.button.back.label" default="Back" /></g:link></div>
					<div id="button-block-a" class="ui-block-d"></div>
					<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
				</div>
			</div>	 <!-- data-role footer -->
		    </g:form>    
	    </div> <!-- data-role page -->
    </body>
</html>
