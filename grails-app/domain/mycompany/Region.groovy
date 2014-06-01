package mycompany

class Region {

	String name
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
		Region.createCriteria().list () {
			eq("ownerId", id)
			order("name", "asc")
		}
	}

}
