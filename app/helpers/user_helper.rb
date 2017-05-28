module UserHelper
  def user_avatar
  	(image_tag(current_user.image) rescue nil) || current_user.initials
  end

  def avatar_class
  	(user_avatar =~ /img/).present? ? 'user-img' : 'user-initials'
  end
end