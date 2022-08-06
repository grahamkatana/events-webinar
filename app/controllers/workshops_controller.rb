class WorkshopsController < ApplicationController
    def index
        @webinars = Workshop.all
    end

    def show
        @webinar = Workshop.find(params[:id])
    end
  end