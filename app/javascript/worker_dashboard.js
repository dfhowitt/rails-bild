import { initMapbox } from 'plugins/init_mapbox';

const mapModalButtons = () => {
  const mapButtons = document.querySelectorAll(".map-button");
  const mapModalBG = document.querySelector(".map-modal-background");
  const mapModal = document.querySelector(".map-modal")
  const mapElement = document.getElementById('map');

  if (mapButtons.length !== 0) {
    mapButtons.forEach((mapButton) => {
      mapButton.addEventListener("click", (event) => {
        mapModal.querySelector(".map").setAttribute("id", "map");
        mapModalBG.classList.remove("d-none");
        mapModalBG.classList.add("d-flex");
        initMapbox(mapButton.dataset.latitude, mapButton.dataset.longitude);
      });
    });
  }

  const closeButton = document.querySelector(".close-modal")

  if (closeButton) {
    closeButton.addEventListener("click", (event) => {
      mapModalBG.classList.remove("d-flex");
      mapModalBG.classList.add("d-none");
    });
  }
}

export {mapModalButtons};
