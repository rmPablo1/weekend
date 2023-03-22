import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ['loginphoto', 'signupphoto']
  connect() {
    console.log('im connected!')
  }

  right() {
    this.loginphotoTarget.classList.add('login-photo-transformed')
    this.signupphotoTarget.classList.add('signup-photo-transformed')
  }

  left() {
    this.loginphotoTarget.classList.remove('login-photo-transformed')
    this.signupphotoTarget.classList.remove('signup-photo-transformed')
  }
}
