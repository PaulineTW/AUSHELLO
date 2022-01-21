import mapboxgl from '!mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/juliannetran/ckymji04y20xp16qsv222cqqz',
    center: [133.7751, -25.2744]
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup({ className: 'popup' })
    .setHTML(marker.info_window);

    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    // setTimeout('', 2000);
    // map.flyTo({
    //   center: [151.2,-33.9],
    //   zoom: 9,
    //   essential: true // this animation is considered essential with respect to prefers-reduced-motion
    // });
  }
  // const geocoder = document.getElementById('geocoder').appendChild(geocoder.onAdd(map));
};


export { initMapbox };
