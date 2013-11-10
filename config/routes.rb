class Routes
  def self.routes(proxy_manager)
    PostController.collection.each do |post|
      proxy_manager.proxy "/post/#{post.title}.html", PostController::TEMPLATE, :locals =>  {:post => post}, :ignore => true
    end
  end
end
