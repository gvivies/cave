<%@ page import="mycompany.Dealer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
        <g:javascript library="map" />
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <h1><g:message code="dealer.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div>
            <div id="formContent" class="dialog">
                <table>
                    <tbody>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.name.label" default="Name" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "name")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.street.label" default="Street" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "street")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.zipCode.label" default="Zip Code" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "zipCode")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.telephone.label" default="Telephone" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "telephone")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.city.label" default="City" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "city")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.email.label" default="Email" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "email")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.website.label" default="Web site" /></td>
                            <td valign="top" class="value">${fieldValue(bean: dealerInstance, field: "webSite")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.comment.label" default="Comment" /></td>
                            <td valign="top" clasbs="value">${fieldValue(bean: dealerInstance, field: "comment")}</td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="dealer.bottles.label" default="Bottles" /></td>
                            <td valign="top" class="value">
                                <g:each in="${bottles}" status="i" var="bottle">
                                	<p>${bottle?.quantity} ${bottle?.name} <g:formatNumber format="####" number="${bottle?.year}" /> - ${bottle?.wine?.name} (${bottle?.wine?.region?.name}) - ${bottle?.type}</p>
                                </g:each>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <g:if test="${showMap}">
        		<div id="map_canvas">
        			<g:hiddenField name="latitude" value="${dealerInstance?.latitude}" />
        			<g:hiddenField name="longitude" value="${dealerInstance?.longitude}" />
        		</div>
        	</g:if>
        	</div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dealerInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
