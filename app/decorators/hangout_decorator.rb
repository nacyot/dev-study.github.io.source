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
