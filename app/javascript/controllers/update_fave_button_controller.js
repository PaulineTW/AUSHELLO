import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["items", "button"];
  connect() {
    console.log(this.itemsTarget);
    console.log(this.buttonTarget);
    console.log("hello")
  }


  fave(event) {
    event.preventDefault();
    // event.stopImmediatePropagation();
    console.log(event.cancelable);
    console.log("fave")
    console.log(this.buttonTarget.getElementsByClassName('far fa-heart')[0].className)
    var fav_heart_element = this.buttonTarget.getElementsByClassName('far fa-heart')[0]
    fav_heart_element.className = 'fas fa-heart'
    console.log(this.itemsTarget.getElementsByTagName('a')[0].getAttribute("data-action"))
    var fav_item_elem = this.itemsTarget.getElementsByTagName('a')[0]
    fav_item_elem.setAttribute("data-action", "click->update-fave-button#unfave")
    // console.log(fav_item_elem.getAttribute("data-action"))
  }

  unfave(event) {
    event.preventDefault();
    // event.stopImmediatePropagation();
    console.log(event.cancelable);
    console.log("unfave")
    console.log(this.buttonTarget.href)
    var unfav_heart_element = this.buttonTarget.getElementsByClassName('fas fa-heart')[0]
    unfav_heart_element.className = 'far fa-heart'
    var unfav_item_elem = this.itemsTarget.getElementsByTagName('a')[0]
    unfav_item_elem.setAttribute("data-action", "click->update-fave-button#fave")
    // unfav_item_elem.getAttribute("data-action") = "click->update-fave-button#fave"

  }



}
