class PresentationController < MiddlemanController
  def index
    @presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
  end
end
