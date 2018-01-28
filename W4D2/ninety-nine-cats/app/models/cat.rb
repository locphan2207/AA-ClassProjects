# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'date'

class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :color, presence: true, inclusion: %w(Yellow Black White)
  validates :name, presence: true
  validates :sex, inclusion: %w(M F), presence: true

  has_many :cat_rental_requests,
  primary_key: :id,
  foreign_key: :cat_id,
  class_name: :CatRentalRequest,
  dependent: :destroy

  

  def self.colors
    %w(Yellow Black White)
  end

  def age
    today = Date.today
    age = today.year - self.birth_date.year
    if today.month < self.birth_date.month
      age = age - 1
    elsif today.month == self.birth_date.month
      age = age - 1 if today.day < self.birth_date.day
    end
    age
  end

end
