class HangoutController < MiddlemanController
  def index
    @hangouts = load_hangouts
  end

  def hangouts_proxy
    proxy_collection load_hangouts, "#target#", "/hangouts/template.html", :hangout,  :ignore => true
  end

  private
  def load_hangouts
    hangouts = YAML.load_file(ENV['MM_ROOT'] + "/data/hangouts.yaml")
    hangouts = hangouts.delete_if { |hangout| hangout['date'] == nil}
    hangouts = hangouts.map {|hangout| HangoutDecorator.new(hangout) }
    hangouts.sort { |a, b| b['date'] <=> a['date'] }
  end
end
