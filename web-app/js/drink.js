function displayDrinkPopup(btnName) {
	$("#drink-it").hide();		
	var button = document.getElementById(btnName);
	var top = $(button).offset().top;
	var left = $(button).offset().left;
	$("#drink-div").css("top", top);
	$("#drink-div").css("left", left);
	$("#drink-div").fadeToggle("slow");
}

function drinkSomeBottle(bottleId, max) {
	document.getElementById("hiddenId").setAttribute("value", bottleId);
	document.getElementById("hiddenMax").setAttribute("value", max);
	var name = document.getElementById("wine"+bottleId).getAttribute("value");
	$("#drinkTitle").text("J'en bois ("+max+" max.)");
	$("#titleWine").text(name);
	displayDrinkPopup("drinkBottles"+bottleId);
}

function hidePopUp() {
	$("#drink-div").fadeToggle("slow");
	$("#drink-it").show();
}

$(document).ready(function() {
	function submitDrunkBottles() {
		var max = document.getElementById("hiddenMax").getAttribute("value");
		var drunkQuantity = document.getElementById("drunkQuantity").getAttribute("value");
		var hiddenId = document.getElementById("hiddenId").getAttribute("value");
		if (drunkQuantity <= max) {
			$.ajax({
				type: "POST",
				url: "/bottle/drink",
				data: "hiddenId="+hiddenId+"&drunkQuantity="+drunkQuantity,
				beforeSend : function() { 
					$("#spinner").css("display", "block");
				},
				success : function(data){ 
					$("#quantity_"+hiddenId).text(data);
				},
			    error: function (request, status, error) {
			        alert('An error has occured : '+request.responseText+' | status : '+status+' | error : '+error);
			    }
			}).done(function() {
				hidePopUp();
				$("#spinner").css("display", "none");
			});
		}
	}		
	
	$("#drink-yes")
		.click(function() {
			submitDrunkBottles();
		});

	$("#drink-no")
		.click(function() {
		hidePopUp();
	});

});


