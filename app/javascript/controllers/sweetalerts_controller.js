import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

// Connects to data-controller="sweetalerts"
export default class extends Controller {
  static targets = ["logout"]

  connect() {
  }

  // logout(e){
  //   e.preventDefault();
  //   console.log(this.logoutTarget.getAttribute("href"))
  //   Swal.fire({
  //     title: "Are you sure?",
  //     icon: "warning",
  //     showCancelButton: true,
  //     confirmButtonColor: "#3085d6",
  //     cancelButtonColor: "#d33",
  //     confirmButtonText: "Logout"
  //   }).then((result)=>{
  //     if (result.isConfirmed) {
  //       const url = this.logoutTarget.getAttribute("href");
  //       console.log(this.logoutTarget.getAttribute("href"))

  //       fetch(url, {
  //         method: "DELETE",
  //         headers: {
  //           "Content-Type": "application/json",
  //           "X-CSRF-Token": this.#getMetaValue("csrf-token")
  //         },
  //       })
  //       .then(response => {
  //         if (response.ok) {
  //           window.location.href = this.logoutTarget.getAttribute("href");
  //         }
  //       })
  //     }
  //   })
  // }

  // #getMetaValue(n) {
  //   const element = document.head.querySelector(`meta[name="${n}"]`)
  //   return element.getAttribute("content")
  // }
}
