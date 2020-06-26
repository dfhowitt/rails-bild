const teamApplyModalButtons = () => {

  $('#teamApplicationModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var project_type = button.data('project-type') // Extract info from data-* attributes
    var project = button.data('project')
    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    var modal = $(this)
    modal.find('.project-title').text('New applications for ' + project_type)
    modal.find('.project-id').val(project)

  })

}



const submitForms = () => {
  const submitAll = document.getElementById('submitAll')
  if (submitAll) {
    submitAll.addEventListener("click", (event) =>  {
      // var forms = document.querySelectorAll(".team-form")
      var forms = document.querySelectorAll("#new_placement")
      forms.forEach((form, i) => {
        setTimeout(() => {
          form.submit();
        }, i * 5);
      })
    })
  }
}


export { teamApplyModalButtons, submitForms };
