class MiddlemanRoutes
  def self.set_managers(proxy_manager, ignore_manager)
    @@proxy_manager = proxy_manager
    @@ignore_manager = ignore_manager
  end

  def self.register_proxy(path, template, opts)
    @@proxy_manager.proxy path, template, opts
  end

  def self.register_ignore(template)
    @@ignore_manager.ignore template
  end

  def self.register_collection_proxy(controller, action)
    controller.new.send(action)
  end
end
