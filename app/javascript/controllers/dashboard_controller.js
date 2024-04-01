import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets = ["delete", "toggle", "contentToggle"]

  connect() {
  }

  delete(e){
    e.preventDefault();

    Swal.fire({
      title: 'Do you wish to delete? You wont be able to reverse the process',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Delete",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
        const url = this.deleteTarget.href

        fetch(url, {method: "DELETE",
        headers: {
          "Accept": "application/json",
          "X-CSRF-Token": this.#getMetaValue("csrf-token")}
        })
        .then(response => response.json())
        .then((data)=>{
          console.log(data)
          window.location.replace("/dashboard")
        })
      }
    })

  }

  toggleable(e){
    e.preventDefault();
    this.toggleTargets.forEach ((n)=> {
      n.classList.remove('activeselect')
    })

    const header = e.target.dataset.header;

    this.contentToggleTargets.forEach ((n)=> {
      if (n.dataset.content === header) {
        n.classList.remove("d-none")} 
      else {
      n.classList.add("d-none");
      } 
    })

    e.target.classList.add('activeselect')
  }

  #getMetaValue(n) {
    const element = document.head.querySelector(`meta[name="${n}"]`)
    return element.getAttribute("content")
  }
}
