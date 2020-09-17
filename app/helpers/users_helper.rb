module UsersHelper
  def liked? (user, post)
    post.likes.find_by(user_id: user)
  end

  def followed? (current_user, user)
    current_user.followings.find_by(id: user.id)
  end
end
