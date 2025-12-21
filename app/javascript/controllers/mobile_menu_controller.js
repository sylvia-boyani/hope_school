import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "openIcon", "closeIcon"]

  toggle() {
    const isOpened = this.menuTarget.classList.contains("hidden")

    if (isOpened) {
      // OPENING THE MENU
      this.menuTarget.classList.remove("hidden")
      this.openIconTarget.classList.add("hidden")   // Hide Burger
      this.closeIconTarget.classList.remove("hidden") // Show X
    } else {
      // CLOSING THE MENU
      this.menuTarget.classList.add("hidden")
      this.openIconTarget.classList.remove("hidden") // Show Burger
      this.closeIconTarget.classList.add("hidden")    // Hide X
    }
  }
}