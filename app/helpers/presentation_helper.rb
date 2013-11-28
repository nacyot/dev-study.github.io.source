module PresentationHelper
  def embed_presentation(url = "", width = 580, height = 480)
    case url
    when /slid\.es/
      slid_dot_es(url, width, height)
    when /slideshare/
      slideshare(url, width, height)
    else
      "<i class='fa fa-external-link'></i> <a href='#{url}'>Presentation Slide</a>"
    end
  end

  def slid_dot_es_template(src = "")
    return <<EOS
<iframe class="slid_dot_es_template" ng-src="{{trustSrc(src)}}" width="100%" height="100%" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
EOS
  end

  def slideshare_template
    return <<EOS
<iframe class="slideshare_template" src="http://www.slideshare.net/slideshow/embed_code/" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe>
EOS
  end
  
  def slid_dot_es(url, width, height)
    return <<EOS
<iframe class="slid_dot_es" src="#{ url }/embed" width="#{ width }" height="#{ height }" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
EOS
  end
  
  def slideshare(url, width, height)
    url = "http://www.slideshare.net/api/oembed/2?url=#{ url }&format=json"
    HTTParty.get(url, :format => "json").parsed_response =~ /embed_code\/([0-9]*)/
    slide_number = $1
    
    return <<EOS
<iframe src="http://www.slideshare.net/slideshow/embed_code/#{ slide_number }" width="#{ width }" height=" #{ height } " frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe>
EOS
    rescue
    retrun url
  end
  
end
