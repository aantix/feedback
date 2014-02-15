class QuestionType < ActiveRecord::Base
  attr_accessible :name

  VISUAL     = 1
  COPY_TEXT  = 2
  FUNCTIONAL = 3
end
