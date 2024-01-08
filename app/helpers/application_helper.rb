module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def header_title(page_title)
    content_for(:header_title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def meta_image(meta_image)
    content_for(:meta_image) { meta_image }
  end

  def header_content(&block)
    content_for(:header_content, &block)
  end

  def header_content?
    content_for?(:header_content)
  end

  def header_action(&block)
    content_for(:header_action, &block)
  end

  def header_action?
    content_for?(:header_action)
  end

  def nav_link(text, path)
    class_name = current_page?(path) ? "px-3 py-2 text-sm font-medium text-black rounded-md bg-amber-300" : "px-3 py-2 text-sm font-medium text-white rounded-md bg-neutral-800 hover:bg-neutral-600"
    link_to text, path, class: class_name
  end
end
