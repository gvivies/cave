package mycompany

import groovy.time.BaseDuration

class Bottle {
	
	String name
	Dealer dealer
	Wine wine
	String type
	Integer year
	Integer yearMin 
	Integer yearMax
	Integer quantity
	Date purchaseDate
	String ownerId
	Double price
	String comment
	String containing
	
	private static nowCal = Calendar.instance
	private static minYear = nowCal.get(Calendar.YEAR) - 30
	private static maxYear = nowCal.get(Calendar.YEAR) + 20
	private static now = nowCal.get(Calendar.YEAR)
	
	static List years = minYear..now
	static List yearsUntil = now..maxYear
		
    static constraints = {
		name(blank:false)
		type(inList:["Rouge","Blanc","Rosé","Gris","Jaune","Mousseux","Champagne"])
		containing(inList:["Bouteille","Demi-bouteille","Magnum"])
		quantity(min:0,default:1)
		year(inList:years)
		yearMin(inList:yearsUntil)
		yearMax(inList:yearsUntil)
		ownerId(blank:false)
    }
	
	static hibernateFilters = {
		ownerFilter(condition: "owner_id = :param", types: "string")
	}
	
	def isOwnData(Long id) {
		String.valueOf(id) == this.ownerId
	}
	
}
