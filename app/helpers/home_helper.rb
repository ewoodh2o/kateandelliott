module HomeHelper

  def fb_image_tag(id)
    image_tag "http://graph.facebook.com/#{id}/picture"
  end

end
