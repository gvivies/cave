<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main" /> 
	<title>Ma cave</title>
</head>
<body>

	<div ng-controller="MainController">
		<div class="main-content">
			<div class="bandeau">
				<div id="title">Ma Cave</div>		
			</div>
			<div menu></div>				
			<div ng-view></div>
		</div>
	</div>
</body>
</html>
