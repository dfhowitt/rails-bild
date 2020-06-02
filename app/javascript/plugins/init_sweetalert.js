import swal from 'sweetalert';

// const callback = (id) => {
//   return function(value) {
//     console.log(value)
//     if (value) {
//       const link = document.querySelector(`#delete-link-${id}`);
//       link.click();
//       value = false
//     }
//   }
// }

const initSweetalert = (selector, options = {}, callback = () => {} ) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swalButton) => {
      console.log("sweet alert bish")
      const id = swalButton.dataset.id
      swalButton.addEventListener('click', () => {
        swal(options).then(callback(id))
      });
    });

  };
};

export { initSweetalert };
