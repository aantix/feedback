class Question < ActiveRecord::Base
  attr_accessible :question, :question_type_id, :user

  belongs_to :user
  belongs_to :question_type

  def self.default_questions
    where(:user_id => nil)
  end

  def self.questions_for(question_type_id)
    where(:question_type_id => question_type_id)
  end

  def self.seed_questions
    questions  = {
        QuestionType::COPY_TEXT  => ["How would you rewrite the first headline of the site so that it's clearer?",
                                     "What is the first text that you read on the page?  What drew you to it?  What did you find confusing about it?",
                                     "What would prevent you from buying something from this site?"],

        QuestionType::VISUAL     => ["What is the first image that you recognized when first visiting the site?  What drew your eye there?",
                                     "Just considering the images on the site, were there any that you found confusing or that reduced your confidence in the site?",
                                     "Visually, where would you make improvements?"],

        QuestionType::FUNCTIONAL => ["What is the first thing you want to click when reaching this website?  Why?",
                                     "Click on three random links from this page.  Has your perception of the site changed?",
                                     "When clicking around on the site, what were some of the things that reduced your confidence in the site?"]
    }

    questions.each do |k, qs|
      qs.each {|q| Question.create!(question_type_id: k, question: q)}
    end
  end
end
