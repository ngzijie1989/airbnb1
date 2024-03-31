import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
import Swal from 'sweetalert2';

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = [
    "startDate",
    "endDate",
    "days",
    "accomFee",
    "serviceFee",
    "cleaningFee",
    "total",
    "form",
    "render",
    "discount",
    "discountvalue",
    "discountedtabulated",
    "finalafterdiscount",
    "startdiscount",
    "startingpoints",
    "userpoints"
  ];

  static values = {
    id: Number
  }

  connect() {
    this.startDateChange = flatpickr( this.startDateTarget, { minDate: "today" } );
    this.endDateChange = flatpickr( this.endDateTarget, { minDate: this.getNextDay(new Date())} );
    console.log(typeof parseInt(this.discountvalueTarget.value))
    const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
    const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
  }

  update(){
    if (this.endDateTarget.value && this.startDateTarget.value) {
      this.startdiscountTarget.classList.remove("d-none")
    }

    if (this.endDateTarget.value)
      this.startDateChange.config.maxDate = this.endDateTarget.value;
    if (this.startDateTarget.value)
      this.endDateChange.config.minDate = this.getNextDay(new Date(this.startDateTarget.value));
  }
  
  fire(e){
    e.preventDefault();
    // const form = e.target.closest("form"); 
    Swal.fire({
      title: 'Do you wish to continue? Your booking will be confirmed',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: "Reserve",
      cancelButtonText: "Cancel",
    }).then((result)=>{
      if (result.isConfirmed) {
        const url = `/listings/${this.idValue}/bookings`

        const formData = new FormData(this.formTarget);
        
        formData.append('accomFee', this.accomFeeTarget.innerHTML);
        formData.append('serviceFee', this.serviceFeeTarget.innerHTML);
        formData.append('cleaningFee', this.cleaningFeeTarget.innerHTML);
        formData.append('total', this.totalTarget.innerHTML);
        formData.append('days', this.daysTarget.innerHTML);
        formData.append('discount', this.discountedtabulatedTarget.innerHTML);
        formData.append('discountedTotal', this.finalafterdiscountTarget.innerHTML);

        fetch(url, 
          {method: "POST",
          headers: { 
            "Accept": "application/json",
            "X-CSRF-Token": this.#getMetaValue("csrf-token") },
          body: formData
           })
           .then(response => response.json())
           .then((data)=>{
              if (data.status === true) {
              window.location.replace("/bookings")
              } else {
                this.renderTarget.innerHTML = data.info;
                this.startDateChange = flatpickr( this.startDateTarget, { minDate: "today" } );
                this.endDateChange = flatpickr( this.endDateTarget, { minDate: this.getNextDay(new Date())} );
                const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]')
                const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl))
              }
           })
        // form.submit();
      }
    })
  }

  discount(){
    this.discountTargets.forEach((t)=>{
      t.classList.toggle("d-none")
    })
    this.discountedtabulatedTarget.innerHTML = 0;
    this.finalafterdiscountTarget.innerHTML = 0;
  }

  range(){
    this.discountedtabulatedTarget.innerHTML = Math.ceil(this.discountvalueTarget.value / 1000) ;
    this.finalafterdiscountTarget.innerHTML = parseInt(this.totalTarget.innerHTML) - parseInt(this.discountedtabulatedTarget.innerHTML)
    const initialPoints = parseInt(this.userpointsTarget.innerHTML)
    this.startingpointsTarget.innerHTML = initialPoints - this.discountvalueTarget.value
  }

  getNextDay(date) {
    date.setDate(date.getDate()+1);

    return date;
  }

  #getMetaValue(n) {
    const element = document.head.querySelector(`meta[name="${n}"]`)
    return element.getAttribute("content")
  }

}
