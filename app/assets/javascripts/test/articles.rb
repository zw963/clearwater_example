class Articles
  include Clearwater::Component

  def render
    div({ id: 'articles-container '}, [
      input({ class_name: 'search-articles', onkeyup: method(:search) }),
      ul({ id: 'articles-index' }, articles.map { |article|
          ArticlesListItem.new(article)
        }),
      outlet, # This is what renders subordinate routes (e.g. Article)
    ])
  end

  def articles
    @articles ||= MyStore.fetch_articles

    if @query
      @articles.select { |article| article.match?(@query) }
    else
      @articles
    end
  end

  def search(event)
    @query = event.target.value
    call # Rerender the app
  end
end
