class User < ApplicationRecord
  validates :username, presence: true
  
  has_many :artworks,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :Artwork
  
  has_many :artshares,
  primary_key: :id,
  foreign_key: :viewer_id,
  class_name: :Artshare
  
  has_many :shared_artworks,
  through: :artshares,
  source: :artwork 
end
