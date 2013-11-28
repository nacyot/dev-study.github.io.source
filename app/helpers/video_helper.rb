module VideoHelper
  def embed_video(url, width = 580, height = 480)
    case url
    when /youtube/
      youtube(url, width, height)
    when /youtu\.be/
      youtu_be(url, width, height)
    when /vimeo/
      vimeo(url, width, height)
    else
      "No embed"
    end
  end

  def youtube(url, width, height)
    video_number = url[(url =~ /watch\?v=(.*?)&?/) + 8, 11]
    "<iframe width='#{width}' height='#{height}' src='//www.youtube.com/embed/#{ video_number }' frameborder='0' allowfullscreen></iframe>"
  end

  def youtu_be(url, width, height)
    url =~ /youtu\.be\/(.*?)$/
    video_number = $1
    "<iframe width='#{width}' height='#{height}' src='//www.youtube.com/embed/#{ video_number }' frameborder='0' allowfullscreen></iframe>"
  end

  def vimeo(url, width, height)
    url =~ /vimeo\.com\/(.*?)$/
    video_number = $1
    "<iframe src='//player.vimeo.com/video/#{ video_number }' width='#{ width }' height='#{ height }' frameborder='0' webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>"
  end
end

