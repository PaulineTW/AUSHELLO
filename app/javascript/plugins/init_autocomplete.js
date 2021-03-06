import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('query');
  if (addressInput) {
    places({ container: addressInput,
    countries: ['au'] });
  }
};

export { initAutocomplete };
