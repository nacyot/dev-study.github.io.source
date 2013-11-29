# TODO 
require './app/decorators/info_html_decorator.rb'
require './app/decorators/media_decorator.rb'

class PresentationDecorator < SimpleDelegator
  include InfoHtmlDecorator
  include MediaDecorator

  def icon_html
    "<i class='fa fa-video-camera fa-2x'></i>"
  end
  
  def link
    self['target']
  end
end
