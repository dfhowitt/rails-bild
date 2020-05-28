const linkToTabs = () => {
  if (location.hash) {
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
    projectDiv.classList.add("show")
  }
}

export {linkToTabs};
