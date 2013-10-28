class PrelaunchesController < ApplicationController
  def index
    @prelaunch = Prelaunch.new
  end

  def create
    @prelaunch = Prelaunch.new(params[:prelaunch])

    @prelaunch.save!
  end
end
