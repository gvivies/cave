modules = {
    application {
        resource url:'/js/application.js'
    }
	
	drink {
		resource url:'/js/drink.js'
	}
	
	dashboard {
		resource url:'/js/dashboard.js'
	}
	
	filter {
		resource url:'/js/filter.js'
	}
	
	datepicker {
		resource url:'/js/datepicker.js'
	}
	
	map {
		resource url:'/js/map.js'
	}
	
	mapMobile {
		resource url:'/js/map.mobile.js'
	}

	drinkMobile {
		resource url:'/js/drink.mobile.js'
	}
	
	jqueryMobile {
		dependsOn 'jquery'
		resource url:[dir: 'css', file: 'jquery.mobile-1.2.0.min.css'], disposition: 'head'
		resource url:[dir: 'js', file: 'jquery.mobile-1.2.0.min.js'], disposition: 'head'
	}
}