import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-hover"
export default class extends Controller {
  static values = { 'events' :Array }
  static targets = ['border', 'info']

  connect() {
    console.log('event hover connected!')
  }

  show() {
    this.infoTarget.classList.toggle('hidden')
    this.borderTarget.classList.toggle('beeble2')
  }

    // hide() {
    //   this.infoTarget.classList.add('hidden')
    //   this.borderTarget.classList.remove('beeble2')
    // }

}
