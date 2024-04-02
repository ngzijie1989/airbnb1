import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = ["count"]
  static values = {
    initial: Number
  }

  connect() {
  }

  counter(){
    if (this.initialValue >= 1) {
    this.countTarget.innerHTML = this.initialValue - 1 }
  }
}
