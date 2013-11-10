class ActiverecordTest
  VAR = "Variable test"
  
  def initialize
    
  end

  def hello
    Post.create(title: "Title1", content:"Content1")
    Post.create(title: "Title2", content:"Content2")
    Post.create(title: "Title3", content:"Content3")
  end
end
