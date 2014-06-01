package mycompany

class Authority {

	String description
	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority(inList:['ROLE_ADMIN','ROLE_USER'])
	}
	
	
}
