class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :check_request

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def check_request
    if params.has_key?(:assignmentId)
      request.format = :turk
    end

    true
  end

  #def after_sign_in_path_for(resource)
  #  case current_user.roles.first.name
  #    when 'admin'
  #      users_path
  #    when 'silver'
  #      content_silver_path
  #    when 'gold'
  #      content_gold_path
  #    when 'platinum'
  #      content_platinum_path
  #    else
  #      root_path
  #  end
  #end

end
