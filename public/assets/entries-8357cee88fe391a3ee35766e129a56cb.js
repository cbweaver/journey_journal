(function(){var t,e,n;t=function(t){return $(document).ready(t),$(document).on("page:load",t)},e=function(){return $(".entry")},n=function(){var t,n;return window.location.pathname.match(/.*entries\/new$/)&&(n=new Map("map"),n.setDimensions("100%","300px"),n.initialize(),console.log("adding entries"),t=e(),t.each(function(){var t,e,i;return t=$(this).find(".location").text().split(","),i=$(this).find(".title").text(),e={lat:t[0],lng:t[1],title:i},n.addMarker(e)}),n.connectMarkers(),n.autoCenter(),n.enableSetLatLngByClick(!1)),window.location.pathname.match(/.*entries\/[0-9]+\/edit$/)&&(console.log("edit.html.erb map"),n=new Map("map"),n.setDimensions("100%","300px"),n.initialize(),t=e(),t.each(function(){var t,e,i;return t=$(this).find(".location").text().split(","),i=$(this).find(".title").text(),e={lat:t[0],lng:t[1],title:i},n.addMarker(e),n.setCenter(t[0],t[1]),n.setZoom(10)}),n.connectMarkers(),n.enableSetLatLngByClick(!0)),window.location.pathname.match(/.*journeys\/[0-9]+\/entries\/[0-9]+$/)?(n=new Map("map"),n.setDimensions("100%","500px"),n.initialize(),t=e(),t.each(function(){var t,e,i;return t=$(this).find(".location").text().split(","),i=$(this).find(".title").text(),e={lat:t[0],lng:t[1],title:i,icon:{fillColor:"#2C3E50"}},$(this).hasClass("focus")&&(e.icon.fillColor="#E74C3C",n.setCenter(e.lat,e.lng),n.setZoom(9)),n.addMarker(e)}),n.connectMarkers({strokeColor:"#2C3E50"})):void 0},t(n)}).call(this);