class AlbumsController < ApplicationController
  
  before_action :require_log_in

  def new
    @current_band = Band.find_by(id: params[:band_id])
    session[:previous_url] = new_band_album_url(@current_band.id)
    render :new
  end
  
  def create
    album = Album.new(album_params)
    if album.save 
      redirect_to album_url(album)
    else 
      flash[:errors] = album.errors.full_messages
      redirect_to session[:previous_url]
    end
  end
  
  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end
  
  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end
  
  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params) 
      redirect_to album_url(@album)
    else 
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @album = Album.find_by(id: params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end
  
  private
  def album_params
    params.require(:album).permit(:title, :yr, :live, :band_id)
  end
end
