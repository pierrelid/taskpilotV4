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
    console.log(steps);
    for (let position = 0; position < steps.length - 1; position++) {
      console.log(position);
      console.log(nextPosition);
      console.log("---");
      if (position === nextPosition) {
        steps[position].classList.remove("d-none");
      } else {
        steps[position].classList.add("d-none");
      }
    }
  }
}
