# TODO 
require './app/decorators/info_html_decorator.rb'

class ArticleDecorator < SimpleDelegator
  include InfoHtmlDecorator

  def icon_html
    link_icon_html link
  end
  
  def link
    (self['target'] ? self['target'] : self["link"])
  end

  def comments
    if self['comments']
      return self['comments']
    else
      return []
    end
    
  end
end
