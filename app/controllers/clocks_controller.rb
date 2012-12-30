class ClocksController < ApplicationController
  # GET /clocks
  # GET /clocks.json
  def index
    @clock = Clock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clock }
    end

    # @clocks = Clock.all
# 
    # respond_to do |format|
      # format.html # index.html.erb
      # format.json { render json: @clocks }
    # end
  end

  # GET /clocks/1
  # GET /clocks/1.json
  def show
    @clock = Clock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clock }
    end
  end

  # GET /clocks/new
  # GET /clocks/new.json
  def new
    @clock = Clock.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clock }
    end
  end

  # GET /clocks/1/edit
  def edit
    @clock = Clock.find(params[:id])
  end

  # POST /clocks
  # POST /clocks.json
  def create
    @clock = Clock.new(params[:clock])

    respond_to do |format|
      if @clock.save
        format.html { redirect_to @clock, notice: 'Clock was successfully created.' }
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
    @clock = Clock.find(params[:id])

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
    @clock = Clock.find(params[:id])
    @clock.destroy

    respond_to do |format|
      format.html { redirect_to clocks_url }
      format.json { head :no_content }
    end
  end

  def download
    url = "public/clock.pdf"
    send_file url, :type=>"application/pdf"
  end
end
