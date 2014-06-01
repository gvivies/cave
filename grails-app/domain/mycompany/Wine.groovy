package mycompany

import java.util.List;

class Wine {

	String name
	Region region
	String ownerId
	
    static constraints = {
		name(blank:false)
		ownerId(blank:false)
    }
	
	static hibernateFilters = {
		ownerFilter(condition: "owner_id = :param", types: "string")
	}
	
	def isOwnData(Long id) {
		String.valueOf(id) == this.ownerId
	}
	
	static List securedList(String id) {
		Wine.createCriteria().list () {
			eq("ownerId", id)
			order("name", "asc")
		}
	}
}
