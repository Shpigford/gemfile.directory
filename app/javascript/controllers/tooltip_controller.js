import { Controller } from "@hotwired/stimulus"
import tippy from "tippy.js"

/**
 * TooltipController
 * 
 * This Stimulus controller integrates tippy.js for creating interactive tooltips.
 * It is used by adding the `data-controller="tooltip"` attribute to an HTML element.
 * 
 * Attributes:
 * - contentValue (String): Content to be displayed inside the tooltip.
 * - themeValue (String, optional): Theme for the tooltip, a tippy.js option for custom styling.
 * 
 * Usage:
 * Add `data-controller="tooltip"` to an HTML element and use `data-*` attributes
 * to customize the tooltip content and theme.
 * Example:
 * <button data-controller="tooltip" 
 *         data-tooltip-content-value="Tooltip text"
 *         data-tooltip-theme-value="light">
 *   Hover over me!
 * </button>
 */
export default class extends Controller {
  static values = {
    content: String,
    theme: String
  }

  connect() {
    const tippyOptions = {
      content: this.contentValue
    }

    if (this.hasThemeValue) {
      tippyOptions.theme = this.themeValue
    }

    tippy(this.element, tippyOptions);
  }
}
