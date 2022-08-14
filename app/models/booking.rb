class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop

  before_create generate_order_number
  
  validates :order_number,presence: true,uniqueness: true
  before_validation :generate_order_number

  after_create :update_workshop_spot_count
  # before_commit :generate_order_number

  def generate_order_number
      self.order_number =  "BOOKING-#{SecureRandom.hex(10).upcase}"
  end

  def update_workshop_spot_count
    workshop.update(remaining_spots:workshop.total_spots.to_i-no_of_tickets.to_i)
  end
end
