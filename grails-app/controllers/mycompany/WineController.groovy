package mycompany

class WineController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	/**
	 * Dependency injection for Spring security service
	 */
	def springSecurityService
	
	/* Dependency injection */
	def grailsApplication
	
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

	def index = {
		redirect(action: list, params: params)
			
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 20, 100)
		params.sort = "name"
		params.order = "asc"
		// with mobile device, no pagination
		withMobileDevice {
			params.max = Wine.count()
		}

		def filter = Wine.enableHibernateFilter("ownerFilter")
		filter.setParameter("param", String.valueOf(springSecurityService.principal.id))
		def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))
		render(view: "list", 
			model: [wineInstanceList: Wine.list(params), wineInstanceTotal: Wine.count(), isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), regionList: regions, region: params.region])
	}

	def create = {
		def wineInstance = new Wine()
		wineInstance.properties = params
		def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))
		render(view: "create", 
			model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), regionList: regions])
	}

	def save = {
		def wineInstance = new Wine(params)
		wineInstance.ownerId = String.valueOf(springSecurityService.principal.id)
		if (wineInstance.save(flush: true)) {
			flash.message = "${message(code: 'wine.created.message', args: [message(code: 'wine.label', default: 'Wine'), wineInstance.id])}"
			redirect(action: show, id: wineInstance.id)
		}
		else {
			render(view: "create", 
				model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
		}
	}

	def show = {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance || !wineInstance.isOwnData(springSecurityService.principal.id)) {
			flash.message = "${message(code: 'wine.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
			redirect(action: list)
		}
		else {
			render(view: "show", 
				model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
		}
	}

	def edit = {
		def wineInstance = Wine.get(params.id)
		if (!wineInstance || !wineInstance.isOwnData(springSecurityService.principal.id)) {
			flash.message = "${message(code: 'wine.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
			redirect(action: list)
		}
		else {
			def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))
				render(view: "edit", 
					model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), regionList: regions])
		}
	}

	def update = {
		def wineInstance = Wine.get(params.id)
		if (wineInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (wineInstance.version > version) {
					wineInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'wine.label', default: 'Wine')]
					as Object[], "Another user has updated this Wine while you were editing")
					render(view: "edit", 
						model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
				}
			}
			wineInstance.properties = params
			if (!wineInstance.hasErrors() && wineInstance.save(flush: true)) {
				flash.message = "${message(code: 'wine.updated.message', args: [message(code: 'wine.label', default: 'Wine'), wineInstance.id])}"
				redirect(action: "show", id: wineInstance.id)
			}
			else {
				render(view: "edit", 
					model: [wineInstance: wineInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
			}
		}
		else {
			flash.message = "${message(code: 'wine.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def wineInstance = Wine.get(params.id)
		if (wineInstance) {
			try {
				wineInstance.delete(flush: true)
				flash.message = "${message(code: 'wine.deleted.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'wine.not.deleted.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'wine.not.found.message', args: [message(code: 'wine.label', default: 'Wine'), params.id])}"
			redirect(action: "list")
		}
	}

	def search = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "name"
		params.order = "asc"
		def criteria = Wine.createCriteria()
		def results = criteria.list (max: Math.min(params.max ? params.int('max') : 10, 100)) {
			eq("ownerId", String.valueOf(springSecurityService.principal.id))
			like("name", "%"+params.filtered+"%")
			if (params.additionalFilter) {
				eq("region.id", Long.valueOf(params.additionalFilter))
			}
			order("name", "asc")
		}
		def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))
		render(view: "list", 
			model: [filtered: params.filtered, 
			wineInstanceList: results, 
			wineInstanceTotal: results.totalCount, 
			isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), 
			regionList: regions, 
			additionalFilter: params.additionalFilter])
	}
	

}
