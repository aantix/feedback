class Page < ActiveRecord::Base
  attr_accessible :url, :user

  has_many :feedbacks
  belongs_to :user
end
