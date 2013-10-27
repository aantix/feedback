class Feedback < ActiveRecord::Base
  attr_accessible :feedback, :page, :user

  belongs_to :page
  belongs_to :user
end
