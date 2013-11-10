class PostDecorator < Draper::Decorator
  decorates :post
  delegate_all

  def crazy_title
     object.title + "aoeutae2423aoeaoeuaeouaoeu213213"
  end
end
 
Draper.setup_orm Post
