class ClinicsController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /clinics
  # GET /clinics.json
  def index
    if current_login.has_role? :manager
      @clinics = Clinic.joins(:login).where("deleted_at IS NULL")
    elsif current_login.has_role? :administrator
      @clinics = Clinic.all
    end

    @packagesClinicsHash = Hash.new;

    @clinics.each do |c|
      @packagesClinicsHash[c.id] = PackagesClinic.where('clinic_id' => c.id).first;
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinics }
    end
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
    @payments = Payment.in_clinic(@clinic.id).order('creation_date DESC').all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinic }
    end
  end

  # GET /clinics/new
  # GET /clinics/new.json
  def new
    @clinic = Clinic.new
    @packages = Package.all
    @pageType = "new"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic }
    end
  end

  def changePackage
    @packages = Package.all

    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @cID = manager.clinic_id

    p = Payment.where(:clinic_id => @cID).where(:payed => false).count
    if p > 0
      @payments = false
    else
      @payments = true
    end

    packageClinic = PackagesClinic.where(:clinic_id => @cID).first
    @packageID = packageClinic.package_id
    @bestPackageID = Package.order("id DESC").first.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinic }
    end
  end

  def changePackageSubmit
    packageType = params[:packageType]
    p = Package.find(packageType.to_i)
    idP = p.id
    tokenNum = p.n_appointments
    price = p.price


    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    cID = manager.clinic_id
    packages_clinic = PackagesClinic.where(:clinic_id => @cID).first
    packages_clinic.appointment_token = tokenNum
    packages_clinic.start_date = DateTime.now.to_date
    packages_clinic.week = 1
    packages_clinic.package_id = idP

    ref = SecureRandom.hex(16)
    ent = 27035

    @clinic = Clinic.find(cID)
    email = Login.find(manager.login_id)

     respond_to do |format|
      if packages_clinic.save
        UserMailer.send_email_managerUpdate(email.to_s,@clinic.name.to_s,ref.to_s, ent.to_s, price.to_s).deliver
        format.html { redirect_to @clinic, notice: 'Pacote da clinica mudado com successo.' }
      else
        format.html { redirect_to @clinic, notice: 'Pacote da clinica nao foi mudado com successo' }
      end
    end

  end
  # GET /clinics/1/edit
  def edit
    @pageType = "edit"
    @clinic.mobilephone = Manager.where(:clinic_id => @clinic.id).first.mobilephone
  end

  # POST /clinics
  # POST /clinics.json
  def create

    ref = SecureRandom.hex(16)
    ent = 27035

    login = Login.new
    login.email = params[:clinic][:email]
    login.password = "passwordGerada"
    login.add_role :manager

    manager = Manager.new
    manager.telephone = params[:clinic][:telephone]
    manager.mobilephone = params[:clinic][:mobilephone]

    packageType = params[:packageType]
    p = Package.find(packageType.to_i)
    idP = p.id
    tokenNum = p.n_appointments
    price = p.price
 

    packages_clinic = PackagesClinic.new
    packages_clinic.appointment_token = tokenNum
    packages_clinic.start_date = DateTime.now.to_date
    packages_clinic.week = 1
    packages_clinic.package_id = idP

    @clinic = Clinic.new(params[:clinic])

    flag = true
    begin
      Manager.transaction do
        PackagesClinic.transaction do
          Clinic.transaction do
            Login.transaction do
              login.save
              manager.login_id = login.id
              @clinic.save
              packages_clinic.clinic_id = @clinic.id
              packages_clinic.save
              manager.clinic_id = @clinic.id
              manager.save
            end
          end
        end
      end
    rescue ActiveRecord::RecordInvalid => invalid
      flag = false
    end

    if flag == true
      respond_to do |format|
        UserMailer.send_email_manager(login.email.to_s,login.password.to_s,@clinic.name.to_s,ref.to_s, ent.to_s, price.to_s).deliver
        format.html { redirect_to @clinic, notice: 'Clinica criado com successo.' }
      end
    else
      respond_to do |format| 
          format.html { render action: "new", notice: 'Clinica nao foi criado com successo' }
        end
    end
  end

  # PUT /clinics/1
  # PUT /clinics/1.json
  def update
    #raise params.inspect
    #admin_id = params[:clinic].delete(:administrator_id)
    
    @clinic = Clinic.find(params[:id])
    #@clinic.administrator_id = admin_id

    respond_to do |format|
      if @clinic.update_attributes(params[:clinic])
        format.html { redirect_to @clinic, notice: 'Clinica editada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    #authorize! :index, @login, :message => 'Nao autorizado!'
    @clinic = Clinic.find(params[:id])
    if @clinic.deleted_at == nil
      @clinic.update_attribute(:deleted_at ,Time.now)
    else
       @clinic.update_attribute(:deleted_at ,nil)
    end

    respond_to do |format|
      format.html { redirect_to clinics_url }
      format.json { head :no_content }
    end
  end
end
