import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButtons = document.querySelectorAll(selector);
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swalButton) => {
      const id = swalButton.dataset.id
      swalButton.addEventListener('click', () => {
        swal(options).then((value) => {
        if (value) {
          const link = document.querySelector(`#link-${id}`);
          link.click();
          value = false

        }

        })
      });
    });

  };
};

export { initSweetalert };
