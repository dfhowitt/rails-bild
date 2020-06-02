import { initSweetalert } from './plugins/init_sweetalert';

const sweetAlert = () => {
  console.log('sweet')
  initSweetalert('#sweet-alert-apply', {
    title: "Nice job!",
    text: "You have successfully applied",
    icon: "success"
  });

  initSweetalert('#sweet-alert-cancel', {
    title: "Are you sure?",
    text: "Once cancelled, you will have to re-apply!",
    icon: "warning",
    buttons: true,
    dangerMode: true,

  }, ((id) => {
     console.log(id)
     return (value) => {
          console.log(value)
          if (value) {
            const link = document.querySelector(`#delete-link-${id}`);
            link.click();
            value = false
          }
  }}));

  // initSweetalert('#sweet-alert-reject', {
  //   title: "Are you sure?",
  //   // text: "Once ,you will not be able to recover!",
  //   icon: "warning",
  //   buttons: true,
  //   dangerMode: true,

  // }, (id) => {
  //    console.log(id)
  //    return (value) => {
  //         console.log(value)
  //         if (value) {
  //           const link = document.querySelector(`#reject-link-${id}`);
  //           link.click();
  //           value = false
  //         }

  // }});
  // .then((willDelete) => {
  //   if (willDelete) {
  //     swal("You have succesfully deleted", {
  //       icon: "success",
  //     });
  //   } else {
  //     swal("Delete cancelled!");
  //   }
  // });
}



export { sweetAlert }
