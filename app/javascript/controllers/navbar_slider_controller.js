import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-slider"
export default class extends Controller {
  static targets = ['mainbody', 'navbar']
  connect() {
    console.log('navbar_slider is connected!')
  }

  open() {
    this.navbarTarget.classList.add('navbar-clicked-navbar')
    this.mainbodyTarget.classList.add('navbar-clicked-mainbody')
  }

  close() {
    this.navbarTarget.classList.remove('navbar-clicked-navbar')
    this.mainbodyTarget.classList.remove('navbar-clicked-mainbody')
  }
}
