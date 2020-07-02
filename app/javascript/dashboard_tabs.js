const clickableTabs = () => {
  const tabs = document.querySelectorAll(".worker-tab");
  const tabPanes = document.querySelectorAll(".worker-tab-pane");

  tabs.forEach((tab) => {
    tab.addEventListener("click", (event) => {
      event.preventDefault();

      const pane_id = event.currentTarget.getAttribute("id").slice(4);
      const pane = document.getElementById(pane_id);

      const active_tab = document.querySelector(".worker-tab.active");
      const active_pane = document.querySelector(".worker-tab-pane.active");

      active_tab.classList.remove("active");
      active_pane.classList.remove("active");
      event.currentTarget.classList.add("active");
      pane.classList.add("active");
    });
  });
}

export {clickableTabs};
