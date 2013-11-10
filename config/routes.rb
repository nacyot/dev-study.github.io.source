Post.all.each do |post|
  proxy "/post/#{post.title}.html", "/post/template.html", :locals => {:post => post }, :ignore => true
end
