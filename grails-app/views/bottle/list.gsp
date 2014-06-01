<%@ page import="mycompany.Bottle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bottle.label', default: 'Bottle')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'dashboard.css')}" />
        <g:javascript library="dashboard" />
        <g:javascript library="drink" />
        <g:javascript library="filter" />
        <r:require module="export"/>
    </head>
    <body>
	    <div id="tabs">
      	    <div class="activetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <g:userTab admin='${isAdmin}' />
        </div>

        <g:notification id="notifications" from="${notificationList}" />

        <div id="actions">
	        <div class="nav">
            	<span class="menuButton"><g:link class="create" action="create"><g:message code="bottle.new.label" args="[entityName]" /></g:link></span>
	            <g:searchWidget id="filtered" name="filtered" value="${params.filtered}" additionalFilter="${params.additionalFilter}" from="${regionList}"/>
    	    </div>
        </div>
        <g:render template = 'drinkPopup' />
        <div id="content">
            <h1><g:message code="bottle.list.label" args="[entityName]" /> (${bottleInstanceTotal} vins - ${bottlesCount} bouteilles)</h1>
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th class="actioncolumn">&nbsp;</th>
                            <g:sortableColumn property="name" title="${message(code: 'bottle.name.label', default: 'Name')}" />
                            <th><g:message code="bottle.region.label" default="Region" /></th>
                            <th><g:message code="bottle.wine.label" default="Wine" /></th>
                            <g:sortableColumn property="type" title="${message(code: 'wine.type.label', default: 'Type')}" />
                            <g:sortableColumn property="year" title="${message(code: 'bottle.year.label', default: 'Year')}" />
                            <g:sortableColumn property="quantity" title="${message(code: 'bottle.quantity.label', default: 'Quantity')}" />
                            <th><g:message code="bottle.dealer.label" default="Dealer" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bottleInstanceList}" status="i" var="bottleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><div class="arrayButton" id="drinkBottles${bottleInstance.id}">
                            		<a class="drink-btn" href="javascript:drinkSomeBottle(${bottleInstance.id}, ${bottleInstance.quantity});">boire</a>
                            	</div>
                            </td>
                            <td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "name")}</g:link><g:hiddenField name="wine${bottleInstance.id}" value="${bottleInstance?.name}" /></td>
                            <td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "wine.region.name")}</g:link></td>
                            <td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "wine.name")}</g:link></td>
                            <td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "type")}</g:link></td>
                            <td class="year"><g:link action="show" id="${bottleInstance.id}"><g:formatNumber format="####" number="${bottleInstance?.year}" /></g:link></td>
                            <td class="quantity"><g:link action="show" id="${bottleInstance.id}"><div id="quantity_${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "quantity")}</div></g:link></td>
                            <td><g:link action="show" id="${bottleInstance.id}">${fieldValue(bean: bottleInstance, field: "dealer.name")}</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bottleInstanceTotal}" controller="bottle" action="search" params="${params}" />
            </div>
            <export:formats formats="['excel']" />
        </div>

    </body>
</html>
