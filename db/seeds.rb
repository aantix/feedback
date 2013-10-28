# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

def profile_path(n)
  File.open "#{Rails.root }/app/assets/images/#{n}"
end

puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :first_name => ENV['ADMIN_FIRST_NAME'].dup, :last_name => ENV['ADMIN_LAST_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :location => 'Omaha, NE'
user.image = profile_path('jim.png')
user.save!

puts 'user: ' << user.name
user.add_role :admin

user2 = User.find_or_create_by_email :first_name => 'Brian', :last_name => 'Bencker', :email => 'user2@example.com', :password => 'changeme', :password_confirmation => 'changeme', :location => 'Kansas City, MO'
user2.image = profile_path('brian.png')
user2.save!
user2.add_role :silver

user3 = User.find_or_create_by_email :first_name => 'Renee', :last_name => 'Jones', :email => 'user3@example.com', :password => 'changeme', :password_confirmation => 'changeme', :location => 'Las Vegas, NV'
user3.image = profile_path("renee.png")
user3.save!
user3.add_role :gold

user4 = User.find_or_create_by_email :first_name => 'Tim', :last_name => 'Wegner', :email => 'user4@example.com', :password => 'changeme', :password_confirmation => 'changeme', :location => 'Austin, TX'
user4.image = profile_path("tim.png")
user4.save!
user4.add_role :platinum

puts "users: #{user2.name}, #{user3.name}, #{user4.name}"

page = Page.create(url: "https://www.fiveaskfive.com", :user => user)

page.feedbacks.create! :feedback => "Love the colors, but I find the imagery for the main carousel quite confusing.  I'm confused as to why there's a skateboarder, fly fisherman, and some haunted house all on the homepage?", :user => user2
page.feedbacks.create! :feedback => "I'm trying to find one place on the sight that shows one of these 'epic' chats, but I don't see any videos.  Makes me feel like there isn't much going on here.", :user => user3
page.feedbacks.create! :feedback => "In the section below the big imagery, it's unclear to me as to why you need our help?  Does the user themselves have to create the tweets or is this something that is sent to me to post later?", :user => user4
