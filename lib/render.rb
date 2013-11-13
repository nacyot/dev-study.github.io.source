# Module: Middleman::CoreExtensions::Rendering::InstanceMethodsx
module Middleman
  module CoreExtensions
    module Rendering
      module InstanceMethods
        alias_method :original_render_template, :render_template
        
        # Overwrite original render_template method
        def render_template(path, locs={}, opts={}, blocks=[])
          route = find_route(path)
          locs = locs.merge(controller_variables(find_route(path))) unless route.nil?
          original_render_template(path, locs, opts, blocks)
        end

        # Helper methods
        def controller_variables(route)
          controller = route[:controller].new
          controller.send(route[:action])
          controller.instance_variables_hash
        end

        def relative_path(path)
          "." + path[ENV["MM_ROOT"].length..path.length]
        end

        def find_route(path)
          Routes.controller_routes[relative_path(path)]
        end
      end
    end
  end
end
