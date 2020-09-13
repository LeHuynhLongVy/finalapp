class UsersController < ApplicationController
  # POST /users
  # POST /users.json

  def index
    @users = User.all
    render json: @users
  end

  def show
    render action: :show
  end

  def new
    @user = User.new()
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        # UserMailer.with(user: @user).welcome_email.deliver_now #_later
        # UserMailer.welcome_email(user).deliver_now

        MailerJob.perform_later @user
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

private
# Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:firstname, :lastname , :email, :password)
    end
end
