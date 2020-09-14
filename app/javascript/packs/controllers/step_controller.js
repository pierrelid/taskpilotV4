import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["kindOfStep", "titleInput", "bodyInput", "delayInput"];

  kind() {
    const kind = this.kindOfStepTarget;
    const titleInput = this.titleInputTarget;
    const bodyInput = this.bodyInputTarget;
    const delayInput = this.delayInputTarget;

    switch (kind.value) {
      case "EmailStep":
        this.displayElement(titleInput);
        this.displayElement(bodyInput);
        this.hideElement(delayInput);
        break;
      case "SmsStep":
        this.hideElement(titleInput);
        this.displayElement(bodyInput);
        this.hideElement(delayInput);
        break;
      case "DelayStep":
        this.hideElement(titleInput);
        this.hideElement(bodyInput);
        this.displayElement(delayInput);
        break;
    }
  }

  displayElement(element) {
    element.classList.remove("d-none");
    element.classList.add("d-block");
  }

  hideElement(element) {
    element.classList.add("d-none");
    element.classList.remove("d-block");
  }
}
