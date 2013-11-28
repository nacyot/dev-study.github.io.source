class PostController < MiddlemanController
  def index
    @posts = PostsDecorator.new(PostDecorator.all)
  end

  def post_proxy
    posts = PostsDecorator.new(PostDecorator.all)
    proxy_collection posts, "/post/#title#.html", "/post/template.html", :post, :ignore => true
  end
end
