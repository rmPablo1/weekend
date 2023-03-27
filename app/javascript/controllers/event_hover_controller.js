import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-hover"
export default class extends Controller {
  static targets = ['info_1', 'info_2', 'info_3', 'box', 'border']
  connect() {
    console.log('event hover connected!')
  }

  show() {
    this.info_1Target.classList.remove('hidden')
    this.info_2Target.classList.remove('hidden')
    this.info_3Target.classList.remove('hidden')
    this.boxTarget.classList.add('beeble')
    this.borderTarget.classList.add('beeble2')
  }

  hide() {
    this.info_1Target.classList.add('hidden')
    this.info_2Target.classList.add('hidden')
    this.info_3Target.classList.add('hidden')
    this.boxTarget.classList.remove('beeble')
    this.borderTarget.classList.remove('beeble2')
  }

}
