import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-calendar"
export default class extends Controller {
  static targets = ["checkboxes", "friend"] // or "checkbox" instead of "friend"?

  connect() {
    console.log(this.element)
    console.log(this.checkboxesTarget)
    console.log(this.friendTarget)
  }
}
