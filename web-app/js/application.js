var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}

$("#main-page").live("pageinit", function() {
	$.mobile.defaultPageTransition = "none";
    $.mobile.defaultDialogTransition  = "none";
});

/*
$(document).on("click", ".drinkable", function() {
	$.mobile.changePage("#drinkPopupPage", { transition: "slideup"});
});
*/
