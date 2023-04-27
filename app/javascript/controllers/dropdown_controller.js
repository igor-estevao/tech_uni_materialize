import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  
  static targets = ["trigger", "content"]

  connect() {
    // this.triggerTarget.addEventListener("click", this.toggleContent.bind())
  }

  toggle(e){
    this.contentTarget.hidden = !this.contentTarget.hidden
  }

}
