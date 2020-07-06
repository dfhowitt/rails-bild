import "jquery-bar-rating"
import $ from 'jquery';

const initStarRating = () => {
  const stars = document.querySelectorAll('#rating_star_rating');
  stars.forEach((star) => {
    $(star).barrating({
      theme: 'css-stars'
  //   onSelect: (value, text, event) => {
  //     const form = $("form.rating_form"); // Selecting the form on the page with its class
  //     form.submit(); // Submit the form with javascript
  //   }
    });
  });
};

export { initStarRating };
