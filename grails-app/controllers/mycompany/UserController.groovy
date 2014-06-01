package mycompany

import grails.plugins.springsecurity.Secured


@Secured(['ROLE_ADMIN','ROLE_USER'])
class UserController {

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
	def login = {}
	
	def index = {
		log.debug "Accessing user controller ..."
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "realname"
		params.order = "asc"
		// with mobile device, no pagination
		withMobileDevice {
			params.max = User.count()
		}

		render(view: "list", 
			model:[userInstanceList: User.list(params), userInstanceTotal: User.count()])
	}

	def create = {
		def userInstance = new User()
		userInstance.properties = params
		def authorityInstances = Authority.findAll()
		render(view: "create", 
			model: [userInstance: userInstance, authorities: authorityInstances])
	}

	def save = {
		def userInstance = new User(params)
		def auth = Authority.get(params.authority)
		userInstance.enabled = true
		if (userInstance.save(flush: true)) {
			// Sauvegarde du rôle
			UserAuthority.create userInstance, auth, true
			// Création des régions
			DataController.initForUser(String.valueOf(userInstance.id))
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
			redirect(action: "show", id: userInstance.id)
		}
		else {
			render(view: "create", 
				model: [userInstance: userInstance])
		}
	}

	def show = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			[userInstance: userInstance]
		}
	}

	def edit = {
		def userInstance = User.get(params.id)
		if (!userInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
		else {
			def authorityInstances = Authority.findAll()
			render(view: "edit", 
				model: [userInstance: userInstance, authorities: authorityInstances])
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
				if (params.authority) {
					def newAuthority = Authority.get(params.authority)
					if (newAuthority) {
						UserAuthority.removeAll(userInstance);
						UserAuthority.create userInstance, newAuthority, true
					}
				}
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", 
					model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def userInstance = User.get(params.id)
		if (userInstance) {
			try {
				DataController.deleteForUser(String.valueOf(params.id))
				userInstance.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
			redirect(action: "list")
		}
	}

}
