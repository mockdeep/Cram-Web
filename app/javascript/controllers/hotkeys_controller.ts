import {Controller} from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["click"];

  clickTargets!: HTMLElement[];

  handleKeydown(event: KeyboardEvent): void {
    const key = event.key.toLowerCase();

    const clickable = this.clickTargets.find((element: HTMLElement) => {
      return element.dataset.hotkey === key;
    });

    if (clickable) { clickable.click(); }
  }
}
