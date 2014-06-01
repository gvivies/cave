package cave

class LoginTagLib {

	/**
	* Dependency injection for the springSecurityService.
	*/
   def springSecurityService
   
	def loginControl = {
		if (springSecurityService.isLoggedIn()) {
			def label =  message(code: "index.logout.label")
			def user = springSecurityService.getCurrentUser()
			out << "<span class='hello'>bonjour, ${user?.realname}</span>"
			out << """${link(controller:'logout'){"<img border='0' id='logout' src='${resource(dir:'images',file:'logout.png')}' alt='${label}' />"}}"""
		}
	}
}
