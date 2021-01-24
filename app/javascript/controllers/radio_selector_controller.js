import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["option"];

  selectRadioOption(event) {
    this.optionTarget.classList.add("active");
  }
}
