import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"
// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log('im connected')
    new Typed(this.element, {
    strings: ["trips", "celebrations", "Weekend"],
    typeSpeed: 80,
    backSpeed: 20,
    cursorChar: '|',
    loop: false,
    onComplete: function(self) { self.cursor.remove() }
  })
  }
}
