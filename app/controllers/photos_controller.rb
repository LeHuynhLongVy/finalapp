class PhotosController < ApplicationController

  def index
    @photos = Photo.order('created_at DESC')
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user_id=1

    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update_attributes(photo_params)
      redirect_to post_path(@photo)
    else
      render :edit
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
