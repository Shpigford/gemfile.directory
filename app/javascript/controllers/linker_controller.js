import { Controller } from "@hotwired/stimulus"
import { HighlightJS } from "highlight.js"

// Connects to data-controller="linker"
export default class extends Controller {
  connect() {
    console.log('Connected')
    HighlightJS.highlightAll();
    this.addLinks()
  }

  disconnect() {
    console.log('Disconnected')
    this.element.removeEventListener('turbo:load', this.addLinks.bind(this))
  }

  addLinks() {
    console.log('Adding links')
    this.element.querySelectorAll('pre code').forEach((node) => {
      console.log('Adding links to', node)
      const regex = /gem <span class="hljs-string">["']([^"']*)["']<\/span>/g;
      let match;
      while ((match = regex.exec(node.innerHTML)) !== null) {
        const gemName = match[1];
        node.innerHTML = node.innerHTML.replace(match[0], `gem <span class="hljs-string">"<a href="/gems/${gemName}" class='underline hover:no-underline'>${gemName}</a>"</span>`);
      }
    });
  }
}
