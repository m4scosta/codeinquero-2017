module UserHelper

  def user_avatar
  	(image_tag(current_user.image) rescue nil) || current_user.initials
  end
end
