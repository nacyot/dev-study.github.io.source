class PostController
  TEMPLATE = "/post/template.html"

  def self.collection
    PostsDecorator.new(PostDecorator.all)
  end 
end
