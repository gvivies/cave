<%=packageName%>
<% import grails.persistence.Event %>

<%  excludedProps = Event.allEvents.toList() << 'version' << 'dateCreated' << 'lastUpdated' << 'ownerId'
	persistentPropNames = domainClass.persistentProperties*.name
	boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
	if (hasHibernate && org.codehaus.groovy.grails.orm.hibernate.cfg.GrailsDomainBinder.getMapping(domainClass)?.identity?.generator == 'assigned') {
		persistentPropNames << domainClass.identifier.name
	}
	props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
	Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
	
	for (p in props) {
		if (p.embedded) {
			def embeddedPropNames = p.component.persistentProperties*.name
			def embeddedProps = p.component.properties.findAll { embeddedPropNames.contains(it.name) && !excludedProps.contains(it.name) }
			Collections.sort(embeddedProps, comparator.constructors[0].newInstance([p.component] as Object[]))
			%><fieldset class="embedded"><legend><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></legend><%
				for (ep in p.component.properties) {
					renderFieldForProperty(ep, p.component, "${p.name}.")
				}
			%></fieldset><%
		} else {
			renderFieldForProperty(p, domainClass)
		}
	}

private renderFieldForProperty(p, owningClass, prefix = "") {
	boolean hasHibernate = pluginManager?.hasGrailsPlugin('hibernate')
	boolean display = true
	boolean required = false
	if (hasHibernate) {
		cp = owningClass.constrainedProperties[p.name]
		display = (cp ? cp.display : true)
		check = (p ? p.type in [boolean, Boolean] : false)
		required = (cp ? !(cp.propertyType in [boolean, Boolean]) && !cp.nullable && (cp.propertyType != String || !cp.blank) : false)
	}
	if (display) { %>
		<div class="ui-grid-a">
			<div class="ui-block-a">
				<%  if (check) { %>
					<label></label>
				<% } else { %>
					<label for="${prefix}${p.name}"><g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" /> :</label>
				<% } %>
			</div>
			<div class="ui-block-b \${hasErrors(bean: ${propertyName}, field: '${prefix}${p.name}', 'error')} ${required ? 'required' : ''}">
				<%  if (check) { %>
					<label for="${prefix}${p.name}"><g:message code="${domainClass.propertyName}.${prefix}${p.name}.label" default="${p.naturalName}" /></label>
				<% } %>
				${renderEditor(p)}
			</div>
		</div>	
	<%} } %>
