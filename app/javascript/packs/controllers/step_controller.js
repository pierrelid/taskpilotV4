import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["kinfOfStep"];

  kind() {
    console.log("ttt");
  }
}
