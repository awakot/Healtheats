
<script type="text/javascript">

  function initMap() {

    var test ={lat: <%= @restaurant.latitude %>, lng: <%= @restaurant.longitude %>};
    var map = new google.maps.Map(document.getElementById('menu-detail__restaurant--map'), {
        zoom: 18,
        center: test
    });
    var transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);
    var contentString = '住所：<%= @restaurant.address %>';
    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });
    var marker = new google.maps.Marker({
        position:test,
        map: map,
        title: contentString
    });
    marker.addListener('click', function() {
        infowindow.open(map, marker);
    });
  };
