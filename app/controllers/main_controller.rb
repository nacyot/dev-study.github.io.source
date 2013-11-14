class MainController < MiddlemanController
  def index
    @articles =  YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
    @presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
    @hangouts = YAML.load_file(ENV['MM_ROOT'] + "/data/hangouts.yaml")
    @references = YAML.load_file(ENV['MM_ROOT'] + "/data/references.yaml")
  end
end



