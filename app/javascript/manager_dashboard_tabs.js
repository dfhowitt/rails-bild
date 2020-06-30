const clickableManagerTabs = () => {
  const url_path = location.pathname.split("/")
  const last_path_part = url_path[url_path.length - 1]
  if (location.hash && last_path_part === "dashboard") {
    const url_hashes = location.hash.slice(1).split("&");
    const site = url_hashes[0];
    const project = url_hashes[1];

    // Removing active class from defaults
    const defaultActiveSiteTab = document.querySelector(".list-group .active");
    const defaultActiveSiteDiv = document.querySelector(".tab-content .active");
    defaultActiveSiteTab.classList.remove("active");
    defaultActiveSiteDiv.classList.remove("show", "active");

    // Adding active class to site passed in url
    const siteTab = document.querySelector(`[href="#${site}"]`);
    const siteDiv = document.getElementById(site);
    siteTab.classList.add("active");
    siteDiv.classList.add("show", "active");

    // Adding show class to project passed in url
    const projectDiv = document.getElementById(project);
    projectDiv.classList.add("show");
    projectDiv.scrollIntoView();
  }
}

export {clickableManagerTabs};
