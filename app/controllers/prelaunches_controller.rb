class PrelaunchesController < ApplicationController
  def index
    @prelaunch = Prelaunch.new
  end

  def create
    @prelaunch = Prelaunch.new(params[:prelaunch])

    if @prelaunch.save
        format.html { redirect_to prelaunch_url, notice: 'Thanks for signing up! We\'ll notify you when we go live!' }
        format.js
    end
  end
end
