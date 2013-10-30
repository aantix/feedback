class FeedbacksController < ApplicationController
  def new
    @disabled  = Turkee::TurkeeFormHelper::disable_form_fields?(params)
    @page      = Page.find(params[:page_id])
    @questions = Question.default_questions

    render :layout => false
  end

  def create

  end
end