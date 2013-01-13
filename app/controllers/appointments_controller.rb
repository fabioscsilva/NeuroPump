class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    if current_login.has_role? :secretary
      logged_user = Secretary.first(:conditions => "login_id = #{current_login.id}")
      @neuropsychologists = Neuropsychologist.is_active.in_clinic(logged_user.clinic.id).all
      @appointments = Appointment.joins(:neuropsychologist).where("neuropsychologists.clinic_id" => logged_user.clinic.id).all
    elsif current_login.has_role? :neuropsychologist
      logged_user = Neuropsychologist.first(:conditions => "login_id = #{current_login.id}")
      @appointments = Appointment.joins(:neuropsychologist).where("neuropsychologists.clinic_id" => logged_user.clinic.id, "neuropsychologists.id" => logged_user.id).all
      @idNeuro = logged_user.id
    else
      
    end

    @patients = Patient.is_active.in_clinic(logged_user.clinic_id).all
    @types = AppointmentType.all
    @status = AppointmentStatus.all

    # isto é para dar para inserir no index
    @appointment = Appointment.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create 
    # é controlado, se vier com id faz update senao faz create
    if params[:appointment][:id] == nil
      @appointment = Appointment.new(params[:appointment])

      respond_to do |format|
        if @appointment.save
          format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
          format.json { render json: @appointment, status: :created, location: @appointment }
        else
          format.html { render action: "new" }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    else
      @appointment = Appointment.find(params[:appointment][:id])
      respond_to do |format|
        if @appointment.update_attributes(params[:appointment])
          format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    hkijnkijn

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end
