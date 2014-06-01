package cave

class NotificationTagLib {

	def notification = {
		attrs ->
		def writer = out
		def id = attrs.remove("id")
		def from = attrs.remove("from")
		
		writer << '<div id="dashboard">'
		writer << '<div id="dashboard-content">'
		writer << '<div class="dashboard-head">'
		writer << message(code: "index.notifications.title")
		writer << '</div>'
		writer << '<div class="dashboard-body">'
		if (from) {
			writeBottlesToDrink(from, writer)
		} else {
			writer << message(code: "index.notifications.nobottle")
		}
		writer << '</div>'
		writer << '</div>'
		writer << '<div id="dashboard-picto" class="picto-notif"></div>'
		writer << '</div>'
		
		writer.println()
	}
	
	private writeBottlesToDrink(from, writer) {
		from.eachWithIndex {el, i ->
			writer << '<div class="notified-bottle">'
			writer << '<div class="notified-bottle-wine">'
			writer << el.quantity
			writer << ' '
			writer << el.name
			writer << ' - '
			writer << el.wine.name
			writer << '</div><div class="notified-bottle-info"><img src="../images/info.gif" border="0" title="'
			writer << el.wine.region.name
			writer << '">'
			writer << '</div>'
			writer << '</div>'
		}
	}
}
