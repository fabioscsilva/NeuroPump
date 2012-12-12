class SecretariesController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /secretaries
  # GET /secretaries.json
  def index
    # @secretaries = Secretary.all
    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @secretaries = Secretary.is_active.all(:conditions => "clinic_id = #{manager.clinic.id}")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @secretaries }
    end
  end

  # GET /secretaries/1
  # GET /secretaries/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @secretary }
    end
  end

  # GET /secretaries/new
  # GET /secretaries/new.json
  def new
   # raise params.inspect
  login_id = params[:id]
  clinic_id = params[:clinic]
  # params.delete 'id'
  # params.to_param
  @login = nil
    if !login_id.blank? && !clinic_id.blank?
      @login = Login.find_by_id(login_id)
      @clinic = Clinic.find_by_id(clinic_id)
      if !@login.nil? && !@clinic.nil? 
        if @login.secretaries.count == 0 && @login.type == Type.find_by_description("Secretaria")
        @clinic_id =  clinic_id
        @secretary = Secretary.new
        @genders = Gender.all
        @pageType = "new"
        @secretary.build_login
        respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @secretary }
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

  # GET /secretaries/1/edit
  def edit
    @pageType = "edit"
  end

  # POST /secretaries
  # POST /secretaries.json
  def create
    #raise params.inspect
    #login_id = params[:secretary].delete(:login_id)
    gender_id = params[:secretary].delete(:gender_id)
    # clinic_id = params[:secretary].delete(:clinic_id)
    
    email = params[:secretary][:login_attributes].delete(:email)
    pass = params[:secretary][:login_attributes].delete(:password)
    params[:secretary][:login_attributes].delete(:password_confirmation)
    params[:secretary].delete(:login_attributes)
    
    @secretary = Secretary.new(params[:secretary])
    login = Login.find_by_email(email)
    login.update_attribute(:password,pass)
    @secretary.login_id = login.id
    @secretary.gender_id = gender_id
    # manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @secretary.clinic_id = params[:clinic_id]
    
    @secretary.active = true
    
    
    respond_to do |format|
      if @secretary.save
        #@secretary.add_role :secretary
        Login.find(@secretary.login.id).add_role :secretary
        format.html { redirect_to new_login_session_path, notice: 'Conta criada com sucesso. Por favor entre com as credenciais introduzidas.'}
        format.json { render json: @secretary, status: :created, location: @secretary }
      else
        format.html { render action: "new" }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /secretaries/1
  # PUT /secretaries/1.json
  def update
    #raise params.inspect
    # login_id = params[:secretary].delete(:login_id)
    # gender_id = params[:secretary].delete(:gender_id)
    # clinic_id = params[:secretary].delete(:clinic_id)

    # @secretary.login_id = login_id
    # @secretary.gender_id = gender_id
    # @secretary.clinic_id = clinic_id

    respond_to do |format|
      if @secretary.update_attributes(params[:secretary])
        format.html { redirect_to @secretary, notice: 'Secretaria atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secretaries/1
  # DELETE /secretaries/1.json
  def destroy
    # @secretary.destroy
    @secretary.update_attribute(:active ,false)
    respond_to do |format|
      format.html { redirect_to secretaries_url }
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
    #raise params.inspect
    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    emailsAux = params[:email].to_s.split('["')
    emailsAux2 = emailsAux[1].to_s.split('"]')
    @emails = emailsAux2[0].to_s.split(';')

    type_secretary = Type.find_by_description("Secretaria").id
    @emails.each do |email|
      
      log = Login.create([{email:"#{email.to_s}", password:"qwerty", type_id: "#{type_secretary}"}])
      UserMailer.send_email_secretaries(email.to_s,log.first.id,manager.clinic.id).deliver
    end
    
      session[:emailsSentSec] = true

      redirect_to '/inviteSecretaries'
  end
end
