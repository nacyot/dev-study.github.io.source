# TODO 
require './app/decorators/info_html_decorator.rb'
require './app/decorators/media_decorator.rb'

class HangoutDecorator < SimpleDelegator
  include InfoHtmlDecorator
  include MediaDecorator

  def icon_html
    "<i class='fa fa-play fa-2x'></i>"
  end
  
  def link
    self['target']
  end
end
