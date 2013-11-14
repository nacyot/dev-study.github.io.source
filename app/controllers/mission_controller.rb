class MissionController < MiddlemanController
  def index
    @missions = YAML.load_file(ENV['MM_ROOT'] + "/data/missions.yaml")
  end
end
