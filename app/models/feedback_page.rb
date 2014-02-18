class FeedbackPage < ActiveRecord::Base
  attr_accessible :name, :url, :user, :feedbacks_attributes

  has_many :feedbacks
  accepts_nested_attributes_for :feedbacks
  belongs_to :user

  def self.request_feedback
    # The Heroku scheduler only allows for daily scheduling. Since I want weekly, we'll
    #   just put in a check for it.
    begin
      if Date.today.wday == ENV['FEEDBACK_DAY'] || 2 # Tuesday
        qualifications = {:approval_rate => {:gt => 80}, :country => {:eql => 'US'}}

        puts "Requesting feedback..."
        FeedbackPage.all.each do |p|
          t = Turkee::TurkeeTask.create_hit(host,
                                            "Quick feedback for webpage",
                                            "Click on the site below and explore the site a bit.  Then answer the following questions.",
                                            :FeedbackPage,
                                            2, # assignments
                                            1.51, # reward
                                            2, # days
                                            5, # hours max duration
                                            qualifications,
                                            {:feedback_page_id => p.id,
                                             :user_id => p.user.id}, {})

          puts t.hit_url
        end
        puts "HITs posted."
      end
    rescue Exception => e
      # Probably something wrong with the MTurk account (funds, etc)
      Rollbar.report_exception(e)
    end
  end

  def self.host
    Rails.env.production? ? "https://quiet-reaches-1909.herokuapp.com" : "http://localhost:3000"
  end
end
