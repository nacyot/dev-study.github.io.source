class PresentationController < MiddlemanController
  def index
    @presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
  end

  def presentations_proxy
    presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
    presentations = presentations.map {|presentation| PresentationDecorator.new(presentation) }
    proxy_collection presentations, "#target#", "/presentations/template.html", :presentation,  :ignore => true
  end
end
