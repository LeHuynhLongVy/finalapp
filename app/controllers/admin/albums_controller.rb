class Admin::AlbumsController < ApplicationController
  def index
    @album=Album.all.order(updated_at: :desc).page(params[:page]).per(8)
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      @photo=@album.photos.new(photo_params)
      @photo.user_id=current_user.id
      if @photo.save
        redirect_to edit_admin_album_path(id: @album.id)
      else
        redirect_to action: :new
      end
    else
      redirect_to action: :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @photo = Photo.new()
  end

  def update
    @album = Album.find(params[:id])
    unless params[:photo][:image].nil?
      @photo =@album.photos.new(photo_params)
    @photo.user_id=@album.user_id
    @photo.save
    end
    if @album.update_attributes(album_params)
    redirect_to edit_admin_album_path(id: @album.id)
    else
    redirect_to admin_albums_path
    end
  end

  def destroy
    if Album.destroy(params[:id])
      redirect_to admin_albums_path
    else
      redirect_to action: :edit
    end
  end

  private
  def album_params
    params.require(:photo).permit(:title, :description, :sharingmode)
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :image, :sharingmode)
  end
end
