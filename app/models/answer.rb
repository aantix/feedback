class Answer < ActiveRecord::Base
  attr_accessible :answer, :question

  belongs_to :question
end
