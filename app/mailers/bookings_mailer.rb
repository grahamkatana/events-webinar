require "rqrcode"
class BookingsMailer < ApplicationMailer

  def booking_confirmation(booking)

    qrcode = RQRCode::QRCode.new(booking_root_url(booking.id))

    @svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 8,
      standalone: true,
      use_path: true
    )
    
    @greeting = "Hi"
    @booking = booking
    @order_number = booking.order_number
    @customer = booking.customer
    @workshop=booking.workshop
    mail to: @customer.email,subject:"Booking confirmation for #{@workshop.name}"
  end

  private
  def booking_root_url(booking_id)
    if Rails.env.development?
      "https://localhost:3000/bookings/#{booking_id}/booking"

    else
      #todo
    end
    
  end



end
