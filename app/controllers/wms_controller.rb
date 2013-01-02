class WmsController < ApplicationController
  # GET /wms
  # GET /wms.json
  def index
    @wms = Wm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wms }
    end
  end

  # GET /wms/1
  # GET /wms/1.json
  def show
    @wm = Wm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wm }
    end
  end

  # GET /wms/new
  # GET /wms/new.json
  def new
    @wm = Wm.new
    
    if session["wms_phase"].blank?
      session["wms_phase"] = 1
    else  
      session["wms_phase"] = 2
    end  
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wm }
    end
  end

  # GET /wms/1/edit
  def edit
    @wm = Wm.find(params[:id])
  end

  # POST /wms
  # POST /wms.json
  def create
    #raise params.inspect

    wmsPhase = session["wms_phase"].to_f
    total = 0
    
    #number of answers
    if wmsPhase == 1 
      total = 21
    else
      total = 16
    end

    #correct answers
    correct = params[:hiddenResult][0].to_f
    #wrong answers
    wrong = total-correct

    @wm = Wm.new(params[:wm])
    @wm.correct_items = correct
    @wm.wrong_items = wrong
    @wm.phase = wmsPhase

    respond_to do |format|
      if @wm.save
        if wmsPhase == 1
          format.html { redirect_to new_wm_path, notice: 'WMS II - Sequencia Letra-Numero guardada com sucesso.' }
        else
          format.html { redirect_to new_wm_path, notice: 'WMS II - Sequencia Espacial Direta guardada com sucesso.' }
          session["wms_phase"] = nil
        end
        format.json { render json: @wm, status: :created, location: @wm }
      else
        format.html { render action: "new" }
        format.json { render json: @wm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wms/1
  # PUT /wms/1.json
  def update
    @wm = Wm.find(params[:id])

    respond_to do |format|
      if @wm.update_attributes(params[:wm])
        format.html { redirect_to @wm, notice: 'Wm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wms/1
  # DELETE /wms/1.json
  def destroy
    @wm = Wm.find(params[:id])
    @wm.destroy

    respond_to do |format|
      format.html { redirect_to wms_url }
      format.json { head :no_content }
    end
  end
end
