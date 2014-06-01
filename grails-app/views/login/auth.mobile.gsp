<html>
<head>
	<title><g:message code="springSecurity.login.title"/></title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<r:require module="jquery-mobile" />
	<r:require module="application" />
	
    <r:layoutResources/>
	
	<link rel="stylesheet" href="${resource(dir: 'css/themes', file: 'cave.css')}" >
	<link rel="stylesheet" href="${resource(dir: 'css/themes', file: 'cave.min.css')}" >
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'login.mobile.css')}" >
	
</head>

<body>
	<div data-role="page" >
		<div data-role="content" >
			<div class="content-secondary">
				<p></p>
			</div>
			<div class="content-primary" >
				<form action='${postUrl}' method='POST' id='loginForm' autocomplete='off'>
					<ul id="headerLogin" data-role="listview" data-inset="true">
					<h1><g:message code="springSecurity.login.header"/></h1>
					<p></p>
					
					<div class="ui-grid-a">
						<div class="ui-block-a">
    	        			<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
    	        		</div>	
    	        		<div class="ui-block-b">
        	    			<input type='text' class='text_' name='j_username' id='username'/>
	            		</div>
	            	</div>
	            	
					<div class="ui-grid-a">
						<div class="ui-block-a">
	            			<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
	            		</div>
	            		<div class="ui-block-b">	
    	        			<input type='password' class='text_' name='j_password' id='password'/>
        	    		</div>
        	    	</div>	
					
					<div class="ui-grid-b">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">
							<label for="remember_me"><g:message code="springSecurity.login.remember.me.label"/></label>
           					<input type="checkbox" data-inline="true" name="${rememberMeParameter}" id="remember_me" <g:if test="${hasCookie}">checked="checked"</g:if> />
           				</div>
           				<div class="ui-block-c">&nbsp;</div>
           			</div>
           				
					<div class="ui-grid-b">
						<div class="ui-block-a">&nbsp;</div>
						<div class="ui-block-b">
           					<a id="btnlogin" data-role="button" data-inline="true" data-icon="arrow-r" data-iconpos="right" href="javascript:document.forms['loginForm'].submit();"><span>${message(code: 'springSecurity.login.button')}</span></a>
           				</div>
           				<div class="ui-block-c">&nbsp;</div>	
           			</div>
            		
            		</ul>
				</form>
			</div> <!-- content-primary -->
		</div> <!-- data-role content -->
	</div> <!--  data-role page -->
	<script type='text/javascript'>
		<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
		// -->
	</script>
</body>
</html>
