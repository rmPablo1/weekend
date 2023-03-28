import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-hover"
export default class extends Controller {
  static values = { 'events' :Array, 'friends' :Array}
  static targets = ['border', 'info']

  connect() {
    // colorArray = // ACCEPTABLE COLORS
    const colorArray = ["#70D3D8", "#8be483", "#FFABAB", "#E0C9F0", "#FFDC89", "#8AB7FF"]
    console.log('event hover connected!')
    console.log(this.eventsValue)
    console.log(this.friendsValue)
    this.borderTarget.style.backgroundColor = colorArray[Math.floor(Math.random() * colorArray.length)];
  }

  show() {
    this.infoTarget.classList.remove('hidden')
    this.borderTarget.classList.add('beeble2')
  }

  hide() {
    this.infoTarget.classList.add('hidden')
    this.borderTarget.classList.remove('beeble2')
  }

}
