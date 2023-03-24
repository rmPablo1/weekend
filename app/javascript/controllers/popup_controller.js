import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["box"]
  connect() {
    // console.log(this.boxTarget)
    // console.log("3")
  }
  open() {
    this.boxTarget.classList.toggle("d-none")
  }
}
