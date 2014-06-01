$(function(){
	function calculateDashboardPosition() {
		var max = parseInt($(window).width());
		var dash =  parseInt($("#dashboard-content").css("width"));
		var left = parseInt($("#tabs").css("margin-left"))+parseInt($("#tabs").css("width")) + 32;
		var width = 300; 
		if (left + width > max) {
			$("#dashboard-content").css("left", "-288px");
		} else {
			$("#dashboard-content").css("left", "14px");
		}
	}

	$(document).ready(function() {
		
		function showDashboard() {
			var wDash = calculateDashboardPosition();
			$("#dashboard-content").fadeToggle("slow");
			$("#dashboard-content").css("width",wDash + "px")
			$("#dashboard-content").show();
		}
		$("#dashboard-picto")
				.click(function() {
				if ($("#dashboard-content").css("display") == "none") {
					$(this).removeClass("picto-notif").addClass("picto-close");
				} else {
					$(this).removeClass("picto-close").addClass("picto-notif");
				}
				showDashboard();
		});
	});
});
