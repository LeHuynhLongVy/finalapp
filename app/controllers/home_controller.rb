class HomeController < ApplicationController

  def index
    @albums = Album.all.order(created_at: :desc)
  end

  def newest
  @title = Album.order(created_at: :desc).limit(4).pluck(:title)
  end

end
