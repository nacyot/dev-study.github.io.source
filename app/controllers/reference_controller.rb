class ReferenceController < MiddlemanController
  def index
    @references = YAML.load_file(ENV['MM_ROOT'] + "/data/references.yaml")
    @references = @references.delete_if { |reference| reference['user'] == nil}
    @references = @references.sort { |a, b| a['user'] <=> b['user'] }
  end 
end
