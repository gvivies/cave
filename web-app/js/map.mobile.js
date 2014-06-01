var map;

function initializeMap() {
   /* Initialisation de la carte  */
   var lat = document.getElementById("latitude").getAttribute("value");
   var lng = document.getElementById("longitude").getAttribute("value");
   var dealer = new google.maps.LatLng(lat, lng);
   var myOptions = {
      zoom: 12,
      center: dealer,
      /* mapTypeId: google.maps.MapTypeId.HYBRID */
      mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   /* Chargement de la carte  */
   map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
   /* Positionnement de la ville  */
   var marker = new google.maps.Marker({
       map: map,
       position: dealer
   });
}

$("#showDealerPage").live("pageinit", function() {
	initializeMap();
});
