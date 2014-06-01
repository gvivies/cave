
package mycompany

import java.util.Date;

import mycompany.UserAuthority


class BottleController {

	private static nowCal = Calendar.instance
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	final static MAXROWS = 20
	/**
	 * Dependency injection for Spring security service
	 */
	def springSecurityService
	
	// Export service provided by Export plugin
	def exportService
	/**
	 *  Dependency injection for configuration
	 */
	def grailsApplication 
	
	static transients = ["springSecurityService"]

	static hibernateFilters = {
		enabledFilter(condition:'userId='+user.id, default:true)
	}

	def beforeInterceptor = [action: this.&checkAuthentication]

	def checkAuthentication() {
		if (!springSecurityService.isLoggedIn()) {
			redirect(controller: "login",  params: params)
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
		
		params.max = Math.min(params.max ? params.int('max') : MAXROWS, 100)
		params.sort = "name"
		params.order = "asc"
		// with mobile device, no pagination
		withMobileDevice {
			params.max = Bottle.count()
		}
		
		def filter = Bottle.enableHibernateFilter("ownerFilter")
		filter.setParameter("param", String.valueOf(springSecurityService.principal.id))
		
		def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))
		def results = Bottle.list(params)
		
		if(params?.format && params.format == "excel"){
			response.contentType = grailsApplication.config.grails.mime.types[params.format]
			response.setHeader("Content-disposition", "attachment; filename=bottle.${params.extension}")
			List fields = ["name","wine.name","wine.region.name","quantity","containing","dealer.name","type","year","yearMin","yearMax","purchaseDate","price","comment"]
			Map labels = ["name":  "NOM",
							"wine.name": "APPELLATION",
							"wine.region.name": "REGION",
							"quantity": "QUANTITE",
							"containing": "CONTENANT",
							"dealer.name": "DOMAINE",
							"type": "TYPE" ,
							"year": "MILLESIME",
							"yearMin": "A BOIRE A PARTIR DE",
							"yearMax": "A BOIRE JUSQUE",
							"purchaseDate": "DATE",
							"price": "PRIX",
							"comment": "COMMENTAIRE"] 
			// Formatter closure
			def upperCase = { domain, value ->
				return value.toUpperCase()
			}

			Map formatters = [name: upperCase]
			Map parameters = [title: "Liste des vins"] //Map parameters = [title: "Cool books", "column.widths": [0.2, 0.3, 0.5]]
			exportService.export(params.format, response.outputStream, Bottle.list(sort: "name", order: "asc"),  fields, labels, formatters, parameters)
	
		}
		
