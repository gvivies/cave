'use strict';
var app = angular.module('ngcave', ['ngRoute', 'ngResource', 'main-controller','region-controllers','region-services']);
app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider
      .when('/home', { templateUrl: 'views/index.html', controller: 'MainController'})
      .when('/auth', { templateUrl: 'views/login.html', controller: 'LoginController'})
      .when('/regions', { templateUrl:'views/region/list.html', controller: 'RegionsController'})
      .otherwise({
        redirectTo: '/home'
      });
	$locationProvider.html5Mode(false);

  }]);

/* Filters */
app.filter('iif', function () {
	return function(input, trueValue, falseValue) {
		return input ? trueValue : falseValue;
	};
});
'use strict'; 

/* Controllers */

var mainController = angular.module('main-controller', [])

mainController.controller('MainController',
		['$scope','$route',
         function($scope, $route) {

	$scope.test = 'djfhjhjsdhfjdhjfkh';

}]);

mainController.controller('LoginController',
		['$scope', '$routeParams', '$http', '$location',
		 function($scope, $routeParams, $http, $location) {

	$scope.login = function login() {
		var data = "j_username="+$scope.username+"&j_password="+$scope.password+"&submit=Login";
	    $http.post('j_spring_security_check', data, {
	    	headers: { 'Content-Type': 'application/x-www-form-urlencoded', }
	    }).success(function(data, status, headers, config) {
	       $location.path = "#/"
	    }).error(function(data, status, headers, config) {
	        // TODO
	    });
	};
	        
	$scope.logout = function logaout() {
	    $http.get('j_spring_security_logout')
	    .success(function(data, status, headers, config){
	    	// TODO
	    });
	};		
			
}]);

'use strict';

/* Controllers */

var regionControllers = angular.module('region-controllers', []);

regionControllers.controller('RegionsController', 
		['$scope','$http','RegionsService',
		function($scope, $http, RegionsService) {

	$scope.regions = RegionsService.list();

}]);
'use strict';

/* Services Rest Interface */
var services = angular.module('region-services', ['ngResource']);

services.factory('RegionsService', function($resource) {

	var resource = $resource('rest/regions',{}, { 
		list: { method: 'GET' , isArray: true },
		create: { method: 'POST' }
	});

	resource.prototype.list = function(onSuccess, onError) {
		return resource.list().$promise.then(onSuccess, onError);
	};

	resource.prototype.create = function(onSuccess, onError) {
		return resource.create().$promise.then(onSuccess, onError);
	};

	return resource;
});

