require 'opal'
require 'clearwater'
require 'rails-ujs'
require 'turbolinks'
require_tree '.'

class Layout
  include Clearwater::Component

  def render
    h1('Hello, world!')
  end
end

app = Clearwater::Application.new(component: Layout.new)
app.call
