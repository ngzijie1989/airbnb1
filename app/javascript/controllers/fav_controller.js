import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fav"
export default class extends Controller {
  static targets = ["favicon"]
  static values = {id: Number}

  connect() {
    console.log(this.faviconTarget.innerHTML)
  }

  fire(e){
    e.preventDefault();

    const url = `/listings/${this.idValue}/addfavorites`
    console.log(url)

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
        this.faviconTarget.innerHTML = `<i class="fa-regular fa-heart"></i>`
        this.faviconTarget.classList.value = 'favicon'
      }
    })
  }
}
