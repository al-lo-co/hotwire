import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="numbers"
export default class extends Controller {
  connect() {
    console.log(this);
    this.element
  }

  add() {
    fetch("/phone_numbers/new", {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      }
    }).then(r => r.text()).then(
      text => Turbo.renderStreamMessage(text)
    );
  }
}
