# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat



  def overlapping_requests
    overlaps = []
    previous_requests = self.cat.cat_rental_requests
    previous_requests.each do |request|
      if start_date < request.end_date || end_date > request.start_date
        overlaps << request
      end
    end
    overlaps
  end

  def overlapping_approved_requests
    overlaps = overlapping_requests
    overlaps.select do |request|
      request.status == 'APPROVED'
    end
  end

  def does_not_overlap_approved_request
    overlapping_approved_requests.each do |request|
      errors[:start_date] << 'There is an overlapping request' if CatRentalRequest.exists?(request.id)
    end
  end

end
