class VisitorsController < ApplicationController
  def index
  end
  
  def about
  end
  
  def pricing
  	 @packages = Package.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages }
    end
  end
  
  def contact
  end

  def contactSubmit
    email = params[:email]
    name = params[:name]
    message = params[:body]


    UserMailer.send_email_contactUs(name, email, message).deliver
    flash[:notice]  = "Successo, por favor aguarde pela nossa resposta"
     respond_to do |format|
      format.html { redirect_to contact_url }
    end
  end
end
