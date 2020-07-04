import "jquery-bar-rating"
import $ from 'jquery';

const initStarRating = () => {
  $('#rating_star_rating').barrating({
    theme: 'css-stars'
  //   onSelect: (value, text, event) => {
  //     const form = $("form.rating_form"); // Selecting the form on the page with its class
  //     form.submit(); // Submit the form with javascript
  //   }
  });
};

export { initStarRating };
