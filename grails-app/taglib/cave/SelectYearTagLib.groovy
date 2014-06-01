package cave

class SelectYearTagLib {

	def selectYear = { attrs ->
		// Fabrication des attributs de l'objet Select
		def writer = out
		def locale = Locale.getDefault()
		attrs.id = attrs.id ?: attrs.name
		def from = attrs.remove('from')
		def value = attrs.remove('value')
		value = value.toString()
		def disabled = attrs.remove('disabled')
		if (disabled && Boolean.valueOf(disabled)) {
			attrs.disabled = 'disabled'
		}

		// Création de la balise Select
		writer << "<select data-native-menu=\"false\" name=\"${attrs.remove('name')?.encodeAsHTML()}\" >"
		writer.println()

		// Création de la partie liste de valeurs
		if (from) {
			from.eachWithIndex {el, i ->
				def keyValue = el.toString()
				// Balise option
				writer << '<option '
				writer << "selectedValue=\"${value}\" "
				// Ecriture attribut value avec tag selected éventuellement
				writeValueAndCheckIfSelected(keyValue, value, writer)
				writer << '>'
				// Valeur
				writer << el.toString().encodeAsHTML()
				writer << '</option>'
				writer.println()
			}
		}
		// close tag
		writer << '</select>'
	}

	private writeValueAndCheckIfSelected(keyValue, value, writer) {
		boolean selected = (keyValue == value)
		writer << "value=\"${keyValue}\" "
		if (selected) {
			writer << 'selected="selected" '
		}
	}
}
