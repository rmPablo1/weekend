import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sync"
export default class extends Controller {
  static values = {
    clientId: String,
    apiKey: String
  }

  connect() {
    // Discovery doc URL for APIs used by the quickstart
    this.discoveryDoc = 'https://www.googleapis.com/discovery/v1/apis/calendar/v3/rest';

    // Authorization scopes required by the API; multiple scopes can be
    // included, separated by spaces.
    this.scopes = 'https://www.googleapis.com/auth/calendar';

    this.tokenClient;
    this.gapiInited = false;
    this.gisInited = false;
  }

  /* exported gapiLoaded */
  /* exported gisLoaded */
  /* exported handleAuthClick */
  /* exported handleSignoutClick */

  // TODO(developer): Set to client ID and API key from the Developer Console


}
