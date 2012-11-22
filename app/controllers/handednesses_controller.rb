class HandednessesController < ApplicationController
  # GET /handednesses
  # GET /handednesses.json
  def index
    @handednesses = Handedness.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @handednesses }
    end
  end

  # GET /handednesses/1
  # GET /handednesses/1.json
  def show
    @handedness = Handedness.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @handedness }
    end
  end

  # GET /handednesses/new
  # GET /handednesses/new.json
  def new
    @handedness = Handedness.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @handedness }
    end
  end

  # GET /handednesses/1/edit
  def edit
    @handedness = Handedness.find(params[:id])
  end

  # POST /handednesses
  # POST /handednesses.json
  def create
    @handedness = Handedness.new(params[:handedness])

    respond_to do |format|
      if @handedness.save
        format.html { redirect_to @handedness, notice: 'Handedness was successfully created.' }
        format.json { render json: @handedness, status: :created, location: @handedness }
      else
        format.html { render action: "new" }
        format.json { render json: @handedness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /handednesses/1
  # PUT /handednesses/1.json
  def update
    @handedness = Handedness.find(params[:id])

    respond_to do |format|
      if @handedness.update_attributes(params[:handedness])
        format.html { redirect_to @handedness, notice: 'Handedness was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @handedness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handednesses/1
  # DELETE /handednesses/1.json
  def destroy
    @handedness = Handedness.find(params[:id])
    @handedness.destroy

    respond_to do |format|
      format.html { redirect_to handednesses_url }
      format.json { head :no_content }
    end
  end
end
