class AlbumsController < ApplicationController
def edit
  @album = Album.find(params[:id])
end

def index
  @albums = Album.order(created_at: :desc)
end

def show
  @album = Album.find(params[:id])
end

def new
  @album = Album.new
end

def update
  @album = Album.find(params[:id])
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

private
def photo_params
  params.require(:photo).permit(:title, :description, :image)
end


end
