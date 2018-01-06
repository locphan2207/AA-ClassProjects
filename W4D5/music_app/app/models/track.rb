class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true
  validates :ord, uniqueness: true
  
  belongs_to :album
  
  has_many :notes,
  dependent: :destroy
  
end
