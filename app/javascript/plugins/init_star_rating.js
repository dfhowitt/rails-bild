import "jquery-bar-rating"
import $ from 'jquery';

const initStarRating = () => {
  const ratings = document.querySelectorAll('#rating_star_rating');
  ratings.forEach((rating) => {
    $(rating).barrating({
      theme: 'css-stars'
  //   onSelect: (value, text, event) => {
  //     const form = $("form.rating_form"); // Selecting the form on the page with its class
  //     form.submit(); // Submit the form with javascript
  //   }
    });
  });
};

// const initStarRatingShow = () => {
//   const givenRatings = document.querySelectorAll('#history-rating');
//   givenRatings.forEach((rating) => {
//   $(rating).barrating('show', {
//     theme: 'css-stars',
//     initialRating === @average_rating,
//     readonly: true
//   //   onSelect: (value, text, event) => {
//   //     const form = $("form.rating_form"); // Selecting the form on the page with its class
//   //     form.submit(); // Submit the form with javascript
//   //   }
//     });
//   });
// };

// const initStarRatingAverage = () => {
//   $('#average-rating').barrating('show', {
//     theme: 'css-stars',
//     initialRating: @average_rating,
//     readonly: true
//   //   onSelect: (value, text, event) => {
//   //     const form = $("form.rating_form"); // Selecting the form on the page with its class
//   //     form.submit(); // Submit the form with javascript
//   //   }
//   });
// };

export { initStarRating
  // , initStarRatingShow, initStarRatingAverage
};
