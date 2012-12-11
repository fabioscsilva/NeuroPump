class HomeController < ApplicationController
  def index
   if login_signed_in?
    if Login.find(current_login.id).has_role? :manager
      redirect_to managers_path
    end
  else
    redirect_to :controller => 'devise/sessions', :action => 'new'
  end
  


  end
end
