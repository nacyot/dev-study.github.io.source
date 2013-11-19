class ArticleDecorator < SimpleDelegator
  def tags_html
    html = "<i class='fa fa-tag'></i> "

    self['tags'].each do |tag|
      html += "<span class='article_tag'>#{ tag }</span>, "
    end

    html[0..html.length-3]
  end

  def date_html
    "<i class='fa fa-calendar'></i> #{ self['date'] } "
  end
  
  def author_html
    "<i class='fa fa-user'></i> #{ self['author'] }"
  end
  
  def link_html
    "<a href='#{link}'> #{ self['title'] }</a>"
  end

  def link_icon_html
    case link
    when /^\//
      "<i class='fa fa-book fa-2x text-middle'></i>"
    when /github\.com/
      "<i class='fa fa-github fa-2x text-middle'></i>"
    when /facebook/
      "<i class='fa fa-facebook fa-2x text-middle'></i>"
    else
      "<i class='fa fa-external-link fa-2x text-middle'></i>"
    end
  end

  private
  def link
    (self['target'] ? self['target'] : self["link"])
  end
end
