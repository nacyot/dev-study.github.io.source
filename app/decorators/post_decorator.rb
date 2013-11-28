class PostDecorator < Draper::Decorator
  decorates :post
  delegate_all

  def crazy_title
     object.title + ""
  end
end
 
Draper.setup_orm Post
