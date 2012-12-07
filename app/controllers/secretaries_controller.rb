class SecretariesController < ApplicationController
  before_filter :authenticate_login!
  # GET /secretaries
  # GET /secretaries.json
  def index
    authorize! :index, @login, :message => 'Not authorized as an administrator.'
    @secretaries = Secretary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @secretaries }
    end
  end

  # GET /secretaries/1
  # GET /secretaries/1.json
  def show
    @secretary = Secretary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @secretary }
    end
  end

  # GET /secretaries/new
  # GET /secretaries/new.json
  def new
    @secretary = Secretary.new
    @pageType = "new"
    
    #@person.build_address
    
    
     # @secretary.login = Login.new
      
     @secretary.build_login
      
    
    #@secretary.login << Login.new

    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @secretary }
    end
  end

  # GET /secretaries/1/edit
  def edit
    @secretary = Secretary.find(params[:id])
    @pageType = "edit"
  end

  # POST /secretaries
  # POST /secretaries.json
  def create
    # raise params.inspect
    login_id = params[:secretary].delete(:login_id)
    gender_id = params[:secretary].delete(:gender_id)
    clinic_id = params[:secretary].delete(:clinic_id)
    @secretary = Secretary.new(params[:secretary])

    @secretary.login_id = login_id
    @secretary.gender_id = gender_id
    @secretary.clinic_id = clinic_id

    respond_to do |format|
      if @secretary.save
        format.html { redirect_to @secretary, notice: 'Secretary was successfully created.' }
        format.json { render json: @secretary, status: :created, location: @secretary }
      else
        format.html { render action: "new" }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /secretaries/1
  # PUT /secretaries/1.json
  def update
    #raise params.inspect
    login_id = params[:secretary].delete(:login_id)
    gender_id = params[:secretary].delete(:gender_id)
    clinic_id = params[:secretary].delete(:clinic_id)
    @secretary = Secretary.find(params[:id])

    @secretary.login_id = login_id
    @secretary.gender_id = gender_id
    @secretary.clinic_id = clinic_id

    respond_to do |format|
      if @secretary.update_attributes(params[:secretary])
        format.html { redirect_to @secretary, notice: 'Secretary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secretaries/1
  # DELETE /secretaries/1.json
  def destroy
    @secretary = Secretary.find(params[:id])
    @secretary.destroy

    respond_to do |format|
      format.html { redirect_to secretaries_url }
      format.json { head :no_content }
    end
  end

  def invite
  end

  def sendInvite
    #raise params.inspect

    emailsAux = params[:email].to_s.split('["')
    emailsAux2 = emailsAux[1].to_s.split('"]')
    @emails = emailsAux2[0].to_s.split(';')

    @emails.each do |email|
      UserMailer.send_email_secretaries(email.to_s).deliver

      session[:emailsSentSec] = true

      redirect_to '/inviteSecretaries'
    end
  end
end
