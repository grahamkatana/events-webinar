class WorkshopsController < ApplicationController
    def index
        @webinars = Workshop.upcoming_workshops
    end

    def show
        @webinar = Workshop.find(params[:id])
    end
  end