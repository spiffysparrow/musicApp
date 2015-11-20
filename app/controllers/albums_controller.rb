class AlbumsController < ApplicationController

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors
      render :new
    end
  end

  private
  def album_params
    params.require("album").permit(:name, :band_id, :studio_album)
  end
end
