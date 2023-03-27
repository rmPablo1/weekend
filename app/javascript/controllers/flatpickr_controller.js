import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {})
    flatpickr(this.endTimeTarget, {})
    flatpickr(this.startTimeTarget, {
      enableTime: true,
      altInput: true,
    });
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      altInput: true,
    });
  }
}
