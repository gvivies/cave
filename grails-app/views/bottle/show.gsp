<%@ page import="mycompany.Bottle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
		<div id="tabs">
      	    <div class="activetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <g:userTab admin='${isAdmin}' />
        </div>
        <div id="actions">
			<div class="nav">
				<span class="menuButton"><g:link class="list" action="list"><g:message code="bottle.list.label" args="[entityName]" /></g:link></span>
				<span class="menuButton"><g:link class="create" action="create"><g:message code="bottle.new.label" args="[entityName]" /></g:link></span>
			</div>
		</div>
        <div id="content">	
            <h1><g:message code="bottle.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: bottleInstance, field: "name")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.wine.label" default="Wine" /></td>
                            <td valign="top" class="shortcut"><g:link controller="wine" action="show" id="${bottleInstance?.wine?.id}">${bottleInstance?.wine?.name?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.year.label" default="Year" /></td>
                            <td valign="top" class="value"><g:formatNumber format="####" number="${bottleInstance?.year}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.yearmin.label" default="Year" /></td>
                            <td valign="top" class="value"><g:formatNumber format="####" number="${bottleInstance?.yearMin}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.yearmax.label" default="Year" /></td>
                            <td valign="top" class="value"><g:formatNumber format="####" number="${bottleInstance?.yearMax}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.type.label" default="Type" /></td>
                            <td valign="top" class="value">${fieldValue(bean: bottleInstance, field: "type")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.dealer.label" default="Dealer" /></td>
                            <td valign="top" class="shortcut"><g:link controller="dealer" action="show" id="${bottleInstance?.dealer?.id}">${bottleInstance?.dealer?.name?.encodeAsHTML()}</g:link></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.quantity.label" default="Quantity" /></td>
                            <td valign="top" class="value">${fieldValue(bean: bottleInstance, field: "quantity")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.containing.label" default="Containing" /></td>
                            <td valign="top" class="value">${fieldValue(bean: bottleInstance, field: "containing")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><label for="price"><g:message code="bottle.price.label" default="Price" /></label></td>
                            <td valign="top" class="value"><g:formatNumber number="${bottleInstance?.price}" type="currency" currencyCode="EUR" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.purchaseDate.label" default="Purchase Date" /></td>
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${bottleInstance?.purchaseDate}" /></td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="bottle.comment.label" default="Comment" /></td>
                            <td valign="top" class="value">${fieldValue(bean: bottleInstance, field: "comment")}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${bottleInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
