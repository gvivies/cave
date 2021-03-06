<%@ page import="mycompany.Wine" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
    	        <span class="menuButton"><g:link class="create" action="create"><g:message code="wine.new.label" args="[entityName]" /></g:link></span>
    	    </div>
        </div>
        <div id="content"> 
            <h1><g:message code="wine.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wine.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: wineInstance, field: "name")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="wine.region.label" default="Region" /></td>
                            <td valign="top" class="shortcut"><g:link controller="region" action="show" id="${wineInstance?.region?.id}">${wineInstance?.region?.name?.encodeAsHTML()}</g:link></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${wineInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
