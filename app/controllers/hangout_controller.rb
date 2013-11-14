class HangoutController < MiddlemanController
  def index
    @hangouts = YAML.load_file(ENV['MM_ROOT'] + "/data/hangouts.yaml")
  end
end
