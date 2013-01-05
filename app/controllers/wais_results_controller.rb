class WaisResultsController < ApplicationController
  # GET /wais
  # GET /wais.json
  def index
    @wai = WaisResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wai }
    end
  # @wais = Wai.all
  #
  # respond_to do |format|
  # format.html # index.html.erb
  # format.json { render json: @wais }
  # end

  end

  # GET /wais/1
  # GET /wais/1.json
  def show
     @wai = WaisResult.find(params[:id])

     respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wai }
    end
  end

  # GET /wais/new
  # GET /wais/new.json
  def new
     @wai = WaisResult.new

    if session["wais_phase"].blank?
       session["wais_phase"] = 1
    else
       session["wais_phase"] = 2
    end

     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wai }
    end
  end

  # GET /wais/1/edit
  def edit
     @wai = WaisResult.find(params[:id])
  end

  # POST /wais
  # POST /wais.json
  def create
     @wai = WaisResult.new(params[:wai])

    @wai.phase = session["wais_phase"]

     respond_to do |format|
      if @wai.save
        format.html {
          if session["wais_phase"] == 2
             session["wais_phase"] = nil
             redirect_to @wai, notice: 'WAIS III - Resultados Pesquisa de simbolos gravados com sucesso.'
          else
             redirect_to new_wais_result_path, notice: 'WAIS III - Resultados Codigo gravados com sucesso.'
          end
        }
        format.json { render json: @wai, status: :created, location: @wai }
      else
        format.html { render action: "new" }
        format.json { render json: @wai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wais/1
  # PUT /wais/1.json
  def update
     @wai = WaisResult.find(params[:id])

     respond_to do |format|
      if @wai.update_attributes(params[:wai])
        format.html { redirect_to @wai, notice: 'Wai was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wais/1
  # DELETE /wais/1.json
  def destroy
     @wai = WaisResult.find(params[:id])
    @wai.destroy

     respond_to do |format|
      format.html { redirect_to wais_results_url }
      format.json { head :no_content }
    end
  end

  def download
    url = "public/wais.pdf"
     send_file url, :type=>"application/pdf"
  end
end