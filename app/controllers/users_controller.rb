class UsersController < ApplicationController
  # POST /users
  # POST /users.json
  def show
    @user = User.find(params[:id])
    if( params[:id] == current_user.id.to_s)
      @user = current_user
      render "show"
    else
      @user = User.where(id: params[:id]).first
      render "show_public"
    end
  end

  def follow
    @user = User.find(follow_user)
    follow = Follow.find_by(follower_id:current_user.id, followed_user_id:@user.id)
    if follow
      follow.destroy
    else
      current_user.followings << @user
    end
    render 'follow.js.erb'
  end

  def like
    like_record = Like.find_by(like_post)
    if like_record
      like_record.destroy
    else
      Like.create(like_post)
    end
    render 'like.js.erb'
  end


private
# Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:firstname, :lastname , :email, :password, :avatar)
    end

    def follow_user
      params.require(:id)
    end

    def like_post
      { :likeable_type => params.require(:type), :likeable_id => params.require(:post_id), :user_id => params.require(:user_id) }
    end
end
