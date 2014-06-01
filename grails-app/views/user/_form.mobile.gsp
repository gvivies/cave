<%@ page import="mycompany.User" %>



		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="username"><g:message code="user.username.label" default="Username" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				
				<g:textField  name="username" required="" value="${userInstance?.username}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="password"><g:message code="user.password.label" default="Password" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				
				<g:textField  name="password" required="" value="${userInstance?.password}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label></label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
				
					<label for="accountExpired"><g:message code="user.accountExpired.label" default="Account Expired" /></label>
				
				<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label></label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
				
					<label for="accountLocked"><g:message code="user.accountLocked.label" default="Account Locked" /></label>
				
				<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="email"><g:message code="user.email.label" default="Email" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
				
				<g:textField  name="email" value="${userInstance?.email}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label></label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
				
					<label for="enabled"><g:message code="user.enabled.label" default="Enabled" /></label>
				
				<g:checkBox name="enabled" value="${userInstance?.enabled}" />
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label></label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
				
					<label for="passwordExpired"><g:message code="user.passwordExpired.label" default="Password Expired" /></label>
				
				<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="realname"><g:message code="user.realname.label" default="Realname" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'realname', 'error')} ">
				
				<g:textField  name="realname" value="${userInstance?.realname}"/>
			</div>
		</div>	
	
