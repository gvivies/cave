
<%@ page import="mycompany.Dealer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	    <div id="tabs">
      	    <div class="inactivetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="activetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <g:userTab admin='${isAdmin}' />
        </div>
        <div id="actions">
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="dealer.new.label" args="[entityName]" /></g:link></span>
            	<g:searchWidget name="filtered" value="${params.filtered}" />
    	    </div>
        </div>
        <div id="content">    
            <h1><g:message code="dealer.list.label" args="[entityName]" /> (${dealerInstanceTotal})</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'dealer.name.label', default: 'Name')}" />
                            <g:sortableColumn property="street" title="${message(code: 'dealer.street.label', default: 'Street')}" />
                            <g:sortableColumn property="city" title="${message(code: 'dealer.city.label', default: 'City')}" />
                            <g:sortableColumn property="zipCode" title="${message(code: 'dealer.zipCode.label', default: 'Zip Code')}" />
                            <g:sortableColumn property="telephone" title="${message(code: 'dealer.telephone.label', default: 'Telephone')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dealerInstanceList}" status="i" var="dealerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "name")}</g:link></td>
                            <td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "street")}</g:link></td>
                            <td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "city")}</g:link></td>
                            <td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "zipCode")}</g:link></td>
                            <td><g:link action="show" id="${dealerInstance.id}">${fieldValue(bean: dealerInstance, field: "telephone")}</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dealerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
