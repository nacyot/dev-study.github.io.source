class Post < ActiveRecord::Base
  def create_sample_data
    Post.create(title: "Title1", content:"Content1")
    Post.create(title: "Title2", content:"Content2")
    Post.create(title: "Title3", content:"Content3")
  end
end
