class EvaluationResultsController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /evaluation_results
  # GET /evaluation_results.json
  def index
    @evaluation_results = EvaluationResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluation_results }
    end
  end

  # GET /evaluation_results/1
  # GET /evaluation_results/1.json
  def show
    @evaluation_result = EvaluationResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation_result }
    end
  end

  # GET /evaluation_results/new
  # GET /evaluation_results/new.json
  def new
    @evaluation_result = EvaluationResult.new

    #Carregar a apointment dinamicamente
    @appoint_id = 0
    if !params[:appID].blank?
      @appoint_id = params[:appID].to_i
    end

    @wais = nil
    @wms = nil
    @tmt = nil
    @ftt = nil
    @clock = nil
   
    app = Appointment.find(@appoint_id)
    s = AppointmentStatus.find_by_name("Realizada")
    app.appointment_status = s
    app.save
   
    #atual (a que acabou de se realizada)
    appoint_plan = AppointmentPlan.where(:appointment_id => @appoint_id)
    @patient = appoint_plan.first.appointment.patient
    appoint_plan.each do |a|
      if(a.evaluation_test.name == "wais")
        @wais = WaisResult.where(:appointment_plan_id => a.id)
      end
      if(a.evaluation_test.name == "wms")
        @wms = WmsResult.where(:appointment_plan_id => a.id)
      end
      if(a.evaluation_test.name == "ftt")
        @ftt = FttResult.where(:appointment_plan_id => a.id)
      end
      if(a.evaluation_test.name == "tmt")
        @tmt = TmtResult.where(:appointment_plan_id => a.id)
      end
      if(a.evaluation_test.name == "clock")
        @clock = ClockResult.where(:appointment_plan_id => a.id)
      end
    end
    
    #a antiga
    @waisOld = nil
    @wmsOld = nil
    @tmtOld = nil
    @fttOld = nil
    @clockOld = nil
        
    old_appoint =  Appointment.joins(:appointment_status).where("appointments.patient_id = #{@patient.id} AND appointments.id != #{@appoint_id} AND appointment_statuses.name = 'Realizada'").order("appointments.appointment_day DESC")
    
    if old_appoint.count > 0
      appoint_old_plan = AppointmentPlan.where(:appointment_id => old_appoint.first.id)
      
      appoint_old_plan.each do |a|
        if(a.evaluation_test.name == "wais")
          @waisOld = WaisResult.where(:appointment_plan_id => a.id)
        end
        if(a.evaluation_test.name == "wms")
          @wmsOld = WmsResult.where(:appointment_plan_id => a.id)
        end
        if(a.evaluation_test.name == "ftt")
          @fttOld = FttResult.where(:appointment_plan_id => a.id)
        end
        if(a.evaluation_test.name == "tmt")
          @tmtOld = TmtResult.where(:appointment_plan_id => a.id)
        end
        if(a.evaluation_test.name == "clock")
          @clockOld = ClockResult.where(:appointment_plan_id => a.id)
        end
      end
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation_result }
    end
  end

  # GET /evaluation_results/1/edit
  def edit
    @evaluation_result = EvaluationResult.find(params[:id])
  end

  # POST /evaluation_results
  # POST /evaluation_results.json
  def create
    #raise params.inspect
    @evaluation_result = EvaluationResult.new(params[:evaluation_result])
    @evaluation_result.appointment_id = params[:appoint_id].to_f

    respond_to do |format|
      if @evaluation_result.save
        format.html { redirect_to appointments_path, notice: 'Resultados da avaliacao guardados com sucesso.' }
        format.json { render json: @evaluation_result, status: :created, location: @evaluation_result }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluation_results/1
  # PUT /evaluation_results/1.json
  def update
    @evaluation_result = EvaluationResult.find(params[:id])

    respond_to do |format|
      if @evaluation_result.update_attributes(params[:evaluation_result])
        format.html { redirect_to @evaluation_result, notice: 'Evaluation result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluation_results/1
  # DELETE /evaluation_results/1.json
  def destroy
    @evaluation_result = EvaluationResult.find(params[:id])
    @evaluation_result.destroy

    respond_to do |format|
      format.html { redirect_to evaluation_results_url }
      format.json { head :no_content }
    end
  end
end
