

<%@ page import="mycompany.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
	            <span class="menuButton"><g:link class="list" action="list"><g:message code="user.list.label" args="[entityName]" /></g:link></span>
    	        <span class="menuButton"><g:link class="create" action="create"><g:message code="user.new.label" args="[entityName]" /></g:link></span>
    	    </div>
        </div>
        <div id="content">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div class="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${userInstance?.id}" />
                <g:hiddenField name="version" value="${userInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="login"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                  <g:textField name="username" value="${userInstance?.username}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <g:passwordField name="password" value="${userInstance?.password}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="role"><g:message code="user.role.label" default="Role" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'role', 'errors')}">
                                    <g:select name="authority" from="${mycompany.Authority.list()}" optionKey="id" value="" optionValue = "authority"  />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="user.realname.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'realname', 'errors')}">
                                    <g:textField name="realname" value="${userInstance?.realname}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
