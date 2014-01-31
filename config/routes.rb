RailsRecurlySubscriptionSaas::Application.routes.draw do
  resources :prelaunches, :only => [:index, :create]
  resources :feedbacks, :only => [:new, :create]
  resources :feedback_pages

  get "recurly/test"
  post "recurly/push"
  get "content/gold"
  get "content/silver"
  get "content/platinum"

  match 'beta', to: 'prelaunches#index', via: :get

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    put 'update_plan', :to => 'registrations#update_plan'
  end
  resources :users
end