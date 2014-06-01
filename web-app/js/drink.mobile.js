function displayDrinkPopup() {
	$("#drinkPopupPage").popup();
	$("#drinkPopupPage").popup("open");
}

function oneMoreBottle() {
	$("#drunkQuantity").val(parseInt($("#drunkQuantity").val())+1);
}

function oneLessBottle() {
	if (parseInt($("#drunkQuantity").val())>1) {
		$("#drunkQuantity").val(parseInt($("#drunkQuantity").val())-1);
	}
}

function drinkSomeBottle(bottleId) {

	var name = $("#wine"+bottleId).val();
	var max = $("#hiddenQty_"+bottleId).val()

	$("#hiddenId").val(bottleId);
	$("#hiddenMax").val(max);
	$("#drinkTitle").text("Maximum restant : "+max);
	$("#titleWine").text(name);

	displayDrinkPopup();
}

function hidePopUp() {
	$("#drinkPopupPage").popup("close");
}

$(document).ready(function() {
	function submitDrunkBottles() {

		var drunkQuantity = parseInt($("#drunkQuantity").val());
		var hiddenId = parseInt($("#hiddenId").val());
		var max = parseInt($("#hiddenQty_"+hiddenId).val());

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
					$("#hiddenQty_"+hiddenId).val(data);
					$("#drunkQuantity").val("1");
				},
			    error: function (request, status, error) {
			        alert('An error has occured : '+request.responseText+' | status : '+status+' | error : '+error);
			    }
			}).done(function() {
				hidePopUp();
			});
		}
	}		
	
	$("#btnDrinkYes")
		.click(function() {
			submitDrunkBottles();
		});

	$("#btnDrinkNo")
		.click(function() {
			hidePopUp();
	});
	
	$("#btnOneMore")
		.click(function() {
			oneMoreBottle();
	});

	$("#btnOneLess")
		.click(function() {
			oneLessBottle();
	});

});
