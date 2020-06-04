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

const managerSweetalert = (selector, options = {}, callback = () => {} ) => {
  const swalButtons = document.querySelectorAll(selector);
  console.log(swalButtons)
  if (swalButtons) { // protect other pages
    swalButtons.forEach((swalButton) => {

      console.log("sweet alert bish")
      const id = swalButton.dataset.id

      swalButton.addEventListener('click', () => {
        // swal(options).then(callback(id));
        Swal.fire({
          title: 'Are you sure?',
          text: 'This applicant will be rejected from this placement!',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes, reject',
          cancelButtonText: 'No, keep it'
        }).then((result) => {
          if (result.value) {
            console.log(result)
            console.log(result.value)
            if (result.value) {
              const link = document.querySelector(`#reject-${id}`);
              setTimeout(function() {
              link.submit();

              }, 1500 );

            }
            Swal.fire(
              'Rejected!',
              'This application has been rejected',
              'success'
            )
          // For more information about handling dismissals please visit
          // https://sweetalert2.github.io/#handling-dismissals
          } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire(
              'Aborted!',
              'This application has NOT been rejected',
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

export { managerSweetalert };

