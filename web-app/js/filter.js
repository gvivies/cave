function filter() {
	$("#search-input").click();
}
$(document).ready(function() {
	$("#erase-input").click(
		function () {
			document.getElementById("filtered").setAttribute("value", "");
			$('#additionalFilter option:selected').removeAttr("selected"); 
			$("#search-input").click();
	});
});