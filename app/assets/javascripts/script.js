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
            case "Adams Morgan":
                loc = { lat: 38.921242, lng: -77.043493};
                break;
            case "American University Park":
                loc = { lat: 38.945505, lng: -77.088103};
                break;
            case "Anacostia":
                loc = { lat: 38.863055, lng: -76.983028};
                break;
            case "Benning Heights":
                loc = { lat: 38.881779, lng: -76.936085};
                break;
            case "Brentwood":
                loc = { lat: 38.919090, lng: -77.990228};
                break;
            case "Brightwood":
                loc = { lat: 38.966147, lng: -77.027634};
                break;
            case "Brookland":
                loc = { lat: 38.933842, lng: -76.984468};
                break;
            case "Buena Vista":
                loc = { lat: 38.851149, lng: -76.968627};
                break;
            case "Capitol Hill":
                loc = { lat: 38.886043, lng: -76.999525};
                break;
            case "Capitol View":
                loc = { lat: 38.889927, lng: -76.925413};
                break;
            case "Cathedral Heights":
                loc = { lat: 38.933473, lng: -77.079835};
                break;
            case "Chevy Chase":
                loc = { lat: 38.964001, lng: -77.067619};
                break;
            case "Chinatown":
                loc = { lat: 38.899834, lng: -77.021741};
                break;
            case "Cleveland Park":
                loc = { lat: 38.936343, lng: -77.063642};
                break;
            case "Columbia Heights":
                loc = { lat: 38.928770, lng: -77.030539};
                break;
            case "Downtown":
                loc = { lat: 38.903741, lng: -77.036297};
                break;
            case "Dupont Circle":
                loc = { lat: 38.909694, lng: -77.043339};
                break;
            case "Fairfax Village":
                loc = { lat: 38.863887, lng: -76.950623};
                break;
            case "Foggy Bottom":
                loc = { lat: 38.900692, lng: -77.051825};
                break;
            case "Fort Totten":
                loc = { lat: 38.948155, lng: -77.008945};
                break;
            case "Friendship Heights":
                loc = { lat: 38.956571, lng: -77.083787};
                break;
            case "Georgetown":
                loc = { lat: 38.909706, lng: -77.065357};
                break;
            case "Glover Park":
                loc = { lat: 38.920945, lng: -77.077200};
                break;
            case "Greenway":
                loc = { lat: 38.883572, lng: -76.959985};
                break;
            case "Hillcrest":
                loc = { lat: 38.863346, lng: -76.962866};
                break;
            case "Howard U":
                loc = { lat: 38.922684, lng: -77.019438};
                break;
            case "Ivy City":
                loc = { lat: 38.914751, lng: -76.985908};
                break;
            case "Judiciary Square":
                loc = { lat: 38.898723, lng: -77.016365};
                break;
            case "Knox Hill":
                loc = { lat: 38.853446, lng: -76.966919};
                break;
            case "Lincoln Heights":
                loc = { lat: 38.895717, lng: -76.931176};
                break;
            case "Logan Circle":
                loc = { lat: 38.909641, lng: -77.029637};
                break;
            case "Michigan Park":
                loc = { lat: 38.945229, lng: -76.983028};
                break;
            case "Mt. Vernon Square":
                loc = { lat: 38.902956, lng: -77.023063};
                break;
            case "Navy Yard":
                loc = { lat: 38.876465, lng: -77.000555};
                break;
            case "NoMa":
                loc = { lat: 38.900498, lng: -77.007505};
                break;
            case "Pleasant Hill":
                loc = { lat: 38.863839, lng: -76.989412};
                break;
            case "Shaw":
                loc = { lat: 38.910946, lng: -77.020462};
                break;
            case "Takoma":
                loc = { lat: 38.972546, lng: -77.020462};
                break;
            case "Tenleytown":
                loc = { lat: 38.945982, lng: -77.080909};
                break;
            case "U Street":
                loc = { lat: 38.917000, lng: -77.025328};
                break;
            case "Woodley Park":
                loc = { lat: 38.927994, lng: -77.057885};
                break;
            case "Woodridge":
                loc = { lat: 38.933334, lng: -76.968627};
                break;
            case "Not Listed":
                loc = { lat: 38.8977, lng: -77.0365};
                break;
            default:
                loc = { lat: 38.8977, lng: -77.0365};
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
