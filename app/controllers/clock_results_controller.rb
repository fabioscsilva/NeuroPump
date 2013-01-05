class ClockResultsController < ApplicationController
  # GET /clocks
  # GET /clocks.json
  def index
    @clocks = ClockResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clocks }
    end
  end

  # GET /clocks/1
  # GET /clocks/1.json
  def show
    @clock = ClockResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clock }
    end
  end

  # GET /clocks/new
  # GET /clocks/new.json
  def new
    @clock = ClockResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clock }
    end
  end

  # GET /clocks/1/edit
  def edit
    @clock = ClockResult.find(params[:id])
  end

  # POST /clocks
  # POST /clocks.json
  def create
    @clock = ClockResult.new(params[:clock_result])

    respond_to do |format|
      if @clock.save
         if session["test_sequence"].blank?
            format.html { redirect_to appointments_path, notice: 'Teste do Relogio - Resultados gravados com sucesso.' }
          else
            format.html { redirect_to appointment_plans_path, notice: 'Teste do Relogio - Resultados gravados com sucesso.' }
          end          
        format.json { render json: @clock, status: :created, location: @clock }
      else
        format.html { render action: "new" }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clocks/1
  # PUT /clocks/1.json
  def update
    @clock = ClockResult.find(params[:id])

    respond_to do |format|
      if @clock.update_attributes(params[:clock])
        format.html { redirect_to @clock, notice: 'Clock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clocks/1
  # DELETE /clocks/1.json
  def destroy
    @clock = ClockResult.find(params[:id])
    @clock.destroy

    respond_to do |format|
      format.html { redirect_to clock_results_url }
      format.json { head :no_content }
    end
  end

  def download
    url = "public/clock.pdf"
    send_file url, :type=>"application/pdf"
  end
end
