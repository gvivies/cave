<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><<g:message code="index.title" default="Cellar management" /></title>
	</head>
	<body>
    <div data-role="page" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}" >

		<div data-role="header" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}"  data-fullscreen="true">
			<a href="/cave/home" data-icon="home"><g:message code="default.home" /></a>
			<h1><g:message code="${domainClass.propertyName}.show.label.mobile" default="Detail" /></h1>
		</div>
        <div data-role="content">
            <g:if test="\${flash.message}">
            	<div class="message">\${flash.message}</div>
            </g:if>
            <div class="content-primary">
            <fieldset id="formContent" class="ui-body ui-body-\${message(code: 'jquery.data.theme', default: 'c')} ui-corner-all">
            <ol class="property-list ${domainClass.propertyName}">
			<%  excludedProps = Event.allEvents.toList() << 'id' << 'version' << 'ownerId'
				allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
				props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
				Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
				props.each { p -> %>
				<g:if test="\${${propertyName}?.${p.name}}">
            	<div class="ui-grid-b">
            		<div class="ui-block-a"><label><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /> :</label></div>
					<div class="ui-block-b">
					<%  if (p.isEnum()) { %>
						<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
					<%  } else if (p.oneToMany || p.manyToMany) { %>
						<g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
							<span class="property-value" aria-labelledby="${p.name}-label"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></span>
						</g:each>
					<%  } else if (p.manyToOne || p.oneToOne) { %>
						<g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link>
					<%  } else if (p.type == Boolean || p.type == boolean) { %>
						<g:formatBoolean boolean="\${${propertyName}?.${p.name}}" />
					<%  } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
						<g:formatDate date="\${${propertyName}?.${p.name}}" />
					<%  } else if(!p.type.isArray()) { %>
						<g:fieldValue bean="\${${propertyName}}" field="${p.name}"/>
					<%  } %>
					</div>
				</div>
				</g:if>
			<%  } %>
			</ol>
            </fieldset>
            </div>
        </div>    
 	    <div data-role="footer" data-theme="\${message(code: 'jquery.data.theme', default: 'c')}"  class="ui-bar" data-position="fixed">
        	<g:form>
            	<g:hiddenField name="id" value="\${${propertyName}?.id}" />
            	<div class="ui-grid-d">
            		<div id="button-block-a" class="ui-block-a"><g:link data-mini="true" data-role="button" data-icon="add" data-iconpos="top" action="create" data-inline="true"><g:message code="default.button.create.label" default="Create" /></g:link></div>
        			<div id="button-block-b" class="ui-block-b"><g:actionSubmit data-mini="true" data-icon="gear" data-iconpos="top" data-inline="true" action="edit" value="\${message(code: 'default.button.edit.label', default: 'Edit')}" /></div>
        			<div id="button-block-c" class="ui-block-c"><g:actionSubmit data-mini="true" data-icon="delete" data-iconpos="top" data-inline="true" action="delete" value="\${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></div>
					<div id="button-block-d" class="ui-block-d"><g:link data-mini="true" data-role="button" data-icon="back" data-iconpos="top" data-inline="true" action="list"><g:message code="default.button.back.label" default="Back" /></g:link></div>
					<div id="button-block-e" class="ui-block-e"><a href="/cave/home" data-role="button" data-mini="true" data-icon="home" data-iconpos="top" ><g:message code="default.home" /></a></div>
				</div>
			</g:form>
		</div>
	</div>
	</body>
</html>
