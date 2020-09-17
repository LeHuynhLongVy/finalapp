class Admin::AlbumsController < ApplicationController
  def index
    @album=Album.all.order(updated_at: :desc).page(params[:page]).per(8)
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to admin_albums_path
    else
      redirect_to action: :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    Album.destroy(@album.id)
    redirect_to admin_albums_path
  end

  private
  def album_params
    params.require(:photo).permit(:title, :description, :sharingmode, :image)
  end
end
