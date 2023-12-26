import { Controller } from "@hotwired/stimulus"
import { HighlightJS } from "highlight.js"
import { get } from '@rails/request.js'

// Connects to data-controller="linker"
export default class extends Controller {
  async connect() {
    let response = await get(`${document.location.href}/gems_details`)
    if (response.ok) {
      this.gemfileGemsDetatils = await response.json
    }
    HighlightJS.highlightAll();
    this.addLinks()
  }

  disconnect() {
    this.element.removeEventListener('turbo:load', this.addLinks.bind(this))
  }

  addLinks() {
    this.element.querySelectorAll('pre code').forEach((node) => {
      const regex = /gem <span class="hljs-string">["']([^"']*)["']<\/span>/g;
      let match;
      while ((match = regex.exec(node.innerHTML)) !== null) {
        const gemName = match[1];
        const gemDetails = this.gemfileGemsDetatils[gemName]
        node.innerHTML = node.innerHTML.replace(match[0], `gem <span class="hljs-string" data-controller="tooltip" data-tooltip-theme-value="light" data-tooltip-content-value="${gemDetails}">"<a href="/gems/${gemName}" class='underline hover:no-underline'>${gemName}</a>"</span>`);
      }
    });
  }
}