		render(view: "list", model: [bottleInstanceList: results, 
			bottleInstanceTotal: Bottle.count(),
			bottlesCount : countBottles(results),
			isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), 
			notificationList: listToBeDrunk(),  
			regionList: regions, 
			region: params.region])
	}

	def search = {
		
		params.max = Math.min(params.max ? params.int('max') : MAXROWS, 100)
		params.sort = "name"
		params.order = "asc"

		def criteria = Bottle.createCriteria()
		def results = criteria.list(max: params.max, offset: params.offset) {
			eq("ownerId", String.valueOf(springSecurityService.principal.id))
			if (params.filtered) {
				like("name", "%"+params.filtered+"%")
			}
			if (params.additionalFilter) {
				wine {	eq("region.id", Long.valueOf(params.additionalFilter)) 	}
			}
			order(params.sort, params.order)
		}
		def regions = Region.securedList(String.valueOf(springSecurityService.principal.id))

		render(view: "list", model: [bottleInstanceList: results, 
			bottleInstanceTotal: results.getTotalCount(),
			bottlesCount : countBottles(results), 
			isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), 
			notificationList: listToBeDrunk(), 
			regionList: regions, 
			filtered: params.filtered,
			additionalFilter: params.additionalFilter])
	}

	def create = {
		def bottleInstance = new Bottle()
		bottleInstance.properties = params
		def wines = Wine.securedList(String.valueOf(springSecurityService.principal.id))
		def dealers = Dealer.securedList(String.valueOf(springSecurityService.principal.id))
		def today = new Date()
		render(view: "create", 
			model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), wineList: wines, dealerList: dealers, now: today])
	}

	def save = {
		def bottleInstance = new Bottle(params)
		if (!params.price) {
			bottleInstance.price = 0
		}
		bottleInstance.ownerId = String.valueOf(springSecurityService.principal.id)
		if (bottleInstance.save(flush: true)) {
			flash.message = "${message(code: 'bottle.created.message')}"
			redirect(action: "show", id: bottleInstance.id) 	
		} else {
			def wines = Wine.securedList(String.valueOf(springSecurityService.principal.id))
			def dealers = Dealer.securedList(String.valueOf(springSecurityService.principal.id))
			render(view: "create", 
				model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), wineList: wines, dealerList: dealers])
		}
	}

	def show = {
		def bottleInstance = Bottle.get(params.id)
		if (!bottleInstance || !bottleInstance.isOwnData(springSecurityService.principal.id)) {
			flash.message = "${message(code: 'bottle.not.found.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
			redirect(action: "list")	
		}
		else {
			render(view: "show", 
				model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
		}
	}

	def edit = {
		def bottleInstance = Bottle.get(params.id)
		if (!bottleInstance || !bottleInstance.isOwnData(springSecurityService.principal.id)) {
			flash.message = "${message(code: 'bottle.not.found.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
			redirect(action: "list")
		}
		else {
			def wines = Wine.securedList(String.valueOf(springSecurityService.principal.id))
			def dealers = Dealer.securedList(String.valueOf(springSecurityService.principal.id))
			render(view: "edit", 
				model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser()), wineList : wines, dealerList: dealers])
		}
	}

	def update = {
		def bottleInstance = Bottle.get(params.id)
		if (bottleInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (bottleInstance.version > version) {

					bottleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'bottle.label', default: 'Bottle')]
					as Object[], "Another user has updated this Bottle while you were editing")
					render(view: "edit", 
						model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
					return
				}
			}
			bottleInstance.properties = params
			if (!bottleInstance.hasErrors() && bottleInstance.save(flush: true)) {
				flash.message = "${message(code: 'bottle.updated.message', args: [message(code: 'bottle.label', default: 'Bottle'), bottleInstance.id])}"
				redirect(action: "show", id: bottleInstance.id)
			}	else {
				render(view: "edit", 
					model: [bottleInstance: bottleInstance, isAdmin: UserAuthority.isAdmin(springSecurityService.getCurrentUser())])
			}
		}
		else {
			flash.message = "${message(code: 'bottle.not.found.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def bottleInstance = Bottle.get(params.id)
		if (bottleInstance) {
			try {
				bottleInstance.delete(flush: true)
				flash.message = "${message(code: 'bottle.deleted.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'bottle.not.found.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.id])}"
			redirect(action: "list")
		}
	}

	def drink = {
		
		def bottleInstance = Bottle.get(params.hiddenId.toLong())
		if (!bottleInstance || !bottleInstance.isOwnData(springSecurityService.principal.id)) {
			flash.message = "${message(code: 'bottle.not.found.message', args: [message(code: 'bottle.label', default: 'Bottle'), params.hiddenId])}"
			redirect(action: "list")
		} else {
			
			def newQuantity = bottleInstance.quantity - params.drunkQuantity.toLong()
			log.debug "-----> New quantity is now "+bottleInstance.quantity+" - "+params.drunkQuantity.toLong()+" = "+newQuantity
			bottleInstance.quantity = newQuantity
			if (!bottleInstance.hasErrors() && bottleInstance.save(flush: true)) {
				log.debug "-----> New quantity "+newQuantity+" has been saved"
				render newQuantity
			}
			else {
				redirect(action: "list", params: params)
			}
		}
	}

	def datePicker = {
		// Do not remove !!
	}

	def notif = {
		
		params.max = Math.min(params.max ? params.int('max') : MAXROWS, 100)
		params.sort = "name"
		params.order = "asc"
		
		render(view: "notif", model: [ notificationList: listToBeDrunk()])
	}

	private listToBeDrunk() {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		params.sort = "name"
		params.order = "asc"
		def now = nowCal.get(Calendar.YEAR)
		def criteria = Bottle.createCriteria()
		def results = criteria.list (max: Math.min(params.max ? params.int('max') : 10, 100)) {
			eq("ownerId", String.valueOf(springSecurityService.principal.id))
			eq("yearMax", now)
			order("name", "asc")
		}
	}	

	private countBottles(bottles) {
		int count = 0;
		bottles.eachWithIndex {el, i ->
			count += el.quantity
		}
		def result = count 
	}
	
	private	exportExcelFile(results) {
		Map fields = ["name":"","wine":"","quantity":"","containing":"","dealer":"","type":"","year":"","yearMin":"","yearMax":"","purchaseDate":"","price":"","comment":""]
		Map labels = ["name":  "NOM",
						"wine": "APPELLATION",
						"quantity": "QUANTITE",
						"containing": "CONTENANT", 
						"dealer": "DOMAINE",
						"type": "TYPE" ,
						"year": "MILLESIME",
						"yearMin": "A BOIRE A PARTIR DE",
						"yearMax": "A BOIRE JUSQUE",
						"purchaseDate": "DATE",
						"price": "PRIX",
						"comment": "COMMENTAIRE"]
		exportService.export(params.format, response.outputStream, results, fields, labels)
	}

}
