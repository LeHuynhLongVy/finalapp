class Admin::PhotosController < ApplicationController
  def index
    @photo=Photo.all.order(updated_at: :desc).page(params[:page]).per(8)
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to admin_photos_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    Photo.destroy(@photo.id)
    redirect_to admin_photos_path
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :description, :sharingmode, :image)
  end
end
