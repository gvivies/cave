'use strict';

/* Controllers */

var regionControllers = angular.module('region-controllers', []);

regionControllers.controller('RegionsController', 
		['$scope','$http','RegionsService',
		function($scope, $http, RegionsService) {

	$scope.regions = RegionsService.list();

}]);