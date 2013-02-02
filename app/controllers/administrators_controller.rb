class AdministratorsController < ApplicationController
  before_filter :authenticate_login!
  load_and_authorize_resource
  # GET /administrators
  # GET /administrators.json
  def index
    @administrators = Administrator.all
    
    
    # Packages Chart
    packages= Package.all
    
    @packagesArray = Array.new
    
    packagesNames = Array.new
    packagesNames.push("")
    packagesCount = Array.new
    packagesCount.push("")
    
    packages.each do |package|
      packagesNames.push(package.name)
      
      packCount = Package.joins(:packages_clinics).select("COUNT(*) as count").where("packages.name = '" + package.name + "'")
      
      packagesCount.push(Integer(packCount.first.count))
    end
    
    @packagesArray.push(packagesNames)
    @packagesArray.push(packagesCount)
    
    
    # Montlhy Revenue Graph
    truncateClause = "DATE_TRUNC('month', payment_date)"
    selectClause = "TO_CHAR(" + truncateClause + ", 'YYYY/MM') as date, SUM(value) as sum"
    revenue = Payment.select(selectClause).where("payment_date IS NOT NULL").group(truncateClause).order(truncateClause)
    
    @revenueArray = Array.new
    @revenueArray.push(["Data", "Valor (euros)"])    
    revenue.each do |value|
      @revenueArray.push([value.date, Float(value.sum)])
    end
    
    #
    months = Hash.new
    months[1] = "Jan"
    months[2] = "Fev"
    months[3] = "Mar"
    months[4] = "Abr"
    months[5] = "Mai"
    months[6] = "Jun"
    months[7] = "Jul"
    months[8] = "Ago"
    months[9] = "Set"
    months[10] = "Out"
    months[11] = "Nov"
    months[12] = "Dez"
    
    @clinicsArray = Array.new
    headerTemp = Array.new
    headerTemp.push("Mes do Ano")
    packages.each do |package|
      headerTemp.push(package.name)
    end
    
    @clinicsArray.push(headerTemp)
    
    year = Time.new.year
    initialMonth = (Time.new.month % 12) + 1
    currentMonth = initialMonth
    
    if initialMonth != 1
      year = year - 1
    end
    
    
    for i in 1..12
      if initialMonth != 1 && currentMonth == 1
        year = year + 1
      end
      
      
      clinicTemp = Array.new
      clinicTemp.push(months[currentMonth].to_s + "/" + year.to_s[2..3])
      
      packages.each do |package|
        nClinics = PackagesClinic.select("COUNT(*) as count").joins(:package).where("date_part('month', start_date) <= " + currentMonth.to_s + " AND date_part('year', start_date) <= " + year.to_s + " AND packages.name = '" + package.name + "'")
        
        clinicTemp.push(Integer(nClinics.first.count))
      end
      
      @clinicsArray.push(clinicTemp)

      currentMonth = (currentMonth % 12) + 1
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @administrators }
    end
  end

  # GET /administrators/1
  # GET /administrators/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @administrator }
    end
  end

  # GET /administrators/new
  # GET /administrators/new.json
  def new
    @administrator = Administrator.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @administrator }
    end
  end

  # GET /administrators/1/edit
  def edit

  end

  # POST /administrators
  # POST /administrators.json
  def create
    @administrator = Administrator.new(params[:administrator])

    respond_to do |format|
      if @administrator.save
        format.html { redirect_to @administrator, notice: 'Administrator was successfully created.' }
        format.json { render json: @administrator, status: :created, location: @administrator }
      else
        format.html { render action: "new" }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /administrators/1
  # PUT /administrators/1.json
  def update
    respond_to do |format|
      if @administrator.update_attributes(params[:administrator])
        format.html { redirect_to @administrator, notice: 'Administrator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @administrator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrators/1
  # DELETE /administrators/1.json
  def destroy
    @administrator.destroy

    respond_to do |format|
      format.html { redirect_to administrators_url }
      format.json { head :no_content }
    end
  end
end
