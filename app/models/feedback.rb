class Feedback < ActiveRecord::Base
  attr_accessible :feedback, :page, :user, :question, :question_id, :page_id

  belongs_to :page
  belongs_to :user
  belongs_to :question
end
