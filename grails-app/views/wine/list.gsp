
<%@ page import="mycompany.Wine" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wine.label', default: 'Wine')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <g:javascript library="filter" />
    </head>
    <body>
	    <div id="tabs">
      	    <div class="inactivetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="activetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <g:userTab admin="${isAdmin}" />
        </div>
        <div id="actions">
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="wine.new.label" args="[entityName]" /></g:link></span>
	            <g:searchWidget name="filtered" value="${params.filtered}" additionalFilter="${params.additionalFilter}" from="${regionList}"/>
    	    </div>
        </div>
        <div id="content">   
            <h1><g:message code="wine.list.label" args="[entityName]" /> (${wineInstanceTotal})</h1>
            <g:if test="${flash.message}">
           		 <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="name" title="${message(code: 'wine.name.label', default: 'Nom')}" />
                            <th><g:message code="wine.region.label" default="Region" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${wineInstanceList}" status="i" var="wineInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${wineInstance.id}">${fieldValue(bean: wineInstance, field: "name")}</g:link></td>
                            <td><g:link action="show" id="${wineInstance.id}">${fieldValue(bean: wineInstance, field: "region.name")}</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${wineInstanceTotal}" params="${[additionalFilter:params.additionalFilter, filtered: params.filtered]}" />
            </div>
        </div>
    </body>
</html>
