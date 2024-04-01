import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favindex"
export default class extends Controller {
  static targets = ["favicon", "carddelete"]
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
      console.log(data.status)
      if (data.status == true) {
        this.faviconTarget.innerHTML = `<i class="fa-solid fa-heart"></i>`
        this.faviconTarget.classList.value = 'faviconred'
      } else {
        this.carddeleteTarget.outerHTML = ""
        this.faviconTarget.innerHTML = `<i class="fa-regular fa-heart"></i>`
        this.faviconTarget.classList.value = 'favicon'
        window.location.reload();
      }
    })
  }
}
