class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.new
  end

  def create
    @band = Band.new(name: params["band"]["name"])
    if @band.save
      redirect_to band_url(@band)
    else
      redirect_to bands_url
    end
  end
end
