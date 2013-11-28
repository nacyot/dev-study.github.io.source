class TagController < MiddlemanController
  def tags_proxy
    tags = load_tags
    proxy_collection tags, "#path#", "/tags/template.html", :tag, :ignore => true
  end

  def load_tags
    articles = YAML.load_file(ENV['MM_ROOT'] + "/data/articles.yaml")
    articles = articles.map {|article| ArticleDecorator.new(article) }

    presentations = YAML.load_file(ENV['MM_ROOT'] + "/data/presentations.yaml")
    presentations = presentations.map {|presentation| PresentationDecorator.new(presentation) }

    hangouts = YAML.load_file(ENV['MM_ROOT'] + "/data/hangouts.yaml")
    hangouts = hangouts.map {|hangout| HangoutDecorator.new(hangout) }

    data = articles + presentations + hangouts
    data = data.delete_if { |data| data['date'] == nil}
    data = data.sort { |a, b| b['date'] <=> a['date'] }

    tags = []
    data.each do |item|
      item['tags'].each do |tag|
        temp = tags.find { |tag_| tag_[:name].downcase == tag.downcase }
        if temp
          temp[:items] << item
        else
          tags << {name: tag, 'path' => "/tags/#{tag.downcase}.html" , items: [item]}
        end
      end if item['tags']
    end

    tags
  end
end

