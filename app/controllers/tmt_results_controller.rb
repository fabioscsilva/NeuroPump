class TmtResultsController < ApplicationController
  # GET /tmts
  # GET /tmts.json
  def index
    @tmts = TmtResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tmts }
    end
  end

  # GET /tmts/1
  # GET /tmts/1.json
  def show
    @tmt = TmtResult.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tmt }
    end
  end

  # GET /tmts/new
  # GET /tmts/new.json
  def new
    @tmt = TmtResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tmt }
    end
  end

  # GET /tmts/1/edit
  def edit
    @tmt = TmtResult.find(params[:id])
  end

  # POST /tmts
  # POST /tmts.json
  def create
    @tmt = TmtResult.new(params[:tmt])

    respond_to do |format|
      if @tmt.save
        format.html { redirect_to @tmt, notice: 'Tmt was successfully created.' }
        format.json { render json: @tmt, status: :created, location: @tmt }
      else
        format.html { render action: "new" }
        format.json { render json: @tmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tmts/1
  # PUT /tmts/1.json
  def update
    @tmt = TmtResult.find(params[:id])

    respond_to do |format|
      if @tmt.update_attributes(params[:tmt])
        format.html { redirect_to @tmt, notice: 'Tmt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tmt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tmts/1
  # DELETE /tmts/1.json
  def destroy
    @tmt = TmtResult.find(params[:id])
    @tmt.destroy

    respond_to do |format|
      format.html { redirect_to tmt_results_url }
      format.json { head :no_content }
    end
  end
end