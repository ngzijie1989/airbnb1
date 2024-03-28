import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import Swal from 'sweetalert2';

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [
    "startDate",
    "endDate"
  ];

  connect() {
    this.startDateChange = flatpickr( this.startDateTarget, { minDate: "today" } );
    this.endDateChange = flatpickr( this.endDateTarget, { minDate: this.getNextDay(new Date())} );
  }

  update(){
    if (this.endDateTarget.value)
      this.startDateChange.config.maxDate = this.endDateTarget.value;
    if (this.startDateTarget.value)
      this.endDateChange.config.minDate = this.getNextDay(new Date(this.startDateTarget.value));
  }
  
  fire(e){
    e.preventDefault();
    const form = e.target.closest("form"); 
    console.log('hello')
    Swal.fire({
      title: 'Do you wish to continue? Your booking will be confirmed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Reserve",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
        form.submit();}
    })
  }

  getNextDay(date) {
    date.setDate(date.getDate()+1);

    return date;
  }

}
