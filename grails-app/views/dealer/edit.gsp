

<%@ page import="mycompany.Dealer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
	            <span class="menuButton"><g:link class="list" action="list"><g:message code="dealer.list.label" args="[entityName]" /></g:link></span>
    	        <span class="menuButton"><g:link class="create" action="create"><g:message code="dealer.new.label" args="[entityName]" /></g:link></span>
    	    </div>
        </div>
        <div id="content">
            <h1><g:message code="dealer.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dealerInstance}">
            <div class="errors">
                <g:renderErrors bean="${dealerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dealerInstance?.id}" />
                <g:hiddenField name="version" value="${dealerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="dealer.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${dealerInstance?.name}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="street"><g:message code="dealer.street.label" default="Street" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'street', 'errors')}">
                                    <g:textField name="street" value="${dealerInstance?.street}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="zipCode"><g:message code="dealer.zipCode.label" default="Zip Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'zipCode', 'errors')}">
                                    <g:textField name="zipCode" value="${dealerInstance?.zipCode}" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="dealer.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${dealerInstance?.city}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="telephone"><g:message code="dealer.telephone.label" default="Telephone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'telephone', 'errors')}">
                                    <g:textField name="telephone" value="${dealerInstance?.telephone}" maxlength="10" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="dealer.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${dealerInstance?.email}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="webSite"><g:message code="dealer.website.label" default="Web site" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'webSite', 'errors')}">
                                    <g:textField name="webSite" value="${dealerInstance?.webSite}" size="50" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="comment"><g:message code="dealer.comment.label" default="Comment" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dealerInstance, field: 'comment', 'errors')}">
                                    <g:textArea name="comment" value="${dealerInstance?.comment}" rows="5" cols="50" />
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
