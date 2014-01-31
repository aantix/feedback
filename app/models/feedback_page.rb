class FeedbackPage < ActiveRecord::Base
  attr_accessible :name, :url, :user, :feedbacks_attributes

  has_many :feedbacks
  accepts_nested_attributes_for :feedbacks
  belongs_to :user

  def self.request_feedback
    qualifications =  {:approval_rate => {:gt => 70}, :country => {:eql => 'US'}}

    puts "Requesting feedback..."
    FeedbackPage.all.each do |p|
      t = Turkee::TurkeeTask.create_hit(host,
                                    "Quick feedback for webpage",
                                    "Click on the site below and explore the site a bit.  Then answer the following questions.",
                                    :FeedbackPage,
                                    1,    # assignments
                                    0.51, # reward
                                    2,    # days
                                    2,    # hours max duration
                                    qualifications,
                                    {:feedback_page_id => p.id}, {})

      puts t.hit_url
    end
    puts "HITs posted."
  end

  def self.host
    Rails.env.production? ? "https://quiet-reaches-1909.herokuapp.com" : "https://localhost:3000"
  end
end
