package cave

import mycompany.UserAuthority

class UserTabTagLib {

	private final static String MOBILE_DEVICE = "mobile" 
	/**
	 * Dependency injection for the springSecurityService.
	 */
	def springSecurityService
	
	def userTab = {
		attrs ->
		def writer = out
		def isAdmin = UserAuthority.isAdmin(springSecurityService.getCurrentUser())
		def label = ''
		def device = attrs.remove("device")
		if (!device) {
			writer << '<div class="inactivetab">'
		} 
		if (isAdmin && Boolean.valueOf(isAdmin)) {
			label =  message(code: "index.user.label")
			writer << g.link(controller: "user", {label})
		} else {
			label =  message(code: "index.profile.label")
			writer << g.link(action: "edit", controller: "profile", {label})
		}
		if (!device) {
			writer << '</div>'
		}
		writer.println()
	}
}
