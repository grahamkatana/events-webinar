class BookingsMailer < ApplicationMailer

  def booking_confirmation(booking)
    @greeting = "Hi"
    @booking = booking
    @customer = booking.customer
    @workshop=booking.workshop
    mail to: @customer.email,subject:"Booking confirmation for #{@workshop.name}"
  end
end
