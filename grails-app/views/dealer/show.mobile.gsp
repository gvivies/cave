
<%@ page import="mycompany.Dealer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dealer.label', default: 'Dealer')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
    <div id="showDealerPage" data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >
		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			<h1><g:message code="dealer.show.label.mobile" default="Detail" /></h1>
		</div>
        <div data-role="content">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="content-primary">
            <fieldset id="formContent" class="ui-body ui-body-${message(code: 'jquery.data.theme', default: 'c')} ui-corner-all">
            <ol class="property-list dealer">
				<g:if test="${dealerInstance?.name}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.name.label" default="Name" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="name"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.telephone}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.telephone.label" default="Telephone" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="telephone"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.city}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.city.label" default="City" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="city"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.comment}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.comment.label" default="Comment" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="comment"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.email}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.email.label" default="Email" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="email"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.street}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.street.label" default="Street" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="street"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.webSite}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.webSite.label" default="Web Site" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="webSite"/>
					</div>
				</div>
				</g:if>
				<g:if test="${dealerInstance?.zipCode}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="dealer.zipCode.label" default="Zip Code" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${dealerInstance}" field="zipCode"/>
					</div>
				</div>
				</g:if>
				<g:if test="${bottles}">
				   <div id="dealersBottles">
						<ul data-role="listview">
						  <h3><g:message code="dealer.bottles.label" default="Bottles" /></h3>
    	                  <g:each in="${bottles}" status="i" var="bottle">
                           	<li>
                           	<g:link action="show" id="${bottle.id}">
								<p>${bottle?.quantity} ${bottle?.name} <g:formatNumber format="####" number="${bottle?.year}" /> - ${bottle?.wine?.name} (${bottle?.wine?.region?.name}) - ${bottle?.type}</p>
							</g:link>
                           	</li>
	                      </g:each>
                        </ul>
                   </div>        
				</g:if>
			</ol>
			<g:if test="${showMap}" >
        			<div id="map_canvas">
        				<g:hiddenField name="latitude" value="${dealerInstance?.latitude}" />
        				<g:hiddenField name="longitude" value="${dealerInstance?.longitude}" />
        			</div>
       		</g:if>
            </fieldset>
            </div>
        </div>    
 	    <div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
        	<g:form>
            	<g:hiddenField name="id" value="${dealerInstance?.id}" />
            	<div class="ui-grid-d">
            		<div id="button-block-a" class="ui-block-a"><g:link data-mini="true" data-role="button" data-icon="add" data-iconpos="top" action="create" data-inline="true"><g:message code="default.button.create.label" default="Create" /></g:link></div>
        			<div id="button-block-b" class="ui-block-b"><g:actionSubmit data-mini="true" data-icon="gear" data-iconpos="top" data-inline="true" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></div>
        			<div id="button-block-c" class="ui-block-c"><g:actionSubmit data-mini="true" data-icon="delete" data-iconpos="top" data-inline="true" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></div>
					<div id="button-block-d" class="ui-block-d"><g:link data-mini="true" data-role="button" data-icon="back" data-iconpos="top" data-inline="true" action="list"><g:message code="default.button.back.label" default="Back" /></g:link></div>
					<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
				</div>
			</g:form>
		</div>
	</div>
	<g:javascript library="mapMobile" />
	
	</body>
</html>
