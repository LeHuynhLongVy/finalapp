class AlbumsController < ApplicationController
def new
  @photo = current_user.photos.new
end

def create

  @album = current_user.albums.new(album_params)
  if @album.save
    @photo=@album.photos.new(photo_params)
    @photo.user_id=current_user.id
    if @photo.save
      redirect_to edit_album_path(id: @album.id)
    else
      redirect_to action: :new
    end
  else
    redirect_to action: :new
  end
end

def edit
  @album = current_user.albums.find(params[:id])
  @photo = current_user.photos.new()
end

def update
  @album = current_user.albums.find(params[:id])
  unless params[:photo][:image].nil?
    @photo =@album.photos.new(photo_params)
  @photo.user_id=@album.user_id
  @photo.save
  end
  if @album.update_attributes(album_params)
  redirect_to edit_album_path(id: @album.id)
  else
  redirect_to user_path(current_user.id)
  end
end

def destroy
  if current_user.albums.destroy(params[:id])
    redirect_to user_path(current_user.id)
  else
    redirect_to action: :edit
  end
end
def feed
  @album=Album.where(user_id: current_user.followings.ids,sharingmode: true).order(created_at: :desc).page(params[:page]).per(8)
end

def discover
  @album = Album.all.where(sharingmode:true).order(created_at: :desc).page(params[:page]).per(8)
end

def guest
  @album = Album.all.where(sharingmode:true).order(created_at: :desc).page(params[:page]).per(8)
end

private
def album_params
  params.require(:photo).permit(:title, :description, :sharingmode)
end

def photo_params
  params.require(:photo).permit(:title, :description, :image, :sharingmode)
end


end
