class ArticlesListItem
  include Clearwater::Component

  attr_reader :article

  def initialize(article)
    @article = article
  end

  def render
    # Note the "key" key in this hash. This is a hint to the virtual DOM that
    # if this node is moved around, it can still reuse the same element.
    li({ key: article.id, class_name: 'article' }, [
      # The Link component will rerender the app for the new URL on click
      Link.new({ href: "/articles/#{article.id}" }, article.title),
      time({ class_name: 'timestamp' }, article.timestamp.strftime('%m/%d/%Y')),
    ])
  end
end
