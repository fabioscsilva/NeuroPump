class ApplicationController < ActionController::Base
  before_filter :deactivated?

  #protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def deactivated?
    if current_login.present? && current_login.deleted_at
      sign_out current_login
      flash[:error] = "This account has been suspended."
      root_path
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_login)
  end
end
