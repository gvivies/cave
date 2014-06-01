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
				<label for="email"><g:message code="user.email.label" default="Email" /> :</label>
			</div>
			<div class="ui-block-b ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
				<g:textField  name="email" value="${userInstance?.email}"/>
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
	
