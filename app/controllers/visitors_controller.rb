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
end
