# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    page_id 1
    user_id 1
    feedback "MyText"
  end
end
