// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------


// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { clickableTabs } from '../dashboard_tabs';
import { linkToTabs } from '../manager_dashboard';
import { mapModalButtons } from '../worker_dashboard';
import { teamApplyModalButtons } from '../team_application_modal';
import { submitForms } from '../team_application_modal';
import { initStarRating } from '../plugins/init_star_rating';
// import { initStarRatingShow } from '../plugins/init_star_rating';
// import { initStarRatingAverage } from '../plugins/init_star_rating';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapboxTwo } from '../plugins/init_mapbox_two';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initFullCalendar } from '../plugins/init_fullcalendar';
import { initSweetalert } from '../plugins/init_sweetalert';
import { managerSweetalert } from '../plugins/manager_sweetalert';
import { qualificationSweetalert } from '../plugins/qualification_sweetalert';
import Swal from 'sweetalert2/dist/sweetalert2.js'
import 'sweetalert2/src/sweetalert2.scss'

// const sweetAlert = () => {
//   // console.log("sweet mofo")
//   // initSweetalert('#sweet-alert-apply', {
//   //   title: "Nice job!",
//   //   text: "You have successfully applied",
//   //   icon: "success"
//   // });

  // initSweetalert('#sweet-alert-reject', {
  //   title: "Are you sure?",
  //   text: "Once cancelled, you will have to re-apply!",
  //   icon: "warning",
  //   buttons: true,
  //   dangerMode: true,

//   }, (id) => {
//      console.log(id)
//      return (value) => {
//           console.log(value)
//           if (value) {
//             const link = document.querySelector(`#delete-link-${id}`);
//             link.click();
//             value = false
//           }
//   }});
// }

import { clickableCheckbox } from '../checkbox';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  clickableCheckbox();
  clickableTabs();
  linkToTabs();
  initMapbox();
  initMapboxTwo();
  initAutocomplete();
  // sweetAlert();
  initSweetalert('.sweet-alert-cancel');
  managerSweetalert('.sweet-alert-reject');
  qualificationSweetalert('.sweet-alert-delete');
  mapModalButtons();
  teamApplyModalButtons();
  initFullCalendar();
  submitForms();
  initStarRating();
  // initStarRatingShow();
  // initStarRatingAverage();
});



