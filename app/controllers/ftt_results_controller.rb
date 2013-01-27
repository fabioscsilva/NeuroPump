class FttResultsController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /ftts
  # GET /ftts.json
  def index
    @ftts = FttResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ftts }
    end
  end

  # GET /ftts/1
  # GET /ftts/1.json
  def show
    @ftt = FttResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ftt }
    end
  end

  # GET /ftts/new
  # GET /ftts/new.json
  def new
    @ftt = FttResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ftt }
    end
  end

  # GET /ftts/1/edit
  def edit
    @ftt = FttResult.find(params[:id])
  end

  # POST /ftts
  # POST /ftts.json
  def create
    # raise params.inspect
    ftt1 = FttResult.new
    ftt1.test_phase = 1;
    ftt1.observations = params[:observationsA]
    ftt1.first = params[:teste0]
    ftt1.second = params[:teste1]
    ftt1.third = params[:teste2]
    ftt1.fourth = params[:teste3]
    ftt1.fifth = params[:teste4]
    ftt1.sixth = params[:teste5]
    ftt1.seventh = params[:teste6]
    ftt1.eighth = params[:teste7]
    ftt1.ninth = params[:teste8]
    ftt1.tenth = params[:teste9]
    # ftt1.save

    ftt2 = FttResult.new
    ftt2.test_phase = 1;
    ftt2.observations = params[:observationsB]
    ftt2.first = params[:teste10]
    ftt2.second = params[:teste11]
    ftt2.third = params[:teste12]
    ftt2.fourth = params[:teste13]
    ftt2.fifth = params[:teste14]
    ftt2.sixth = params[:teste15]
    ftt2.seventh = params[:teste16]
    ftt2.eighth = params[:teste17]
    ftt2.ninth = params[:teste18]
    ftt2.tenth = params[:teste19]
    # ftt2.save
    appoint_id = session["current_appointment"].to_f
    if(!appoint_id.blank?)
      ev_test = EvaluationTest.find_by_name("ftt")
      app = AppointmentPlan.where(:appointment_id => appoint_id, :evaluation_test_id => ev_test.id)
      ftt1.appointment_plan_id = app.first.id
      ftt2.appointment_plan_id = app.first.id
    end

    respond_to do |format|
      if ftt1.save &&  ftt2.save
        if session["test_sequence"].blank?
           appID = session["current_appointment"]
            session["current_appointment"] = nil
            format.html { redirect_to :controller => "evaluation_results", :action => "new" , :appID => appID}
        else
          format.html { redirect_to appointment_plans_path, notice: 'TMT - Resultados guardados com sucesso.' }
        end
      # format.json { render json: @ftt, status: :created, location: @ftt }
      else
        format.html { render action: "new" }
      # format.json { render json: @ftt.errors, status: :unprocessable_entity }
      end
    # end
    end

    # PUT /ftts/1
    # PUT /ftts/1.json
    def update
      @ftt = FttResult.find(params[:id])

      respond_to do |format|
        if @ftt.update_attributes(params[:ftt])
          format.html { redirect_to @ftt, notice: 'Ftt was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @ftt.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /ftts/1
    # DELETE /ftts/1.json
    def destroy
      @ftt = FttResult.find(params[:id])
      @ftt.destroy

      respond_to do |format|
        format.html { redirect_to ftt_results_url }
        format.json { head :no_content }
      end
    end
  end
end