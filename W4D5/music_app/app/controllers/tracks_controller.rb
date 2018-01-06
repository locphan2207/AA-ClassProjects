class TracksController < ApplicationController
  
  before_action :require_log_in
  
  def new
    @current_album = Album.find_by(id: params[:album_id])
    session[:previous_url] = new_band_album_url(@current_album.id)
    render :new
  end
  
  def create
    track = Track.new(track_params)
    if track.save 
      redirect_to track_url(track)
    else 
      flash[:errors] = track.errors.full_messages
      redirect_to session[:previous_url]
    end
  end
  
  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end
  
  def edit
    @track = Track.find_by(id: params[:id])
    render :edit
  end
  
  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params) 
      redirect_to track_url(@track)
    else 
      flash[:errors] = @track.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @track = Track.find_by(id: params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_url(album)
  end
  
  private
  def track_params
    params.require(:track).permit(:title, :ord, :regular, :album_id, :lyrics)
  end
  
  # def note_params
  #   params.require(:note).permit(:body)
  # end
end
