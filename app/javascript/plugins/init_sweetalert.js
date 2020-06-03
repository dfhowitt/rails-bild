// import swal from 'sweetalert';
import Swal from 'sweetalert2'

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
        // swal(options).then(callback(id));
        Swal.fire({
          title: 'Are you sure?',
          text: 'You will not be able to recover this imaginary file!',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes, delete it!',
          cancelButtonText: 'No, keep it'
        }).then((result) => {
          if (result.value) {
            console.log(result)
            console.log(result.value)
            if (result.value) {
              const link = document.querySelector(`#delete-link-${id}`);
              link.click();
              value = false
            }
            Swal.fire(
              'Deleted!',
              'Your imaginary file has been deleted.',
              'success'
            )
          // For more information about handling dismissals please visit
          // https://sweetalert2.github.io/#handling-dismissals
          } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire(
              'Cancelled',
              'Your imaginary file is safe :)',
              'error'
            )
          }
        }).then(
        callback(id)
        )
      });
    });

  };
};

export { initSweetalert };
