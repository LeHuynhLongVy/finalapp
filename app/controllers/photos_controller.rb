class PhotosController < ApplicationController

  def new
    @photo = current_user.photos.new
  end

  def create

    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to user_path(id: current_user.id)
    else
      redirect_to action: :new
    end
  end

  def edit
    @photo = current_user.photos.find(params[:id])
  end

  def update
    @photo = current_user.photos.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to user_path(id: current_user.id)
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @photo = current_user.photos.find(params[:id])
    Photo.destroy(@photo.id)
    redirect_to user_path(id: current_user.id)
  end

  def feed
    if(user_signed_in?)
      if current_user.admin == true
        redirect_to admin_photos_path
      else
        @photo=Photo.where(user_id: current_user.followings.ids,sharingmode: true).order(created_at: :desc).page(params[:page]).per(8)
      end
    end
  end

  def discover
    @photo = Photo.all.where(sharingmode:true).order(created_at: :desc).page(params[:page]).per(8)
  end

  def guest
    @photo = Photo.all.where(sharingmode:true).order(created_at: :desc).page(params[:page]).per(8)
  end

  private
  def photo_params
  params.require(:photo).permit(:title, :description, :sharingmode, :image)
  end

end
