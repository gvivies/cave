
<%@ page import="mycompany.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	    <div id="tabs">
      	    <div class="inactivetab"><g:link controller="bottle">${message(code: 'index.bottle.label', default: 'Bottles')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="wine">${message(code: 'index.wine.label', default: 'Wines')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="region">${message(code: 'index.region.label', default: 'Regions')}</g:link></div>
      	    <div class="inactivetab"><g:link controller="dealer">${message(code: 'index.dealer.label', default: 'Dealers')}</g:link></div>
      	    <div class="activetab"><g:link controller="user">${message(code: 'index.user.label', default: 'Users')}</g:link></div>
        </div>
        <div id="actions">
	        <div class="nav">
	            <span class="menuButton"><g:link class="create" action="create"><g:message code="user.new.label" args="[entityName]" /></g:link></span>
    	    </div>
        </div>
        <div id="content">
            <h1><g:message code="user.list.label" args="[entityName]" /> (${userInstanceTotal})</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
                            <g:sortableColumn property="role" title="${message(code: 'user.role.label', default: 'Role')}" />
                            <g:sortableColumn property="name" title="${message(code: 'user.realname.label', default: 'Name')}" />
                            <g:sortableColumn property="name" title="${message(code: 'user.email.label', default: 'Email')}" />
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "authorities.authority")}</g:link></td>
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "realname")}</g:link></td>
                            <td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "email")}</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${userInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
