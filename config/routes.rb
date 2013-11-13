class Routes
  def self.routes(proxy_manager, ignore_manager)
    posts = PostController.collection

    posts.each do |post|
      proxy_manager.proxy "/post/#{post.title}.html", PostController::TEMPLATE, :locals =>  {:post => post}, :ignore => true
    end
    ignore_manager.ignore PostController::TEMPLATE
  end
end


