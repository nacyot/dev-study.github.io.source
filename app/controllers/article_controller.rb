class ArticleController < MiddlemanController
  def index
    @articles = load_articles
  end

  def articles_proxy
    articles = load_articles.delete_if { |article| article['target'].nil? }
    proxy_collection articles, "#target#", "/articles/template.html", :article, :ignore => true
  end

  def load_articles
    articles = YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
    articles = articles.delete_if { |article| article['date'] == nil or article['published'] == false}
    articles = articles.map {|article| ArticleDecorator.new(article) }
    articles.sort { |a, b| b['date'] <=> a['date'] }
  end
end

