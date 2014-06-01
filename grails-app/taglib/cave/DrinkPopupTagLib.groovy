package cave

class DrinkPopupTagLib {
	
	def drinkPopup = { attrs ->
		def writer = out
		writer << '<div id="drinkPopup" class="drinkPopup" style="display:none;">'
        writer << '<form method="post" action= "drink" >'
        writer << '<div class="buttons">'
        writer << '<span class="button"><g:actionSubmit class="save" action="drink" value="je bois" /></span>'
        writer << '</div>'
        writer << '</g:form>'
		writer << '</div>'
		writer.println()
	}
}
