package cave

import groovy.json.JsonSlurper

class GeoLocalizerService {

	/**
	 *  Dependency injection for configuration
	 */
	def grailsApplication
	
	/**
	 * This service calls the Google geocoding service
	 *  
	 * @param street
	 * @param zipCode
	 * @param city
	 * @return
	 */
	def geoCodeAddress(street, zipCode, city) {
		def address = URLEncoder.encode(street+' '+zipCode+' '+city,'UTF-8')
		def targetedUrl = (grailsApplication.config.getProperty('geoServiceGeoCodeUrl')) + 'address='+address
		log.debug '---- targetedUrl : '+targetedUrl
		def response = callGeoCodingService(targetedUrl)
		def jsonObj
		if (response) {
			jsonObj = new JsonSlurper().parseText(response)
		}
		return jsonObj	
	}
	
	/**
	 * Google API call
	 * 
	 * @param targetedUrl
	 * @return
	 */
	private callGeoCodingService(targetedUrl) {
		def url = new URL(targetedUrl)
		def connection = url.openConnection()
		if (connection.responseCode == 200){
			def json = connection.content.text
			return json
		} else {
			log.error("GeocoderService.geoCodeCity FAILED")
			log.error(url)
			log.error(connection.responseCode)
			log.error(connection.responseMessage)
		}
	}
}
