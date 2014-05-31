<%@ page import="com.gvivies.cave.Bottle" %>



<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bottle.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bottleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="bottle.type.label" default="Type" />
		
	</label>
	<g:select name="type" from="${bottleInstance.constraints.type.inList}" value="${bottleInstance?.type}" valueMessagePrefix="bottle.type" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'containing', 'error')} ">
	<label for="containing">
		<g:message code="bottle.containing.label" default="Containing" />
		
	</label>
	<g:select name="containing" from="${bottleInstance.constraints.containing.inList}" value="${bottleInstance?.containing}" valueMessagePrefix="bottle.containing" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'quantity', 'error')} required">
	<label for="quantity">
		<g:message code="bottle.quantity.label" default="Quantity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="quantity" type="number" min="0" value="${bottleInstance.quantity}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="bottle.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="year" from="${bottleInstance.constraints.year.inList}" required="" value="${fieldValue(bean: bottleInstance, field: 'year')}" valueMessagePrefix="bottle.year"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'yearMin', 'error')} required">
	<label for="yearMin">
		<g:message code="bottle.yearMin.label" default="Year Min" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="yearMin" from="${bottleInstance.constraints.yearMin.inList}" required="" value="${fieldValue(bean: bottleInstance, field: 'yearMin')}" valueMessagePrefix="bottle.yearMin"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'yearMax', 'error')} required">
	<label for="yearMax">
		<g:message code="bottle.yearMax.label" default="Year Max" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="yearMax" from="${bottleInstance.constraints.yearMax.inList}" required="" value="${fieldValue(bean: bottleInstance, field: 'yearMax')}" valueMessagePrefix="bottle.yearMax"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'ownerId', 'error')} required">
	<label for="ownerId">
		<g:message code="bottle.ownerId.label" default="Owner Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ownerId" required="" value="${bottleInstance?.ownerId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'comment', 'error')} ">
	<label for="comment">
		<g:message code="bottle.comment.label" default="Comment" />
		
	</label>
	<g:textField name="comment" value="${bottleInstance?.comment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'dealer', 'error')} required">
	<label for="dealer">
		<g:message code="bottle.dealer.label" default="Dealer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dealer" name="dealer.id" from="${com.gvivies.cave.Dealer.list()}" optionKey="id" required="" value="${bottleInstance?.dealer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'price', 'error')} required">
	<label for="price">
		<g:message code="bottle.price.label" default="Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="price" value="${fieldValue(bean: bottleInstance, field: 'price')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'purchaseDate', 'error')} required">
	<label for="purchaseDate">
		<g:message code="bottle.purchaseDate.label" default="Purchase Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="purchaseDate" precision="day"  value="${bottleInstance?.purchaseDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: bottleInstance, field: 'wine', 'error')} required">
	<label for="wine">
		<g:message code="bottle.wine.label" default="Wine" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wine" name="wine.id" from="${com.gvivies.cave.Wine.list()}" optionKey="id" required="" value="${bottleInstance?.wine?.id}" class="many-to-one"/>
</div>

