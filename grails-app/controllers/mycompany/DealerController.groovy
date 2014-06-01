package mycompany

class DealerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	/**
	 * Dependency injection for Spring security service
	 */
	def springSecurityService
	/**
	 *  Dependency injection for configuration
	 */
	def grailsApplication
	/**
	 *  Dependency injection for localizer
	 */
	def geoLocalizerService
	
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
			params.max = Dealer.count()
		}

		def filter = Dealer.enableHibernateFilter("ownerFilter")
		filter.setParameter("param", String.valueOf(springSecurityService.principal.id))
        render(view: "list", 
			model: [dealerInstanceList: Dealer.list(params), dealerInstanceTotal: Dealer.count(), isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())] )
    }

    def create = {
        def dealerInstance = new Dealer()
        dealerInstance.properties = params
		render(view: "create", 
			model: [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
    }

    def save = {
        def dealerInstance = new Dealer(params)
		dealerInstance.ownerId = springSecurityService.principal.id
		
		if (dealerInstance.city) {
			geoCode(dealerInstance)
		}	
        
		if (dealerInstance.save(flush: true)) {
            flash.message = "${message(code: 'dealer.created.message', args: [message(code: 'dealer.label', default: 'Dealer'), dealerInstance.id])}"
            redirect(action: "show", id: dealerInstance.id)
        }
        else {
            render(view: "create", 
				model: [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
        }
    }

    def show = {
        def dealerInstance = Dealer.get(params.id)
        if (!dealerInstance || !dealerInstance.isOwnData(springSecurityService.principal.id)) {
            flash.message = "${message(code: 'dealer.not.found.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
			redirect(action: "list")
        }
        else {
			params.sort = "name"
			params.order = "asc"
			def criteria = Bottle.createCriteria()
			def dealerBottles = criteria.list() {
				eq("ownerId", String.valueOf(springSecurityService.principal.id))
				dealer {	
					eq("id", Long.valueOf(params.id)) 	
				}
				order(params.sort, params.order)
			}
			def showMap = false
			if (dealerInstance.city) {
				showMap = true
			}
            [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), bottles: dealerBottles, showMap: showMap]
        }
    }

    def edit = {
        def dealerInstance = Dealer.get(params.id)
        if (!dealerInstance || !dealerInstance.isOwnData(springSecurityService.principal.id)) {
            flash.message = "${message(code: 'dealer.not.found.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
			redirect(action: "list")
        }
        else {
            render(view: "edit", 
				model: [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
        }
    }

    def update = {
        def dealerInstance = Dealer.get(params.id)
        if (dealerInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (dealerInstance.version > version) {
                    dealerInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'dealer.label', default: 'Dealer')] as Object[], "Another user has updated this Dealer while you were editing")
                    render(view: "edit", 
						model: [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
                    return
                }
            }
            dealerInstance.properties = params
			if (dealerInstance.city) {
				geoCode(dealerInstance)
			}
	
            if (!dealerInstance.hasErrors() && dealerInstance.save(flush: true)) {
                flash.message = "${message(code: 'dealer.updated.message', args: [message(code: 'dealer.label', default: 'Dealer'), dealerInstance.id])}"
                redirect(action: "show", id: dealerInstance.id)
            }
            else {
                render(view: "edit", 
					model: [dealerInstance: dealerInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
            }
        }
        else {
            flash.message = "${message(code: 'dealer.not.found.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
			redirect(action: "list")
        }
    }

    def delete = {
        def dealerInstance = Dealer.get(params.id)
        if (dealerInstance) {
            try {
                dealerInstance.delete(flush: true)
                flash.message = "${message(code: 'dealer.deleted.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
				redirect(action: "list")
            }
			catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'dealer.not.deleted.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'dealer.not.found.message', args: [message(code: 'dealer.label', default: 'Dealer'), params.id])}"
			redirect(action: "list")
        }
    }

	def search = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "name"
		params.order = "asc"
		def criteria = Dealer.createCriteria()
		def results = criteria.list (max: Math.min(params.max ? params.int('max') : 10, 100)) {
			eq("ownerId", String.valueOf(springSecurityService.principal.id))
			like("name", "%"+params.filtered+"%")
			order("name", "asc")
		}
		render(view: "list", 
			model: [filtered: params.filtered, dealerInstanceList: results, dealerInstanceTotal: results.totalCount, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
	}

	private geoCode(dealerInstance) {
		def geoData = geoLocalizerService.geoCodeAddress(dealerInstance?.street, dealerInstance?.zipCode, dealerInstance?.city)
		if (geoData?.results) {
			// take the first result
			if (geoData?.status.equals('OK')) {
				def result = geoData.results?.get(0)
				dealerInstance.latitude = result?.geometry?.location?.lat
				dealerInstance.longitude = result?.geometry?.location?.lng
			}
		}

	}
}
