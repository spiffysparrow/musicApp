class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_url(album)
  end

  def edit
    @track = Track.find(params[:id])
    
  end

  private
  def track_params
    params.require("track").permit(:album_id, :name, :lyrics, :bonus)
  end
end
