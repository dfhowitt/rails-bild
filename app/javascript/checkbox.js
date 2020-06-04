const clickableCheckbox = () => {
  const boxes = document.querySelectorAll(".qualification-choice")
  boxes.forEach(box => {
    box.addEventListener('click', (event) => {
      console.log(event.currentTarget)
      box.classList.toggle("active")


    })
  })
};

export { clickableCheckbox };
