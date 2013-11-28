module LinkHelper
  def link_icon_html(url, option="")
    case url
    when /github\.com/
      "<i class='fa fa-github #{option} ext-middle'></i>"
    when /facebook/
      "<i class='fa fa-facebook-square #{option} text-middle'></i>"
    when /vimeo/
      "<i class='fa fa-vimeo-square #{option} text-middle'></i>"
    when /tumblr/
      "<i class='fa fa-tumblr #{option} text-middle'></i>"
    when /plus\.google/
      "<i class='fa fa-google-plus #{option} text-middle'></i>"
    when /stackoverflow/
      "<i class='fa fa-stack-overflow #{option} text-middle'></i>"
    when /youtube/
      "<i class='fa fa-youtube #{option} text-middle'></i>"
    when /bitbucket/
      "<i class='fa fa-bitbucket #{option} text-middle'></i>"
    else
      "<i class='fa fa-external-link #{option} text-middle'></i>"
    end
  end
end
