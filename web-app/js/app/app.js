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