class ClinicalHistoriesController < ApplicationController
  # GET /clinical_histories
  # GET /clinical_histories.json
  def index
    @clinical_histories = ClinicalHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinical_histories }
    end
  end

  # GET /clinical_histories/1
  # GET /clinical_histories/1.json
  def show
    @clinical_history = ClinicalHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinical_history }
    end
  end

  # GET /clinical_histories/new
  # GET /clinical_histories/new.json
  def new
    @clinical_history = ClinicalHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinical_history }
    end
  end

  # GET /clinical_histories/1/edit
  def edit
    @clinical_history = ClinicalHistory.find(params[:id])
  end

  # POST /clinical_histories
  # POST /clinical_histories.json
  def create
    patient_id = params[:clinical_history].delete(:patient_id)
    @clinical_history = ClinicalHistory.new(params[:clinical_history])

    @clinical_history.patient_id = patient_id

    respond_to do |format|
      if @clinical_history.save
        format.html { redirect_to @clinical_history, notice: 'Clinical history was successfully created.' }
        format.json { render json: @clinical_history, status: :created, location: @clinical_history }
      else
        format.html { render action: "new" }
        format.json { render json: @clinical_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinical_histories/1
  # PUT /clinical_histories/1.json
  def update
    patient_id = params[:clinical_history].delete(:patient_id)
    @clinical_history = ClinicalHistory.find(params[:id])

    @clinical_history.patient_id = patient_id

    respond_to do |format|
      if @clinical_history.update_attributes(params[:clinical_history])
        format.html { redirect_to @clinical_history, notice: 'Clinical history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinical_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_histories/1
  # DELETE /clinical_histories/1.json
  def destroy
    @clinical_history = ClinicalHistory.find(params[:id])
    @clinical_history.destroy

    respond_to do |format|
      format.html { redirect_to clinical_histories_url }
      format.json { head :no_content }
    end
  end
end
