

<%@ page import="mycompany.Wine" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
	    <div id="tabs">
      	    <div class="inactivetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="activetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <g:userTab admin='${isAdmin}' />
        </div>
        <div id="actions">
	        <div class="nav">
	             <span class="menuButton"><g:link class="list" action="list"><g:message code="wine.list.label" args="[entityName]" /></g:link></span>
    	    </div>
        </div>
        <div id="content">   
            <h1><g:message code="wine.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${wineInstance}">
            <div class="errors">
                <g:renderErrors bean="${wineInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="wine.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wineInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${wineInstance?.name}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="region"><g:message code="wine.region.label" default="Region" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wineInstance, field: 'region', 'errors')}">
                                    <g:select name="region.id" from="${regionList}" optionKey="id" optionValue="name"/>
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
