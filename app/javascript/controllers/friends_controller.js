import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="friends"
export default class extends Controller {
  static targets = ["friendsbox"]
  connect() {
    console.log("freinds connected")
  }
  open() {
    this.friendsboxTarget.classList.toggle("d-none")
  }
}
