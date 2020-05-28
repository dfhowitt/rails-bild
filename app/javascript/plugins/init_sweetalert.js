import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelectorAll(selector);
  if (swalButton) { // protect other pages
    swalButton.forEach(button => {
      button.addEventListener('click', () => {
      swal(options);
    });
  });
 }
};

export { initSweetalert };
