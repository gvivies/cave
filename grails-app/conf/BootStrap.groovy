import mycompany.DataController

class BootStrap {

	def springSecurityService

	def init = { servletContext ->
		
		DataController.initSecurity()
	}

	def destroy = {
	}
}
