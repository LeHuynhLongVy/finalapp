class HomeController < ApplicationController

  def index
    @albums = Album.all.order(created_at: :desc)
  end

  def newest
  @title = Album.order(created_at: :desc).limit(4).pluck(:title)
  end

  def feed_photo
    @photo=current_user.followings.map { |user| user.photos.all.where(sharingmode:true).order(created_at: :desc)  }.flatten!
  end

  def discover_photo
    @photo = Photo.where(sharingmode:true).order(created_at: :desc)
  end

  def feed_album
    @album=current_user.followings.map { |user| user.albums.all.where(sharingmode:true).order(created_at: :desc)  }.flatten!
  end

  def discover_album
    @album = Album.where(sharingmode:true).order(created_at: :desc)
  end

  def guest_feed_photo
    @photo = Photo.where(sharingmode:true).order(created_at: :desc)
  end

  def guest_feed_album
    @album = Album.where(sharingmode:true).order(created_at: :desc)
  end
end
