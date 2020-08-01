class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new
  end

  def create
    artist = Artist.new(artist_params)
    if artist.save
      redirect_to artists_path
    else
      flash[:notice] = 'Artist not created: Required information missing.'
      redirect_to new_artist_path
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to artists_path
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to artists_path
  end

  private

  def artist_params
    params.permit(:name)
  end
  
end