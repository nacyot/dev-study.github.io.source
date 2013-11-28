module MediaDecorator
  include PresentationHelper
  include VideoHelper

  def video_html
    if self['video']
      html = "<h2>Video</h2>"
      html += embed_video self['video']
      return html
    end
    
    return ""
  end

  def slide_html
    if self['slide']
      html = "<h2>Slide</h2>"
      html += embed_presentation self['slide']
      return html
    end

    return ""
  end

  def references_html
    if self['links']
      html = "<h2>References</h2>\n<ul>"
      self['links'].each {|link| html += "<li><a href='#{link}'>#{link}</a></li>\n"}
      html += "</ul>"
      return html
    end

    return ""
  end

end
