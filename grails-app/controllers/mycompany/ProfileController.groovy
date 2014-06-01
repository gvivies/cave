package mycompany

class ProfileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	/**
	 * Dependency injection for Spring security service
	 */
	def springSecurityService

	static transients = ["springSecurityService"]
	
	def beforeInterceptor = [action: this.&checkAuthentication]
	
	def checkAuthentication() {
		if (!springSecurityService.isLoggedIn()) {
			redirect controller: "login",  params: params
		}
	}
	
	def afterInterceptor = { model, modelAndView ->
		withMobileDevice {
			if (modelAndView) {
				modelAndView.viewName = modelAndView.viewName + ".mobile"
			} 
		}
		if (modelAndView && (grailsApplication.config.getProperty('mobileDebug')) && modelAndView.viewName.indexOf(".mobile") < 0) {
			modelAndView.viewName = modelAndView.viewName + ".mobile"
		}

	}

	def edit = {

		def userInstance = User.get(springSecurityService.principal.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "home")
		}
		else {
			def authorityInstances = Authority.findAll()
			render(view: "edit", 
				model: [userInstance: userInstance])
		}
	}
	
	def update = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {

					userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'user.label', default: 'User')]
					as Object[], "Another user has updated this User while you were editing")
					render(view: "edit", 
						model: [userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "edit", id: userInstance.id)
			}
			else {
				render(view: "edit", 
					model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "edit")
		}
	}

}
