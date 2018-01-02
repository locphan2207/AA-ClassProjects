class Artwork < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :artist_id,
    message: "artist cannot have two same artwork titles" }
  
  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User 
  
  has_many :artshares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Artshare
  
  has_many :shared_viewers,
  through: :artshares,
  source: :viewer 
end
