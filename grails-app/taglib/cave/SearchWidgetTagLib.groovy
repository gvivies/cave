package cave

class SearchWidgetTagLib {
	
	def searchWidget = { attrs ->
		def writer = out
		def name = attrs.remove("name")
		def id = attrs.remove("id")
		def value = attrs.remove("value")
		def additionalFilter = attrs.remove("additionalFilter")
		def from = attrs.remove('from')
		value = value.toString()
		value = value.equals('null') ? '' : value
		writer << '<span class="menuButton">'
		writer << '<form action="search">'
		writer << '<div id="searchblock">'
		writer.println()
		
		if (from) {
			writer << '<div id="additionalSelect"><select id="additionalFilter" name="additionalFilter" onChange="javascript:filter()">'
			writer.println()
			// Valeur vide
			createEmptyValueInSelectObject(writer)
			from.eachWithIndex {el, i ->
				def keyValue = el.id.toString()
				// Balise option
				writer << "<option "
				writer << "selectedValue=\"${additionalFilter}\" "
				// Ecriture attribut value avec tag selected éventuellement
				writeValueAndCheckIfSelected(keyValue, additionalFilter, writer)
				writer << ">"
				// Valeur
				writer << el.name.encodeAsHTML()
				writer << "</option>"
				writer.println()
			}
			// close tag
			writer << '</select></div>'
			writer.println()
		}
		writer << '<div id="inputsearch"> <input type="text" id="'+id+'" name="'+name+'" value="'+value+'" class="textfield" /></div>'
		writer << '<div id="btnsearch"><input type="submit" value="" class="search" id="search-input" /></div>'
		writer << '<div id="btnerase"><input type="button" value="" class="erase" id="erase-input" /></div>'
		writer << '</div>'
		writer << '</form>'
		writer << '</span>'
		writer.println()
	}

	private writeValueAndCheckIfSelected(keyValue, value, writer) {
		boolean selected = (keyValue == value)
		writer << "value=\"${keyValue}\" "
		if (selected) {
			writer << 'selected="selected" '
		}
	}

	private createEmptyValueInSelectObject(writer) {
		writer << "<option value=\"\" > </option>"
		writer.println()
	}
}
