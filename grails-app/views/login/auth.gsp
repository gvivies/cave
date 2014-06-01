<html>
<head>
	<!-- meta name='layout' content='main'/ -->
	<title><g:message code="springSecurity.login.title"/></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'login.css')}" />
</head>

<body>
<div id='login'>
	<div class='inner'>
		<div class='fheader'>
			<div class="label"><g:message code="springSecurity.login.header"/></div>
		</div>	
		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			<p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>
			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>
			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>
			<div id="command"> 
				<a class="button" href="javascript:document.forms['loginForm'].submit();"><span>${message(code: 'springSecurity.login.button')}</span></a>
			</div>
		</form>
	</div>
</div>
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
