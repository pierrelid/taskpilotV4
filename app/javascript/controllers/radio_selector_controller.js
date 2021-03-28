import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["option"];

  selectRadioOption(event) {
    const choice = this.optionChoice();
    choice.classList.add("active");
    const choiceIndex = choice.getAttribute("index");
    const choicesWrapper = choice.parentNode.parentNode;
    const choices = choicesWrapper.getElementsByClassName("radio-choice");
    for (let index = 0; index < choices.length - 1; index++) {
      if (index != choiceIndex) {
        choices[index].classList.remove("active");
      }
    }
  }

  optionChoice() {
    return this.optionTarget;
  }
}
