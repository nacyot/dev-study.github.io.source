class Routes < MiddlemanRoutes
  def self.proxy_routes
    register_collection_proxy PostController, "post_proxy"
  end
  
  def self.controller_routes
    {
      "./source/index.html.erb" => { controller: PostController, action: "index" }
    }
  end
end


