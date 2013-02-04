class PackagesClinicsController < ApplicationController
  before_filter :authenticate_login!
  #load_and_authorize_resource
  # GET /packages_clinics
  # GET /packages_clinics.json
  def index
    @packages_clinics = PackagesClinic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packages_clinics }
    end
  end

  # GET /packages_clinics/1
  # GET /packages_clinics/1.json
  def show
    @packages_clinic = PackagesClinic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packages_clinic }
    end
  end

  # GET /packages_clinics/new
  # GET /packages_clinics/new.json
  def new
    @packages_clinic = PackagesClinic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packages_clinic }
    end
  end

  # GET /packages_clinics/1/edit
  def edit
    @packages_clinic = PackagesClinic.find(params[:id])
  end

  # POST /packages_clinics
  # POST /packages_clinics.json
  def create
    @packages_clinic = PackagesClinic.new(params[:packages_clinic])

    respond_to do |format|
      if @packages_clinic.save
        format.html { redirect_to @packages_clinic, notice: 'Packages clinic was successfully created.' }
        format.json { render json: @packages_clinic, status: :created, location: @packages_clinic }
      else
        format.html { render action: "new" }
        format.json { render json: @packages_clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packages_clinics/1
  # PUT /packages_clinics/1.json
  def update
    consumptions = PackagesClinic.all;

    consumptions.each do |c|
      c.week += 1;
      c.appointment_token = c.package.n_evaluations;
      c.save;
    end

    flash[:notice] = "Consumos semanais atualizados.";

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { render json: @payment }
    end
  end

  # DELETE /packages_clinics/1
  # DELETE /packages_clinics/1.json
  def destroy
    @packages_clinic = PackagesClinic.find(params[:id])
    @packages_clinic.destroy

    respond_to do |format|
      format.html { redirect_to packages_clinics_url }
      format.json { head :no_content }
    end
  end
end
