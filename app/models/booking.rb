class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :workshop

  after_create: update_workshop_spot_count

  def update_workshop_spot_count
    workshop.update(remaining_spots:workshop.total_spots-no_of_tickets)
  end
end
