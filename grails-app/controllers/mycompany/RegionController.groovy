package mycompany

class RegionController {

	private mobile = false
	private viewSuffix = ""
	
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
	
    def index = {
		redirect(action: "list", params: params)
    }

    def list = {
		params.max = Math.min(params.max ? params.int('max') : 20, 100)
		params.sort = "name"
		params.order = "asc"
		// with mobile device, no pagination
		withMobileDevice {
			params.max = Region.count()
		}

		def filter = Region.enableHibernateFilter("ownerFilter")
		filter.setParameter("param", String.valueOf(springSecurityService.principal.id))
        render(view: "list", 
			model: [regionInstanceList: Region.list(params), regionInstanceTotal: Region.count(), isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())] )
    }

    def create = {
        def regionInstance = new Region()
        regionInstance.properties = params
        render(view: "create", 
			model: [regionInstance: regionInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
    }

    def save = {
        def regionInstance = new Region(params)
		regionInstance.ownerId = springSecurityService.principal.id
		if (regionInstance.save(flush: true)) {
            flash.message = "${message(code: 'region.created.message', args: [message(code: 'region.label', default: 'Region'), regionInstance.id])}"
            redirect(action: "show", id: regionInstance.id)
        } else {
            render(view: "create", 
				model: [regionInstance: regionInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
        }
    }

    def show = {
        def regionInstance = Region.get(params.id)
        if (!regionInstance || !regionInstance.isOwnData(springSecurityService.principal.id)) {
            flash.message = "${message(code: 'region.not.found.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
            redirect(action: "list")
        }
        else {
			render(view: "show", 
				model: [regionInstance: regionInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
        }
    }

    def edit = {
        def regionInstance = Region.get(params.id)
        if (!regionInstance || !regionInstance.isOwnData(springSecurityService.principal.id)) {
            flash.message = "${message(code: 'region.not.found.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "edit", 
				model: [regionInstance: regionInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
        }
    }

    def update = {
        def regionInstance = Region.get(params.id)
        if (regionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (regionInstance.version > version) {
                    regionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'region.label', default: 'Region')] as Object[], "Another user has updated this Region while you were editing")
                    render(view: "edit", 
						model: [regionInstance: regionInstance])
                    return
                }
            }
            regionInstance.properties = params
            if (!regionInstance.hasErrors() && regionInstance.save(flush: true)) {
                flash.message = "${message(code: 'region.updated.message', args: [message(code: 'region.label', default: 'Region'), regionInstance.id])}"
                redirect(action: "show", id: regionInstance.id)
            }
            else {
                render(view: "edit", 
					model: [regionInstance: regionInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
            }
        }
        else {
            flash.message = "${message(code: 'region.not.found.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def regionInstance = Region.get(params.id)
        if (regionInstance) {
            try {
                regionInstance.delete(flush: true)
                flash.message = "${message(code: 'region.deleted.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
				redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'region.not.deleted.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'region.not.found.message', args: [message(code: 'region.label', default: 'Region'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def search = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "name"
		params.order = "asc"
		def criteria = Region.createCriteria()
		def results = criteria.list (max: Math.min(params.max ? params.int('max') : 10, 100)) {
			eq("ownerId", String.valueOf(springSecurityService.principal.id))
			like("name", "%"+params.filtered+"%")
			order("name", "asc")
		}
		render(view: "list", 
			model: [filtered: params.filtered, regionInstanceList: results, regionInstanceTotal: results.totalCount, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
	}

}
