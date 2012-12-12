class NeuropsychologistsController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /neuropsychologists
  # GET /neuropsychologists.json
  def index
    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @neuropsychologists = Neuropsychologist.is_active.all(:conditions => "clinic_id = #{manager.clinic.id}")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @neuropsychologists }
    end
  end

  # GET /neuropsychologists/1
  # GET /neuropsychologists/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @neuropsychologist }
    end
  end

  # GET /neuropsychologists/new
  # GET /neuropsychologists/new.json
  def new
  login_id = params[:id]
  clinic_id = params[:clinic]
  @login = nil
    if !login_id.blank? && !clinic_id.blank?
      @login = Login.find_by_id(login_id)
      @clinic = Clinic.find_by_id(clinic_id)
      if !@login.nil? && !@clinic.nil? 
        if @login.neuropsychologists.count == 0 && @login.type == Type.find_by_description("Neuropsicologo")
        @clinic_id =  clinic_id
        @neuropsychologist = Neuropsychologist.new
        @genders = Gender.all
        @pageType = "new"
        @neuropsychologist.build_login
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @neuropsychologist }
        end
        else
          redirect_to new_login_session_path 
        end
     else
       redirect_to new_login_session_path
     end
      
        
    else
      redirect_to new_login_session_path 
    end
      
    
  end

  # GET /neuropsychologists/1/edit
  def edit
    @pageType = "edit"
  end

  # POST /neuropsychologists
  # POST /neuropsychologists.json
  def create
    #raise params.inspect
    #login_id = params[:secretary].delete(:login_id)
    # clinic_id = params[:secretary].delete(:clinic_id)
    gender_id = params[:neuropsychologist].delete(:gender_id)
    
    email = params[:neuropsychologist][:login_attributes].delete(:email)
    pass = params[:neuropsychologist][:login_attributes].delete(:password)
    params[:neuropsychologist][:login_attributes].delete(:password_confirmation)
    params[:neuropsychologist].delete(:login_attributes)
    @neuropsychologist = Neuropsychologist.new(params[:neuropsychologist])
    login = Login.find_by_email(email)
    login.update_attribute(:password,pass)
    @neuropsychologist.login_id = login.id
    @neuropsychologist.gender_id = gender_id
    # manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @neuropsychologist.clinic_id = params[:clinic_id]
    @neuropsychologist.active = true
    respond_to do |format|
      if @neuropsychologist.save

        Login.find(@neuropsychologist.login.id).add_role :neuropsychologist
        format.html { redirect_to new_login_session_path, notice: 'Conta criada com sucesso. Por favor entre com as credenciais introduzidas.'}
        format.json { render json: @neuropsychologist, status: :created, location: @neuropsychologist }
      else
        format.html { render action: "new" }
        format.json { render json: @neuropsychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /neuropsychologists/1
  # PUT /neuropsychologists/1.json
  def update
    # login_id = params[:neuropsychologist].delete(:login_id)
    # clinic_id = params[:neuropsychologist].delete(:clinic_id)
    # gender_id = params[:neuropsychologist].delete(:gender_id)
    @neuropsychologist = Neuropsychologist.find(params[:id])

    # @neuropsychologist.login_id = login_id
    # @neuropsychologist.clinic_id = clinic_id
    # @neuropsychologist.gender_id = gender_id

    respond_to do |format|
      if @neuropsychologist.update_attributes(params[:neuropsychologist])
        format.html { redirect_to @neuropsychologist, notice: 'Neuropsicologo editado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @neuropsychologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /neuropsychologists/1
  # DELETE /neuropsychologists/1.json
  def destroy
    @neuropsychologist = Neuropsychologist.find(params[:id])
    # @neuropsychologist.destroy
    @neuropsychologist.update_attribute(:active ,false)

    respond_to do |format|
      format.html { redirect_to neuropsychologists_url }
      format.json { head :no_content }
    end
  end

  def invite
    if login_signed_in?
      if !Login.find(current_login.id).has_role? :manager
        redirect_to new_login_session_path   
      end
    else
      redirect_to new_login_session_path  
    end
  end

  def sendInvite
    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    emailsAux = params[:email].to_s.split('["')
    emailsAux2 = emailsAux[1].to_s.split('"]')
    @emails = emailsAux2[0].to_s.split(';')
    
    type_neuro = Type.find_by_description("Neuropsicologo").id
    @emails.each do |email|
      
      log = Login.create([{email:"#{email.to_s}", password:"qwerty", type_id: "#{type_neuro}"}])
      UserMailer.send_email_neuropsychologists(email.to_s,log.first.id,manager.clinic.id).deliver
      puts "#{type_neuro}!!!!!!!!!!!!!!!!"
    end
      session[:emailsSentNeuro] = true
      redirect_to '/inviteNeuropsychologists'
  end
end
