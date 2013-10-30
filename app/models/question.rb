class Question < ActiveRecord::Base
  attr_accessible :question, :user

  belongs_to :user

  def self.default_questions
    where(:user_id => nil)
  end

  def self.seed_questions
    questions = [
        'What is your first 10 second impression of this page?',
        'What did you find most confusing?',
        'Click on three random links from this page.  Has your perception of the site changed?',
        'What don\'t you like about the imagery of the site?'
    ]
    questions.each {|q| Question.create!(question: q) }
  end
end
