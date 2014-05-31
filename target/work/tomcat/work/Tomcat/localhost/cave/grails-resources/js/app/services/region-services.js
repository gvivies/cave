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