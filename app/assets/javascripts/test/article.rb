class Article
  include Clearwater::Component

  def render
    # In addition to using HTML5 tag names as methods, you can use the `tag`
    # method with a query selector to generate a tag with those attributes.
    tag('article.selected-article', nil, [
      h1({ class_name: 'article-title' }, article.title),
      time({ class_name: 'article-timestamp' }, article.timestamp.strftime('%m-%d-%Y')),
      section({ class_name: 'article-body' }, article.body),
    ])
  end

  def article
    # params[:article_id] is the section of the URL that contains what would be
    # the `:article_id` parameter in the router below.
    MyStore.article(params[:article_id])
  end

  def match? query
    query.split.all? { |token|
      title.include?(token) || body.include?(token)
    }
  end
end
