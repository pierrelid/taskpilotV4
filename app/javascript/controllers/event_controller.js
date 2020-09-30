import { Controller } from "stimulus";

export default class extends Controller {
  displayEventForm() {
    console.log("Hello, Stimulus!", this.element);
  }
}
