modules = {
	application {
		dependsOn 'angular'
        resource url:'/js/app/app.js'
		resource url:'/js/app/controllers/main-controller.js'
		resource url:'/js/app/controllers/region-controllers.js'
		resource url:'/js/app/services/region-services.js'
	}
	angular {
		resource url:'/js/lib/angular.js'
		resource url:'/js/lib/angular-resource.js'
		resource url:'/js/lib/angular-route.js'
    }
	mainstyle {
		resource url:'/css/main.css'
		resource url:'/css/mobile.css'
		resource url:'/css/errors.css'
	}
}