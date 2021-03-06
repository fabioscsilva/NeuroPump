class HomeController < ApplicationController
  def index
    if login_signed_in?
      if current_login.has_role? :manager
        redirect_to managers_path
      elsif current_login.has_role? :secretary
          redirect_to appointments_path
      elsif current_login.has_role? :administrator
        redirect_to administrators_path
      elsif current_login.has_role? :patient
        redirect_to patient_path(Patient.find_by_login_id(current_login.id))
      elsif current_login.has_role? :neuropsychologist
        redirect_to appointments_path
      end
    else
      redirect_to :controller => 'devise/sessions', :action => 'new'
    end

  end
end
