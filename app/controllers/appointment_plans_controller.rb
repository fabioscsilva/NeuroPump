class AppointmentPlansController < ApplicationController
  def index
    #fazer o da sessão que queremos
    #appoint_id = 10
    appoint_id = 0
    #
    
    logged_user = Patient.first(:conditions => "login_id = #{current_login.id}")
    appointments =  Appointment.where(:patient_id =>   logged_user.id)
    appointments.each do |appointment|
      if appointment.appointment_day < DateTime.now &&  (appointment.appointment_day + appointment.duration*60)  > DateTime.now && appointment.appointment_type.name == "Avaliacao" 
      appoint_id =  appointment.id
      else
        # retorna erro
      end
    end

    session["current_appointment"] = appoint_id

    test = nil
    appoint_plan = nil

    if(!session["test_sequence"].blank?)
      appoint_plan = session["test_sequence"]
    else
      appoint_plan = AppointmentPlan.where(:appointment_id => appoint_id)
    end

    test = appoint_plan[0].evaluation_test

    if(appoint_plan.size == 1)
      session["test_sequence"] = nil
    else
      i = 1
      size = appoint_plan.size - 1

      tests = Array.new
      while i <= size  do #enquanto houver testes por fazer...
        tests << appoint_plan[i]
        i = i + 1
      end
      session["test_sequence"] = tests
    end
    #verificar para qual teste enviar
    if test != nil
      if test.name == "wms"
        redirect_to new_wms_result_path
      end
      if test.name == "wais"
        redirect_to new_wais_result_path
      end
      if test.name == "clock"
        redirect_to new_clock_result_path
      end
      if test.name == "ftt"
        redirect_to new_ftt_result_path
      end
      if test.name == "tmt"
        redirect_to new_tmt_result_path
      end
    else
      redirect_to appointments_path
    end

  end

  # GET /tmts/1
  # GET /tmts/1.json
  def show
    # @appointment_plan = TmtResult.find(params[:id])
    @appointment_plans  = AppointmentPlan.where(:appointment_id => params[:id] )

    @appointment = Appointment.where(:id => params[:id] ).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment_plan }
    end
  end

  def new

    @appoitment_plan = AppointmentPlan.where(:appointment_id => params[:appID] )

    @testes2 = EvaluationTest.all
    @testes = ""

    @testes2.each do |test|
      encontrou = false
      @appoitment_plan.each do |app_test|
        if test.name == app_test.evaluation_test.name
        encontrou = true
        end
      end
      if encontrou == false
        @testes += "<img id=\"#{test.name}\" src=\"/assets/#{test.name}.png\" draggable=\"true\" ondragstart=\"drag(event)\" width=\"100\" height=\"100\"> "
      end
    end

    @appointment_plan = AppointmentPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment_plan }
    end
  end

  def create
    appointmentID = params[:appoitmentID]
    listaTestes =  params[:testList]

    for i in 0..listaTestes.length-1
      app_plan = AppointmentPlan.new
      app_plan.appointment_id = params[:appoitmentID]
      app_plan.evaluation_test_id = EvaluationTest.where(:name => listaTestes[i]).first.id
      app_plan.save
    end

    # redirect_to :controller => 'appointment_plans', :action => 'show', :id => params[:appoitmentID], :method => :get
    #redirect_to :back
    render :index
  end

  # PUT /appointment_plans/1
  # PUT /appointment_plans/1.json
  def update
    appointmentID = params[:appoitmentID]
    listaTestes =  params[:testList]
    AppointmentPlan.destroy_all(:appointment_id => appointmentID)

    for i in 0..listaTestes.length-1
      app_plan = AppointmentPlan.new
      app_plan.appointment_id = params[:appoitmentID]
      app_plan.evaluation_test_id = EvaluationTest.where(:name => listaTestes[i]).first.id
      app_plan.save
    end

    render :index
  #@app = app_plan
  #@app.id = params[:appoitmentID]
  #redirect_to "/view/"+ params[:appoitmentID]
  #redirect_to @app, :method => :GET
  #render :action => "show",  :id =>  params[:appoitmentID]
  #redirect_to :action => "show",  :id =>  params[:appoitmentID], :method => :get
  #redirect_to :controller => 'appointment_plans', :action => 'show', :id => params[:appoitmentID], :method => :get
  #redirect_to :back
  #redirect_to { :controller => "appointment_plans", :action => "show",  :id =>  params[:appoitmentID] }, :method => :get
  end

  # DELETE /appointment_plans/1
  # DELETE /appointment_plans/1.json
  def destroy
    @appoitment_plan = AppointmentPlan.where(:appointment_id => params[:id] )

    @appoitment_plan.each do |app_test|
      app_test.destroy
    end

    #@appointment_plan.destroy

    respond_to do |format|
      format.html { redirect_to appointment_plans_url }
      format.json { head :no_content }
    end
  end

end