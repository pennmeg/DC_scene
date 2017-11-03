$(document).on('turbolinks:load', function() {
  console.log("It works on each visit!");

  function getJsonData(e) {
    console.log("======= getJsonData =======");
    e.preventDefault()
    var mapContainer = document.getElementById('map');
    console.log("mapContainer:", mapContainer);
    // var latLon = { lat: 38.904706, lng: -77.034715 };
    // console.log("latLon:", latLon);
    var zoom = 15;

    var url = "/local_places_json";
    var neighborhood = $("#neighborhood").val();
    console.log("neighborhood:", neighborhood);
    var type = $("#type").val();
    console.log("type:", type);
    var latLon = getLatLon(neighborhood)

    map = new google.maps.Map(mapContainer, {
        center: latLon,
        minZoom: 11,
        maxZoom: 20,
        disableDefaultUI: true,
        disableDoubleClickZoom: true,
        disableDragZoom: true,
        draggable: true,
        zoom: zoom
    });
    console.log("map:", map);


    $.ajax({
        url: url,
        data: { neighborhood: neighborhood, type: type },
        method: "GET",
        dataType: "json"
    }).done(function(jsonData) {
        console.log("*** ajax success ***");
        jsonArray = jsonData.place_data_array;
        console.dir(jsonArray)
        displayPlaceMarkers(jsonArray);
    }).fail(function(){
        console.log("*** ajax fail ***");
    }).error(function() {
        console.log("*** ajax error ***");
    });

    var iconSize = 0.2;
    var icon = {
        path: "M-20,0a20,20 0 1,0 40,0a20,20 0 1,0 -40,0",
        fillColor: "red",
        strokeColor: "green",
        fillOpacity: 1,
        strokeWeight: 1,
        scale: iconSize
    }


    function displayPlaceMarkers(jsonData) {
        console.log("== displayPlaceMarkers ==");
        var nextPlace, nextName, nextLat, nextLon;
        for (var i = 0; i < jsonData.length; i++) {
            nextPlace = jsonData[i];
            nextName = jsonData[i].name;
            nextLat = jsonData[i].geometry.location.lat;
            nextLon = jsonData[i].geometry.location.lng;
            var mapLatlng = new google.maps.LatLng(nextLat, nextLon);

            var placeMarker = new google.maps.Marker({
                map: map,
                icon: icon,
                title: nextName,
                draggable: false,
                optimized: false,
                position: mapLatlng,
                defaultColor: "red"
            });

            placeMarker.addListener('click', function(e) {
                console.log("== placeMarker:click ==");
                var loc = placeMarker.getPosition();
                console.log("loc.lat():", loc.lat());
                console.log("loc.lng():", loc.lng());
            });
        }
    }
    function getLatLon(neighborhood) {
        console.log("== getLatLon ==");
        switch (neighborhood) {
            case "Downtown":
                loc = { lat: 38.904706, lng: -77.034715};
                break;
            case "U St":
                loc = { lat: 38.916965, lng: -77.029642};
                break;
            case "Bloomingdale":
                loc = { lat: 38.915730, lng: -77.012186};
                break;
            case "Columbia Heights":
                loc = { lat: 38.930178, lng: -77.032753};
                break;
            case "Petworth":
                loc = { lat: 38.937189, lng: -77.021885};
                break;
            case "11th St":
                loc = { lat: 38.931806, lng: -77.028258};
                break;
            default:
                loc = { lat: 38.904706, lng: -77.034715};
        }
        return loc;
    }
    function getType(type) {
        console.log("== getType ==");
        switch (type) {
            case "Food":
                type = "food";
                break;
            case "Bars":
                type = "bar";
                break;
            case "Book Stuff":
                type = "library";
                break;
            case "Gyms":
                type = "gym";
                break;
            case "Movie Theaters":
                type = "movie_theater";
                break;
            case "Night Clubs":
                type = "night_club";
                break;
            case "Parks":
                type = "park";
                break;
            case "Museums":
                type = "museum";
                break;
            default:
                type = "food";
        }
        return type;
    }
  }
  $("#get-places-data").on("click", getJsonData);
});
