package mycompany

import java.util.List;

class Dealer {

	String name = ''
	String street = ''
	String zipCode = ''
	String city = ''
	String telephone = ''
	String email = ''
	String webSite = ''
	String comment = ''
	String ownerId
	String latitude = ''
	String longitude = ''
	
    static constraints = {
		name(blank:false)
		telephone(maxSize:10)
		ownerId(blank:false)
    }
	
	static hibernateFilters = {
		ownerFilter(condition: "owner_id = :param", types: "string")
	}
	
	def isOwnData(Long id) {
		String.valueOf(id) == this.ownerId
	}
	
	static List securedList(String id) {
		Dealer.createCriteria().list () {
			eq("ownerId", id)
			order("name", "asc")
		}
	}
}
