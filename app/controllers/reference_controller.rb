class ReferenceController < MiddlemanController
  def self.collection
    YAML.load_file("/data/references.yaml")
  end 
end
