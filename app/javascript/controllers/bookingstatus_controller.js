import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

// Connects to data-controller="bookingstatus"
export default class extends Controller {
  connect() {
  }

  approve(e){
    e.preventDefault();
    Swal.fire({
      title: 'You will be approving the booking and it cannot be reversed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Approve",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
      }
    })
  }

  reject(e){
    e.preventDefault();
    Swal.fire({
      title: 'You will be approving the booking and it cannot be reversed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Approve",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
      }
    })
  }
}
