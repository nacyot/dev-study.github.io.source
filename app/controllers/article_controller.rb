class ArticleController < MiddlemanController
  def index
    @articles = load_articles
    @articles = @articles.map {|article| ArticleDecorator.new(article) }
  end

  def articles_proxy
    articles = load_articles.delete_if { |article| article['target'].nil? }
    articles = articles.map {|article| ArticleDecorator.new(article) }
    proxy_collection articles, "#target#", "/articles/template.html", :article, :ignore => true
  end

  def load_articles
    articles = YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
    articles = articles.delete_if { |article| article['date'] == nil}
    articles.sort { |a, b| b['date'] <=> a['date'] }
  end
end

