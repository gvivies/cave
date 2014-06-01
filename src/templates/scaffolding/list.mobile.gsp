<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
	<div data-role="page" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			<a href="/cave/home" data-icon="home"><g:message code="default.home" /></a>
			<h1><g:message code="index.${domainClass.propertyName}.label" default="List" /></h1>
		</div>
		<div data-role="content" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}" >
			<g:if test="\${flash.message}">
				<div class="message">\${flash.message}</div>
			</g:if>
			<div class="content-primary">
				<ul data-role="listview" data-filter="true" data-inset="true">
					<%  excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'ownerId'
						allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
						props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
						Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
					%>
					<g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
            			<li>
            				<g:link action="show" id="\${${propertyName}.id}">
							<%  props.eachWithIndex { p, i ->
							if (i == 0) { %>
								<h3>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</h3>
							<%  } else if (i < 6) {
								if (p.type == Boolean || p.type == boolean) { %>
									<p><label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /> : </label><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></p>
							<%      } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
									<p><label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /> : </label><g:formatDate date="\${${propertyName}.${p.name}}" /></p>
							<%      } else { %>
									<p><label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /> : </label>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</p>
							<%  }   }   } %>
							</g:link>
            			</li>
					</g:each>
				</ul>
			</div>
			<div data-role="footer" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
            	<div class="ui-grid-d">
            		<div id="button-block-a" class="ui-block-a"><g:link data-role="button" data-mini="true" data-icon="plus" data-iconpos="top" action="create"><g:message code="default.button.create.label" default="Create" /></g:link></div>
            		<div id="button-block-b" class="ui-block-b"></div>
            		<div id="button-block-c" class="ui-block-c"></div>
            		<div id="button-block-d" class="ui-block-d"></div>
            		<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
            	</div>	
			</div>
		</div>
	</div> 	
	</body>
</html>
