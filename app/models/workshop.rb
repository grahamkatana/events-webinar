class Workshop < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    
    has_many :bookings
    has_many :customers, through: :bookings
    validates :name, :description,presence: true
    validates :start_date, :end_date,:start_time,:end_time,presence: true
    validates :total_spots, :remaining_spots,presence: true, numericality:true
    validates :end_date, comparison: {greater_than: :start_date, message:"cannot before start date"}  

    scope :upcoming_workshops, -> {where('start_date>?',Date.today)}
    scope :past_workshops, -> {where('start_date<?',Date.today)}
    
    def daily_hours
        "#{((start_time.to_time - end_time.to_time)/1.hours).abs} hours"
    end

    def is_upcoming_workshop?
        start_date>Date.today
    end

end
