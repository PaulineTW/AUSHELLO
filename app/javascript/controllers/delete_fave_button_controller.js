import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["items", "button"];
  connect() {
    console.log(this.itemsTarget);
    console.log(this.buttonTarget);
    console.log("hello")
  }


  unfave(event) {
    event.preventDefault();
    // event.stopImmediatePropagation();
    console.log(event.cancelable);
    console.log("unfave")
    this.itemsTarget.remove()
    // console.log(this.buttonTarget.getsElementbyClassName)
    // var unfav_heart_element = this.buttonTarget.getElementsByClassName('fas fa-heart')[0]
    // unfav_heart_element.className = 'far fa-heart'
    // var unfav_item_elem = this.itemsTarget.getElementsByTagName('a')[0]
    // unfav_item_elem.setAttribute("data-action", "click->update-fave-button#fave")
    // unfav_item_elem.getAttribute("data-action") = "click->update-fave-button#fave"

  }



}
