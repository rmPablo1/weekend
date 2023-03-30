import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["popup"]
  connect() {
    console.log(this.popupTarget);
  }

  open(event) {
    console.log("open")
    console.log(event.target)
    console.log("3")
    if (event.target.tagName == "TD" || event.target.tagName == "BUTTON") {
      this.popupTarget.classList.remove("d-none");
    }
  }

  close(event) {
    // example to close a modal
    console.log("close")
    event.stopImmediatePropagation()
    this.popupTarget.classList.add("d-none");
  }
}
