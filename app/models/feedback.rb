class Feedback < ActiveRecord::Base
  attr_accessible :feedback, :feedback_page_id, :feedback_page,
                  :user, :question, :question_id, :page_id, :created_at

  belongs_to :feedback_page
  belongs_to :user
  belongs_to :question
end
