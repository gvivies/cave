package mycompany

class IndexController {

	/* Dependency injection */
	def grailsApplication
	
	def index = {
	}

	def menu = {
		
		boolean isMobile = (grailsApplication.config.getProperty('mobileDebug')) ? true : false

		withMobileDevice {
			isMobile = true
		}

		if (isMobile) {
			render(view: 'index')
		} else {	
			redirect  (controller: 'bottle', action : 'list')
		}	
	}
}
