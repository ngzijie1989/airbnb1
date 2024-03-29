import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pricecalc"
export default class extends Controller {
  static targets = [
    "pricePerNight", 
    "serviceFeePerNight", 
    "cleaningFeePerNight", 
    "total",
    "calcStartDate",
    "calcEndDate",
    "days"]

  static values = {
    night: Number,
    servicefee: Number,
    cleaningfee: Number
  }

  connect() {

  }

  calc(){
    const startDate = Date.parse(this.calcStartDateTarget.value)
    const endDate = Date.parse(this.calcEndDateTarget.value)

    const days = (endDate - startDate) / 3600 / 24 / 1000
    
    if (isNaN(startDate) || isNaN(endDate)) {
    this.pricePerNightTarget.innerHTML = `0`
    this.serviceFeePerNightTarget.innerHTML = `0`
    this.cleaningFeePerNightTarget.innerHTML = `0`
    this.totalTarget.innerHTML = `0`

    } else {
    let a = days * this.nightValue;
    let b = days * this.servicefeeValue;
    let c = days * this.cleaningfeeValue;
    
    this.daysTargets.forEach ((day) => {
      day.innerHTML = days
    });
    this.pricePerNightTarget.innerHTML = days * this.nightValue
    this.serviceFeePerNightTarget.innerHTML = days * this.servicefeeValue
    this.cleaningFeePerNightTarget.innerHTML = days * this.cleaningfeeValue
    this.totalTarget.innerHTML = a + b + c
    }
  }

}
