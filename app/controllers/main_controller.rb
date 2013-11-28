class MainController < MiddlemanController
  def index
    @articles =  YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
    @articles = @articles.map {|article| ArticleDecorator.new(article) }
    @presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
    @presentations = @presentations.map {|presentation| PresentationDecorator.new(presentation) }
    @hangouts = YAML.load_file(ENV['MM_ROOT'] + "/data/hangouts.yaml")
    @hangouts = @hangouts.map {|hangout| HangoutDecorator.new(hangout) }
    @references = YAML.load_file(ENV['MM_ROOT'] + "/data/references.yaml")
  end
end



