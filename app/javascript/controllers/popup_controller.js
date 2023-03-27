import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["box", "form"]
  connect() {
    console.log(this.formTarget)
    // console.log("3")
  }
  open() {
    this.boxTarget.classList.toggle("d-none")
  }

  open2() {
    this.formTarget.classList.toggle("d-none")
  }
}
