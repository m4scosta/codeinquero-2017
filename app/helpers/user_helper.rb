module UserHelper

  def user_avatar
  	image_tag(current_user.image) || current_user.initials
  end
end
