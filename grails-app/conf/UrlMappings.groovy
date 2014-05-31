class UrlMappings {

	static mappings = {
		"/rest/regions" (resources:"region")
		"/rest/regions/$id?" (resource:"region")
		
		/*	
        "/$controller/$action?/$id?(.${format})?"{
            constraints {
                // apply constraints here
            }
        }
        */
		"/" (controller: "login", action : "auth")
        "/index"(view:"/index")
        "500"(view:'/error')
	}
}
