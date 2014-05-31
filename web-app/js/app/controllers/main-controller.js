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
