
<%@ page import="mycompany.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><<g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
    <div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			
			<h1><g:message code="user.show.label.mobile" default="Detail" /></h1>
		</div>
        <div data-role="content">
            <g:if test="${flash.message}">
            	<div class="message">${flash.message}</div>
            </g:if>
            <div class="content-primary">
            <fieldset id="formContent" class="ui-body ui-body-${message(code: 'jquery.data.theme', default: 'c')} ui-corner-all">
            <ol class="property-list user">
				<g:if test="${userInstance?.username}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.username.label" default="Username" /> :</label></div>
					<div class="ui-block-b">
					
						<g:fieldValue bean="${userInstance}" field="username"/>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.password}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.password.label" default="Password" /> :</label></div>
					<div class="ui-block-b">
					
						<g:fieldValue bean="${userInstance}" field="password"/>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.accountExpired}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.accountExpired.label" default="Account Expired" /> :</label></div>
					<div class="ui-block-b">
					
						<g:formatBoolean boolean="${userInstance?.accountExpired}" />
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.accountLocked}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.accountLocked.label" default="Account Locked" /> :</label></div>
					<div class="ui-block-b">
					
						<g:formatBoolean boolean="${userInstance?.accountLocked}" />
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.email}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.email.label" default="Email" /> :</label></div>
					<div class="ui-block-b">
					
						<g:fieldValue bean="${userInstance}" field="email"/>
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.enabled}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.enabled.label" default="Enabled" /> :</label></div>
					<div class="ui-block-b">
					
						<g:formatBoolean boolean="${userInstance?.enabled}" />
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.passwordExpired.label" default="Password Expired" /> :</label></div>
					<div class="ui-block-b">
					
						<g:formatBoolean boolean="${userInstance?.passwordExpired}" />
					
					</div>
				</div>
				</g:if>
			
				<g:if test="${userInstance?.realname}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="user.realname.label" default="Realname" /> :</label></div>
					<div class="ui-block-b">
						<g:fieldValue bean="${userInstance}" field="realname"/>
					</div>
				</div>
				</g:if>
			
			</ol>
            </fieldset>
            </div>
        </div>    
 	    <div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
        	<g:form>
            	<g:hiddenField name="id" value="${userInstance?.id}" />
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
	</body>
</html>
