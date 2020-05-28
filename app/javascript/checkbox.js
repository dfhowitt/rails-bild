const clickableCheckbox = () => {
  const boxes = document.querySelectorAll(".qualification-choice")
  boxes.forEach(box => {
    box.addEventListener('click', (event) => {
      const checkbox = event.currentTarget.querySelector('input')
      checkbox.checked = !checkbox.checked
      event.currentTarget.classList.toggle("active")
    })
  })
};

export { clickableCheckbox };
