class Api::V1::WebinarsController<ActionController::API
    def index
        webinars = Workshop.upcoming_workshops
        webinars = webinars.map do |webinar|
            {
                id:webinar.id,
                name:webinar.name,
                start_time:webinar.start_time,
                end_time:webinar.start_time,
                start_date:webinar.start_date,
                end_date:webinar.end_date,
                duration:webinar.daily_hours,
                remaining_spots:webinar.remaining_spots,
                amount:webinar.registration_fee,
                image:"https://picsum.photos/1260/750?random=#{webinar.id}"
            }
        end
        render json: { results: webinars }.to_json, status: :ok
      end
 
end