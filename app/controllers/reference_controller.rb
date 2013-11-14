class ReferenceController < MiddlemanController
  def index
    @references = YAML.load_file(ENV['MM_ROOT'] + "/data/references.yaml")
  end 
end
