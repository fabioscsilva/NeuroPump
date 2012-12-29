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
    @wm = Wm.new(params[:wm])

    respond_to do |format|
      if @wm.save
        format.html { redirect_to @wm, notice: 'Wm was successfully created.' }
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
