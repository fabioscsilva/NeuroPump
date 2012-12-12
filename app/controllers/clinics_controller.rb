class ClinicsController < ApplicationController
  before_filter :authenticate_login!
  # GET /clinics
  # GET /clinics.json
  def index
    authorize! :index, @login, :message => 'Nao autorizado!'
    if current_login.has_role? :manager
      @clinics = Clinic.where(:active => true)
    elsif current_login.has_role? :administrator
      @clinics = Clinic.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinics }
    end
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
    authorize! :index, @login, :message => 'Nao autorizado!'
    @clinic = Clinic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinic }
    end
  end

  # GET /clinics/new
  # GET /clinics/new.json
  def new
    authorize! :index, @login, :message => 'Nao autorizado!'
    @clinic = Clinic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic }
    end
  end

  # GET /clinics/1/edit
  def edit
    authorize! :index, @login, :message => 'Nao autorizado!'
    @clinic = Clinic.find(params[:id])
  end

  # POST /clinics
  # POST /clinics.json
  def create
    authorize! :index, @login, :message => 'Nao autorizado!'
    admin_id = params[:clinic].delete(:administrator_id)
    @clinic = Clinic.new(params[:clinic])
    @clinic.active = true;
    @clinic.administrator_id = admin_id

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: 'Clinica criada com sucesso.' }
        format.json { render json: @clinic, status: :created, location: @clinic }
      else
        format.html { render action: "new" }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinics/1
  # PUT /clinics/1.json
  def update
    authorize! :index, @login, :message => 'Nao autorizado!'
    #admin_id = params[:clinic].delete(:administrator_id)
    
    @clinic = Clinic.find(params[:id])
    
    #@clinic.administrator_id = admin_id

    respond_to do |format|
      if @clinic.update_attributes(params[:clinic])
        format.html { redirect_to @clinic, notice: 'Clinica editada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    authorize! :index, @login, :message => 'Nao autorizado!'
    @clinic = Clinic.find(params[:id])
    @clinic.update_attribute(:active ,false)

    respond_to do |format|
      format.html { redirect_to clinics_url }
      format.json { head :no_content }
    end
  end
end
