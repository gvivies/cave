<%@ page import="mycompany.Dealer" %>



		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="name"><g:message code="dealer.name.label" default="Name" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'name', 'error')} required">
				
				<g:textField  name="name" required="" value="${dealerInstance?.name}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="telephone"><g:message code="dealer.telephone.label" default="Telephone" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'telephone', 'error')} ">
				
				<g:textField  name="telephone" maxlength="10" value="${dealerInstance?.telephone}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="city"><g:message code="dealer.city.label" default="City" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'city', 'error')} ">
				<g:textField  name="city" value="${dealerInstance?.city}"/>
				<g:hiddenField  name="latitude" value="${dealerInstance?.latitude}" default=""/>
				<g:hiddenField  name="longitude" value="${dealerInstance?.longitude}" default=""/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="comment"><g:message code="dealer.comment.label" default="Comment" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'comment', 'error')} ">
				
				<g:textField  name="comment" value="${dealerInstance?.comment}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="email"><g:message code="dealer.email.label" default="Email" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'email', 'error')} ">
				
				<g:textField  name="email" value="${dealerInstance?.email}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="street"><g:message code="dealer.street.label" default="Street" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'street', 'error')} ">
				
				<g:textField  name="street" value="${dealerInstance?.street}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="webSite"><g:message code="dealer.webSite.label" default="Web Site" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'webSite', 'error')} ">
				
				<g:textField  name="webSite" value="${dealerInstance?.webSite}"/>
			</div>
		</div>	
	
		<div class="ui-grid-a">
			<div class="ui-block-a">
				
					<label for="zipCode"><g:message code="dealer.zipCode.label" default="Zip Code" /> :</label>
				
			</div>
			<div class="ui-block-b ${hasErrors(bean: dealerInstance, field: 'zipCode', 'error')} ">
				
				<g:textField  name="zipCode" value="${dealerInstance?.zipCode}"/>
			</div>
		</div>	
	
