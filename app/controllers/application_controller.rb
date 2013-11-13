class MiddlemanController
  # from http://stackoverflow.com/questions/2830368/in-ruby-how-can-i-get-instance-variables-in-a-hash-instead-of-an-array
  def instance_variables_hash
    Hash[instance_variables.map { |name| [name[1..name.length-1].to_sym, instance_variable_get(name)]}]
  end

  def proxy_collection(collection, path, template, local_variable_name, opts={})
    collection.each do |item|
      opts[:locals] = opts[:locals] ? opts[:locals].merge({local_variable_name.to_sym => item}) : {local_variable_name.to_sym => item}
      item_path = path.sub(/\#(.*?)\#/){ item.send($1) }
      MiddlemanRoutes.register_proxy item_path, template, opts
    end
    MiddlemanRoutes.register_ignore template
  end
end
