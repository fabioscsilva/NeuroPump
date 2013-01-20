class ManagersController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /managers
  # GET /managers.json
  def index
    #authorize! :index, @login, :message => 'Not authorized as an administrator.'
    #É preciso ir buscar a clinica do gestor atual para carregar a informação
    manager = Manager.first(:conditions => "login_id = #{current_login.id}")
    @clinic = manager.clinic

    @managers = Manager.all
    
    
    neuropsychologists = @clinic.neuropsychologists
    
    @appointments = []
    neuropsychologists.each do |neuropsychologist|
      @appointments << neuropsychologist.appointments
    end
    
    # get all appointment's statuses
    appointmentStatuses = Array.new(0)
    AppointmentStatus.all.each do |status|
      appointmentStatuses << status.id
    end
    
    # print appointmentStatuses.to_s + "\n \n \n"
    
    year = Time.new.year
    datepart = "date_part('month', appointment_day)"
    appointmentsValues = Appointment.joins(:neuropsychologist).select(datepart + ", appointments.appointment_status_id, COUNT(*)").where("neuropsychologists.clinic_id = ? AND date_part('year', appointment_day) = ? ", @clinic.id, year.to_s).group(datepart + ", appointments.appointment_status_id").order(datepart + " ASC, appointments.appointment_status_id ASC").all
    
    print "\n \n \n \n \n \n \n \n \n \n"
    print appointmentsValues.to_yaml
    print "\n \n \n \n \n \n \n \n \n"
    
    monthlyVals = Array.new(13)
    
    # monthlyVals["Jan"] = appointmentsValues["1"].nil? ? 0 : appointmentsValues["1"]
    months = Hash.new
    months[1] = "Janeiro"
    months[2] = "Fevereiro"
    months[3] = "Marco"
    months[4] = "Abril"
    months[5] = "Maio"
    months[6] = "Junho"
    months[7] = "Julho"
    months[8] = "Agosto"
    months[9] = "Setembro"
    months[10] = "Outubro"
    months[11] = "Novembro"
    months[12] = "Dezembro"
    
    month = 1
    size = appointmentStatuses.size
    index = 0
    c=0
    aux = Array.new(size)
    while c<size
      aux[c] = AppointmentStatus.find(appointmentStatuses[c]).name
      c+=1
    end
    aux.unshift("Months")
    monthlyVals[0] = aux
    while month<=12
      #monthlyVals[months[x]] = appointmentsValues.row(x).nil? ? 0 : appointmentsValues.row(x).count
      c = 0
      aux = Array.new(size)
      while c<size
        
        #aux[c] = appointmentsValues.where("appointment_status_id = ? AND date_part = ?", appointmentStatuses[c], x)
        if (index < appointmentsValues.size)
          
          #print appointmentsValues[index].date_part.to_s + " <- valor de mes\n"
          #print appointmentsValues[index].appointment_status_id.to_s + " <- valor de status\n"
  
          #print month.to_s + " <- valor a comparar (mes)\n"
          #print appointmentStatuses[c].to_s + " <- valor a comparar (status)\n"
          
          #print index.to_s + " <- valor de indice\n"
          
          
          if ((appointmentsValues[index].date_part.to_s == month.to_s) && (appointmentsValues[index].appointment_status_id.to_s == appointmentStatuses[c].to_s))
            aux[c] = appointmentsValues[index].count.to_i
            index += 1
          else
            aux[c] = 0
          end
        else
          aux[c] = 0
        end
        
        c += 1
      end
      
      monthlyVals[month] = aux
      aux.unshift(months[month])
      #print monthlyVals[month-1].to_s + "\n\n"
      
      month = month + 1
    end
    
    #print monthlyVals.to_s
    
    print "\n \n \n \n \n \n \n \n \n"
    print monthlyVals.to_yaml + "\n"
    print "\n \n \n \n \n \n \n \n \n"
    
    
    
    @monthlyValues = monthlyVals
    
    # Appointment.select("date_part('month', appointment_day), COUNT(date_part('month', appointment_day))").group("date_part('month', appointment_day)")
    
    
    
    
    
    # Ages Graph
    aggrClause = "floor((EXTRACT(year from AGE(NOW(), date_of_birth)))/10)"
    agesValues = Patient.select(aggrClause + " as agerange, COUNT(*)").group(aggrClause).order(aggrClause).all
    
    print "\n \n \n \n \n \n \n \n \n ##########"
    print agesValues.to_yaml
    print "\n \n \n \n \n \n \n \n \n ##########"
    
    agesRanges = [
      [0,9],
      [10,19],
      [20,29],
      [30,39],
      [40,49],
      [50,59],
      [60,69],
      [70,79],
      [80,89],
      [90,99],
      [100, 1000]
    ]
    
    @agesArray = [
      ["0-9",0],
      ["10-19",0],
      ["20-29",0],
      ["30-39",0],
      ["40-49",0],
      ["50-59",0],
      ["60-69",0],
      ["70-79",0],
      ["80-89",0],
      ["90-99",0],
      ["100+",0]
    ]
    
    agesIndex = 0
    agesRanges.each do |range|
      agesValues = Patient.select("COUNT(*)").where("EXTRACT(year from AGE(NOW(), date_of_birth)) >= " + range[0].to_s + " AND EXTRACT(year from AGE(NOW(), date_of_birth)) <= " + range[1].to_s)
      
      @agesArray[agesIndex][1] = Integer(agesValues[0].count)
      agesIndex += 1
      
      # print "\n ## \n" + agesValues[0].count.to_s
    end
    
    @agesArray.unshift(["Intervalo de Idades", "Quantidade"])
    
    
    # Sex Graph
    gendersValues = Patient.joins(:gender).select("COUNT(*) as count, genders.description as description").group("genders.description")
    
    @gendersArray = Array.new
    gendersDescriptions = Array.new
    gendersQuantities = Array.new
    gendersDescriptions.push("")
    gendersQuantities.push("")
    gendersValues.each do |val|
      gendersDescriptions.push(val.description)
      gendersQuantities.push(Integer(val.count))
    end
    
    @gendersArray.push(gendersDescriptions)
    @gendersArray.push(gendersQuantities)
        
    print "\n\n\n\n" + @gendersArray.to_s + "\n\n\n"
    
    
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @managers }
    end
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/new
  # GET /managers/new.json
  def new
    @manager = Manager.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manager }
    end
  end

  # GET /managers/1/edit
  def edit
    
  end

  # POST /managers
  # POST /managers.json
  def create
    login_id = params[:manager].delete(:login_id)
    gender_id = params[:manager].delete(:gender_id)
    clinic_id = params[:manager].delete(:clinic_id)
    @manager = Manager.new(params[:manager])
  
    @manager.login_id = login_id
    @manager.gender_id = gender_id
    @manager.clinic_id = clinic_id

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render json: @manager, status: :created, location: @manager }
      else
        format.html { render action: "new" }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /managers/1
  # PUT /managers/1.json
  def update
    login_id = params[:manager].delete(:login_id)
    gender_id = params[:manager].delete(:gender_id)
    clinic_id = params[:manager].delete(:clinic_id)
    @manager = Manager.find(params[:id])

    @manager.login_id = login_id
    @manager.gender_id = gender_id
    @manager.clinic_id = clinic_id

    respond_to do |format|
      if @manager.update_attributes(params[:manager])
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager = Manager.find(params[:id])
    @manager.destroy

    respond_to do |format|
      format.html { redirect_to managers_url }
      format.json { head :no_content }
    end
  end
end
