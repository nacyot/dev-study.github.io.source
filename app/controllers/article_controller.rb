class ArticleController < MiddlemanController
  def index
    @articles = YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
  end
end
