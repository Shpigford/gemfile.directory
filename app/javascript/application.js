// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// Workaround to enable libraries that expect to be part of a node project
window.process = { env: {} }
