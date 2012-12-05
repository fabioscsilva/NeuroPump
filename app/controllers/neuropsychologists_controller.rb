class NeuropsychologistsController < ApplicationController
  # GET /neuropsychologists
  # GET /neuropsychologists.json
  def index
    @neuropsychologists = Neuropsychologist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @neuropsychologists }
    end
  end

  # GET /neuropsychologists/1
  # GET /neuropsychologists/1.json
  def show
    @neuropsychologist = Neuropsychologist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @neuropsychologist }
    end
  end

  # GET /neuropsychologists/new
  # GET /neuropsychologists/new.json
  def new
    @neuropsychologist = Neuropsychologist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @neuropsychologist }
    end
  end

  # GET /neuropsychologists/1/edit
  def edit
    @neuropsychologist = Neuropsychologist.find(params[:id])
  end

  # POST /neuropsychologists
  # POST /neuropsychologists.json
  def create
    login_id = params[:neuropsychologist].delete(:login_id)
    clinic_id = params[:neuropsychologist].delete(:clinic_id)
    gender_id = params[:neuropsychologist].delete(:gender_id)
    @neuropsychologist = Neuropsychologist.new(params[:neuropsychologist])

    @neuropsychologist.login_id = login_id
    @neuropsychologist.clinic_id = clinic_id
    @neuropsychologist.gender_id = gender_id

    respond_to do |format|
      if @neuropsychologist.save
        format.html { redirect_to @neuropsychologist, notice: 'Neuropsychologist was successfully created.' }
        format.json { render json: @neuropsychologist, status: :created, location: @neuropsychologist }
      else
        format.html { render action: "new" }
        format.json { render json: @neuropsychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /neuropsychologists/1
  # PUT /neuropsychologists/1.json
  def update
    login_id = params[:neuropsychologist].delete(:login_id)
    clinic_id = params[:neuropsychologist].delete(:clinic_id)
    gender_id = params[:neuropsychologist].delete(:gender_id)
    @neuropsychologist = Neuropsychologist.find(params[:id])

    @neuropsychologist.login_id = login_id
    @neuropsychologist.clinic_id = clinic_id
    @neuropsychologist.gender_id = gender_id

    respond_to do |format|
      if @neuropsychologist.update_attributes(params[:neuropsychologist])
        format.html { redirect_to @neuropsychologist, notice: 'Neuropsychologist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @neuropsychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neuropsychologists/1
  # DELETE /neuropsychologists/1.json
  def destroy
    @neuropsychologist = Neuropsychologist.find(params[:id])
    @neuropsychologist.destroy

    respond_to do |format|
      format.html { redirect_to neuropsychologists_url }
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
      UserMailer.send_email_neuropsychologists(email.to_s).deliver

    session[:emailsSentNeuro] = true

    redirect_to '/inviteNeuropsychologists'
    end
  end
end
