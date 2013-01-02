class FttResultsController < ApplicationController
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
    @ftt = FttResult.new(params[:ftt])

    respond_to do |format|
      if @ftt.save
        format.html { redirect_to @ftt, notice: 'Ftt was successfully created.' }
        format.json { render json: @ftt, status: :created, location: @ftt }
      else
        format.html { render action: "new" }
        format.json { render json: @ftt.errors, status: :unprocessable_entity }
      end
    end
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
