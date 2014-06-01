<%@ page import="mycompany.Bottle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
        <title><g:message code="index.title" default="Cellar management" /></title>
    </head>
    <body>
    	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >
			<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
				<h1><g:message code="bottle.show.label.mobile" default="Bottle" /></h1>
			</div>
        	<div data-role="content">
            	<g:if test="${flash.message}">
            		<div class="message">${flash.message}</div>
            	</g:if>
            	<div class="content-primary">
            		<fieldset id="formContent" class="form ui-body ui-body-${message(code: 'jquery.data.theme', default: 'c')} ui-corner-all">          
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label for="name"><g:message code="bottle.name.label" default="Name" /> :</label></div>
            			<div class="ui-block-b">${fieldValue(bean: bottleInstance, field: "name")}</div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label for="name"><g:message code="bottle.wine.label" default="Name" /> :</label></div>
            			<div class="ui-block-b"><g:link controller="wine" action="show" id="${bottleInstance?.wine?.id}">${bottleInstance?.wine?.name?.encodeAsHTML()}</g:link></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.year.label" default="Year" /> :</label></div>
            			<div class="ui-block-b"><g:formatNumber format="####" number="${bottleInstance?.year}" /></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.yearmin.label" default="Year" /> :</label></div>
            			<div class="ui-block-b"><g:formatNumber format="####" number="${bottleInstance?.yearMin}" /></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.yearmax.label" default="Year" /> :</label></div>
            			<div class="ui-block-b"><g:formatNumber format="####" number="${bottleInstance?.yearMax}" /></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.type.label" default="Type" /> :</label></div>
            			<div class="ui-block-b">${fieldValue(bean: bottleInstance, field: "type")}</div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.dealer.label" default="Dealer" /> :</label></div>
            			<div class="ui-block-b"><g:link controller="dealer" action="show" id="${bottleInstance?.dealer?.id}">${bottleInstance?.dealer?.name?.encodeAsHTML()}</g:link></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.quantity.label" default="Quantity" /> :</label></div>
            			<div class="ui-block-b">${fieldValue(bean: bottleInstance, field: "quantity")}</div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.containing.label" default="Containing" /> :</label></div>
            			<div class="ui-block-b">${fieldValue(bean: bottleInstance, field: "containing")}</div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.price.label" default="Price" /> :</label></div>
            			<div class="ui-block-b"><g:formatNumber number="${bottleInstance?.price}" type="currency" currencyCode="EUR" /></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.purchaseDate.label" default="Purchase Date" /> :</label></div>
            			<div class="ui-block-b"><g:formatDate format="dd/MM/yyyy" date="${bottleInstance?.purchaseDate}" /></div>
            		</div>
            		<div class="ui-grid-a">
            			<div class="ui-block-a"><label><g:message code="bottle.comment.label" default="Comment" /> :</label></div>
            			<div class="ui-block-b">${fieldValue(bean: bottleInstance, field: "comment")}</div>
            		</div>
            		</fieldset>
	            </div> <!-- content-primary -->
            </div> <!-- data-role content -->
            
	 	    <div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
    	    	<g:form>
        	    	<g:hiddenField name="id" value="${bottleInstance?.id}" />
					<div class="ui-grid-d">
           				<div id="button-block-a" class="ui-block-a"><g:link data-mini="true" data-iconpos="top" data-role="button" data-icon="add" action="create" data-iconpos="bottom"><g:message code="bottle.new.label.mobile" default="New" /></g:link></div>
        				<div id="button-block-b" class="ui-block-b"><g:actionSubmit data-mini="true" data-iconpos="top" data-icon="gear" data-iconpos="bottom" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></div>
        				<div id="button-block-c" class="ui-block-c"><g:actionSubmit data-mini="true" data-iconpos="top"  data-icon="delete" action="delete" data-iconpos="bottom" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></div>
						<div id="button-block-d" class="ui-block-d"><g:link data-mini="true" data-iconpos="top" data-role="button" data-icon="back" action="list" data-iconpos="bottom"><g:message code="bottle.list.label.mobile" default="List" /></g:link></div>
           				<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
					</div>
				</g:form>
			</div>	 <!-- data-role footer -->
		</div> <!--  data-role page -->
    </body>
</html>
