import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

// Connects to data-controller="popup"
export default class extends Controller {
  static targets = ["popup"]
  connect() {
    console.log(this.popupTarget)
    useClickOutside(this, { element: this.popupTarget })
  }

  open() {
    this.popupTarget.classList.toggle("d-none")
  }

  clickOutside(event) {
    // example to close a modal
    console.log("hello")
    event.preventDefault()
    this.popupTarget.classList.add("d-none")
  }
}
