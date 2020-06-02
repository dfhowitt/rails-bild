import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {

    var placesAutocomplete = places({

      appId: "pl3WU9QTDZBJ",
      apiKey: "6aa3740b6243254ed30dd08dcf54f8b7",
      container: addressInput,
      templates: {
        value: function(suggestion) {
          return suggestion.name + ", " + suggestion.county + ", " + suggestion.administrative
        }
      }

    }).configure({
      type: "city",
    });
  }
};

export { initAutocomplete };
