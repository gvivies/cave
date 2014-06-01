<%@ page import="mycompany.Bottle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <g:javascript library="datepicker" />
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
             </div>	
        </div>
        <div id="content">
            <h1><g:message code="bottle.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bottleInstance}">
            <div class="errors">
                <g:renderErrors bean="${bottleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form controller="bottle" action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="bottle.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${bottleInstance?.name}" size="50" />
                                </td>
                            </tr>                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="wine"><g:message code="bottle.wine.label" default="Wine" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'wine', 'errors')}">
                                    <g:select name="wine.id" from="${wineList}" optionKey="id" value="${bottleInstance?.wine?.id}" optionValue="name" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="bottle.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${bottleInstance.constraints.type.inList}" value="${bottleInstance?.type}" valueMessagePrefix="bottle.type"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="bottle.year.label" default="Year" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'year', 'errors')}">
                                    <g:selectYear name="year" from="${bottleInstance.constraints.year.inList}" value="${fieldValue(bean: bottleInstance, field: 'year')}" valueMessagePrefix="bottle.year"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="bottle.yearmin.label" default="YearMin" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'yearMin', 'errors')}">
                                    <g:selectYear name="yearMin" from="${bottleInstance.constraints.yearMin.inList}" value="${fieldValue(bean: bottleInstance, field: 'yearMin')}" valueMessagePrefix="bottle.yearMin"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="year"><g:message code="bottle.yearmax.label" default="YearMax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'yearMax', 'errors')}">
                                    <g:selectYear name="yearMax" from="${bottleInstance.constraints.yearMax.inList}" value="${fieldValue(bean: bottleInstance, field: 'yearMax')}" valueMessagePrefix="bottle.yearMax"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dealer"><g:message code="bottle.dealer.label" default="Dealer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'dealer', 'errors')}">
                                    <g:select name="dealer.id" from="${dealerList}" optionKey="id" value="${bottleInstance?.dealer?.id}"  optionValue="name"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="quantity"><g:message code="bottle.quantity.label" default="Quantity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'quantity', 'errors')}">
                                    <g:textField name="quantity" value="1" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="bottle.containing.label" default="Containing" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'containing', 'errors')}">
                                    <g:select name="containing" from="${bottleInstance.constraints.containing.inList}" value="${bottleInstance?.containing}" valueMessagePrefix="bottle.containing"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price"><g:message code="bottle.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${bottleInstance?.price}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="purchaseDate"><g:message code="bottle.purchaseDate.label" default="Purchase Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'purchaseDate', 'errors')}">
                                	<g:textField name="purchaseDate" value="${formatDate(format: 'dd/MM/yyyy', date: now)}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment"><g:message code="bottle.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: bottleInstance, field: 'comment', 'errors')}">
                                    <g:textArea name="comment" value="${bottleInstance?.comment}" rows="5" cols="50" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
               	<div class="buttons">
                   	<span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
               	</div>
        </g:form>       	
        </div>
    </body>
</html>
