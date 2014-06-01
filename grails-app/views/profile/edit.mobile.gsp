<%@ page import="mycompany.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
    <body>
    	<div data-role="page" data-theme="${message(code: 'jquery.data.theme', default: 'c')}" >
		    <g:form method="post" >
				<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
					
						<h1><g:message code="profile.edit.label" default="Edit" /></h1>
				</div>
	        	<div data-role="content">
	        		<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					<g:hasErrors bean="${userInstance}">
						<ul class="errors" role="alert">
							<g:eachError bean="${userInstance}" var="error">
								<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</g:hasErrors>
	            	<div class="content-primary">
						<g:hiddenField name="id" value="${userInstance?.id}" />
						<g:hiddenField name="version" value="${userInstance?.version}" />
		           		<div class="content-primary">
							<fieldset class="form">
								<g:render template="form.mobile"/>
							</fieldset>
           				</div>
	        	</div>
   	       		<div data-role="footer" data-theme="${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
	            	<div class="ui-grid-d">
    	        		<div id="button-block-a" class="ui-block-a"><g:actionSubmit data-mini="true" data-iconpos="top" data-icon="check" action="update" value="${message(code: 'default.button.save.label', default: 'Save')}" /></div>
       					<div id="button-block-b" class="ui-block-b"></div>
						<div id="button-block-c" class="ui-block-c"></div>
						<div id="button-block-d" class="ui-block-d"></div>
						<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
					</div>
				</div>
			</g:form>
		</div>
	</body>		
</html>
