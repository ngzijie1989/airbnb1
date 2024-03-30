import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

// Connects to data-controller="bookingstatus"
export default class extends Controller {
  static values = {
    id: Number
  }

  connect() {
  }

  approve(e){
    e.preventDefault();
    Swal.fire({
      title: 'You will be approving the booking and the process cannot be reversed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Approve",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
        const url = `/bookings/${this.idValue}/approvebooking`

        fetch(url, 
          {method: "GET",
          headers: { 
            "Accept": "application/json",
            "X-CSRF-Token": this.#getMetaValue("csrf-token") }
           })
           .then(response => response.json())
           .then((data)=>{
            window.location.href="/dashboard"
           })
        
      }
    })
  }

  reject(e){
    e.preventDefault();
    Swal.fire({
      title: 'You will be rejecting the booking and the process cannot be reversed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Reject",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
        const url = `/bookings/${this.idValue}/rejectbooking`
        
        fetch(url, 
          {method: "GET",
          headers: { 
            "Accept": "application/json",
            "X-CSRF-Token": this.#getMetaValue("csrf-token") }
           })
           .then(response => response.json())
           .then((data)=>{
            window.location.href="/dashboard"
           })
      }
    })
  }

  #getMetaValue(n) {
    const element = document.head.querySelector(`meta[name="${n}"]`)
    return element.getAttribute("content")
  }
}
