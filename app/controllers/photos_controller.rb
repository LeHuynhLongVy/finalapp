class PhotosController < ApplicationController


  def index
    @photos = current_user.photos.order(created_at: :desc)
  end

  def show
    @photo = Photo.find(params[:id])
    # photo = current_user.photos.where(id: current_user.id).first
  end

  def new
    @photo = Photo.new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user_id=current_user.id

    if @photo.save
      redirect_to user_path(id: current_user.id)

    else
      redirect_to action: :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      redirect_to user_path(id: current_user.id)
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to user_path(id: current_user.id)
  end

  def feed
    @photo=current_user.followings.map { |user| user.photos.all.where(sharingmode:true).order(created_at: :desc).limit(10)  }.flatten!
  end

  def discover
    @photo = Photo.all.where(sharingmode:true).order(created_at: :desc).limit(10)
  end

  def guest
    @photo = Photo.all.where(sharingmode:true).order(created_at: :desc).limit(10)
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
