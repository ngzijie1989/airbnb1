import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fav"
export default class extends Controller {
  static targets = ["favicon"]
  static values = {id: Number}

  connect() {
  }

  fire(e){
    e.preventDefault();

    const url = `/listings/${this.idValue}/addfavorites`

    fetch(url, {
      method: 'GET', 
      headers: { "Accept": "application/json" },
    })
    .then(response => response.json())
    .then((data) => {
      if (data.status === true) {
        this.faviconTarget.innerHTML = `<i class="fa-solid fa-heart"></i>`
        this.faviconTarget.classList.value = 'faviconred'
      } else if (data.status === false ) {
        this.faviconTarget.innerHTML = `<i class="fa-regular fa-heart"></i>`
        this.faviconTarget.classList.value = 'favicon'
      } else if (data.status === "unauthorized" ) {
        window.location.replace("/users/sign_in")
        alert(data.error)

      }
    })
  }
}
