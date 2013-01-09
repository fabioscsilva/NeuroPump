class PaymentsController < ApplicationController
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all

    if current_login.has_role? :administrator
      @payments = Payment.find_by_sql('select *
from Payments p, (select clinic_id, max(due_date) as d from payments group by clinic_id) s
where p.clinic_id = s.clinic_id and p.due_date = s.d order by payed')


      
    elsif current_login.has_role? :manager
      logged_user = Manager.first(:conditions => "login_id = #{current_login.id}")
      @payments = Payment.in_clinic(logged_user.clinic.id).all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @payments }
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @payment }
    end
  end

  # Método que simula uma atualização do estado dos pagamentos gerados
  def check
    payments = Payment.where("payed" => false);
    payments.each do |p|
      if p.id.odd? 
        p.payed = true;
        p.update;
      end
    end

    respond_to do |format|
      format.html { redirect_to clinics_url }
      format.json { render json: @payment }
    end
  end

  # GET /payments/new
  # GET /payments/new.json
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @payment }
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  # POST /payments.json
  def create
    
    clinic_id = params[:payment].delete(:clinic_id)
    @payment = Payment.new(params[:payment])
    @payment.clinic_id = clinic_id

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /payments/1
  # PUT /payments/1.json
  def update
    clinic_id = params[:payment].delete(:clinic_id)
    @payment = Payment.find(params[:id])
    @payment.clinic_id = clinic_id
    
    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end
end
