class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    login_id = params[:patient].delete(:login_id)
    gender_id = params[:patient].delete(:gender_id)
    clinic_id = params[:patient].delete(:clinic_id)
    civil_status_id = params[:patient].delete(:civil_status_id)
    handedness_id = params[:patient].delete(:handedness_id)
    @patient = Patient.new(params[:patient])

    @patient.login_id = login_id
    @patient.gender_id = gender_id
    @patient.clinic_id = clinic_id
    @patient.civil_status_id = civil_status_id
    @patient.handedness_id = handedness_id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    login_id = params[:patient].delete(:login_id)
    gender_id = params[:patient].delete(:gender_id)
    clinic_id = params[:patient].delete(:clinic_id)
    civil_status_id = params[:patient].delete(:civil_status_id)
    handedness_id = params[:patient].delete(:handedness_id)
    @patient = Patient.find(params[:id])
    
    @patient.login_id = login_id
    @patient.gender_id = gender_id
    @patient.clinic_id = clinic_id
    @patient.civil_status_id = civil_status_id
    @patient.handedness_id = handedness_id


    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end
end
