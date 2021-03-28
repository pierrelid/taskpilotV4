import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["firstStep", "secondStep", "currentStep"];

  next(event) {
    const currentTarget = event.currentTarget;
    const currentPosition = parseInt(
      currentTarget.getAttribute("position"),
      10
    );
    const nextPosition = currentPosition + 1;
    const steps = document.getElementsByClassName("step");
    for (let position = 0; position < steps.length; position++) {
      if (position === nextPosition) {
        steps[position].classList.remove("d-none");
      } else {
        steps[position].classList.add("d-none");
      }
    }
  }

  previous(event) {
    const currentTarget = event.currentTarget;
    const currentPosition = parseInt(
      currentTarget.getAttribute("position"),
      10
    );
    const nextPosition = currentPosition - 1;
    const steps = document.getElementsByClassName("step");
    for (let position = 0; position < steps.length; position++) {
      console.log(position);
      if (position === nextPosition) {
        steps[position].classList.remove("d-none");
      } else {
        steps[position].classList.add("d-none");
      }
    }
  }
}