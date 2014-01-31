class FeedbackPagesController < ApplicationController
  before_filter :authenticate_user_if_html

  def authenticate_user_if_html
    respond_to do |format|
      format.html { return authenticate_user! }
      format.turk { return true }
      format.js { return true }
    end

    true
  end

  def index
    @feedback_pages = current_user.feedback_pages

    @feedbacks = current_user.feedbacks.group_by { |f| f.created_at.beginning_of_day }
  end

  # GET /feedback_pages/1
  # GET /feedback_pages/1.json
  def show
    @feedback_page = FeedbackPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedback_page }
    end
  end

  # GET /feedback_pages/new
  # GET /feedback_pages/new.json
  def new
    puts "new#####"
    @feedback_page = FeedbackPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.turk do
        @disabled      = Turkee::TurkeeFormHelper::disable_form_fields?(params)
        @feedback_page = FeedbackPage.find(params[:feedback_page_id])
        @questions     = Question.default_questions

        render :layout => false
      end
    end
  end

  def edit
    @feedback_page = FeedbackPage.find(params[:id])
  end

  def create
    @feedback_page = FeedbackPage.new(params[:feedback_page])

    respond_to do |format|
      if @feedback_page.save
        format.html { redirect_to @feedback_page, notice: 'FeedbackPage was successfully created.' }
        format.json { render json: @feedback_page, status: :created, location: @feedback_page }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedback_pages/1
  # PUT /feedback_pages/1.json
  def update
    @feedback_page = FeedbackPage.find(params[:id])

    respond_to do |format|
      if @feedback_page.update_attributes(params[:feedback_page])
        format.html { redirect_to @feedback_page, notice: 'FeedbackPage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_pages/1
  # DELETE /feedback_pages/1.json
  def destroy
    @feedback_page = FeedbackPage.find(params[:id])
    @feedback_page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end
end
