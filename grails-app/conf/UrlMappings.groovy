class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/" (controller: "login", action : "auth")
		"/home" (controller: 'index', view: 'index')
		"/cave/home" (controller: 'index', view: 'index')
		"/logout" (controller: "logout", action : "")
		"500" (view:'/error')
	}
}
