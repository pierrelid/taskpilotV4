import Rails from "@rails/ujs";
import { Controller } from "stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      onEnd: this.end.bind(this)
    });
  }

  end(event) {
    let id = event.item.dataset.id;
    let data = new FormData();
    data.append("position", event.newIndex);
    Rails.ajax({
      url: this.data.get("url").replace(":id", id),
      type: "PATCH",
      data: data
    });
  }
}
