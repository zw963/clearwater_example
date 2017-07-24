require 'opal'
require 'clearwater'
require 'ostruct'
require 'rails-ujs'
require 'turbolinks'
require_tree '.'              # Use this will cause browser log error, don't know why.
# require_tree './test'           # this worked

class Layout
  include Clearwater::Component

  def render
    div({ id: 'app' }, [
      header({ class_name: 'main-header' }, [
        h1('Hello, world!')
      ]),
      outlet, # This is what renders subordinate routes
    ])
  end
end

# require 'article'
# require 'articles'
# require 'articles_list_item'
# require 'my_store'

router = Clearwater::Router.new do
  route 'articles' => Articles.new do
    route ':article_id' => Article.new
  end
end

MyApp = Clearwater::Application.new(
  component: Layout.new,
  router:    router,
  element:   Bowser.document.body # This is the default target element
)

MyApp.call # Render the app.
