class PresentationController < MiddlemanController
  def index
    @presentations = load_presentations
  end

  def presentations_proxy
    proxy_collection load_presentations, "#target#", "/presentations/template.html", :presentation,  :ignore => true
  end

  private
  def load_presentations
    presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
    presentations = presentations.delete_if { |presentation| presentation['date'] == nil}
    presentations = presentations.map {|presentation| PresentationDecorator.new(presentation) }
    presentations.sort { |a, b| b['date'] <=> a['date'] }
  end
end
