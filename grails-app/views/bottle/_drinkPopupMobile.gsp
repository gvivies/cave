<div data-role="popup" id="drinkPopupPage" data-transition="pop" data-overlay-theme="${message(code: 'jquery.data.theme', default: 'c')}">
	<div data-role="header" data-theme="${message(code: 'jquery.data.theme', default: 'c')}">
		<h3><div id="titleWine"></div></h3>
	</div>
	<div data-role="content" id="popup-background" data-theme="${message(code: 'jquery.data.theme', default: 'c')}">
    	<g:form id="drinkForm" name="drinkForm" method="post" action="drink">
        	<g:hiddenField name="hiddenId" value="" />
        	<g:hiddenField name="hiddenMax" value="" />
        	<p><div id="drinkTitle"></div></p>
        	<div id="bottleNumberRegion">
        		<g:textField name="drunkQuantity" value="1" />
        		<div data-role="controlgroup" data-type="horizontal" id="calcButtons">
					<a href="#" id="btnOneMore" data-role="button" data-icon="arrow-u" data-iconpos="notext">Up</a>
					<a href="#" id="btnOneLess" data-role="button" data-icon="arrow-d" data-iconpos="notext">Down</a>
				</div>
			</div>
        	<a href="#" id="btnDrinkYes" data-role="button" data-inline="true">Ok</a>
        	<a href="#" id="btnDrinkNo" data-role="button" data-inline="true">Annuler</a>
		</g:form>
	</div>
</div><!-- data-role popup -->