class AlbumsController < ApplicationController
def edit
end

def user_album_index
  @albums = current_user.albums.order(created_at: :desc).limit(10)
end


def show
  @photo = current_user.albums.where(id: params[:id]).first
end

def new
  @album = Album.new
end

def update
  @photo = current_user.photos.where(id: params[:id]).first
  new_title=params.require(:album).permit(:title)
  @album.title = new_title["title"]
  if @album.valid?
    @album.update(title: new_title["title"])
    flash[:success] = 'Album title was updated successfully.'
    redirect_to action: :edit
    # render :edit
  else
    flash[:error] = @album.errors.full_messages[0]
    # render :edit
    redirect_to action: :edit
    # format.html{ render :action => edit}
  end
end

def feed
  @album=current_user.followings.map { |user| user.albums.all.where(sharingmode:true).order(created_at: :desc)  }.flatten!
end

def discover
  @album = Album.where(sharingmode:true).order(created_at: :desc)
end

def guest
  @album = Album.where(sharingmode:true).order(created_at: :desc)
end

private
def photo_params
  params.require(:photo).permit(:title, :description, :image)
end


end
