class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    render json: @artworks
  end
  
  def create
    new_artwork = Artwork.new(artwork_param)
    if new_artwork.save
      render json: new_artwork, status: 200
    else
      render json: new_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def show
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      render json: artwork, status: :ok
    else 
      render plain: "Cannot find this artwork", status: 404
    end
  end
  
  def update
    artwork = Artwork.find_by(id: params[:id])
    
    if artwork.update(artwork_param)
      # artwork.save
      render json: artwork
    else
      render jason: artwork.errors
    end
  end
  
  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork
      artwork.destroy
      # render plain: "Sucessful deleted. Here are all artworks left:"
      render json: Artwork.all 
    else
      render plain: "Cannot delete nonexisting artwork!"
    end
  end
  
  private
  def artwork_param
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
