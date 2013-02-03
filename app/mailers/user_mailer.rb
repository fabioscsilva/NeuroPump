class UserMailer < ActionMailer::Base
  default from: "support@neuropump.com"

  def send_email_neuropsychologists(email,id,c_id)
    @login_id = id
    @clinic_id = c_id
    mail( :to => email,
          :subject => "[NeuroPump] Faca o Registo na nossa plataforma",
    )
  end

  def send_email_secretaries(email,id,c_id)
    @login_id = id
    @clinic_id = c_id
    mail( :to => email,
          :subject => "[NeuroPump] Faca o Registo na nossa plataforma",
    )
  end

  def send_email_paciente(email,pass)
    @password = pass
    mail( :to => email,
          :subject => "[NeuroPump] Bem-vindo ao NeuroPump",
    )
  end

  def send_email_resetpw(email,pass)
    @password = pass
    mail( :to => email,
           :subject => "[NeuroPump] E-mail de recuperacao de password",
    )
  end

  def send_email_manager(email,pass,clinicName,ref,ent,price)
    @password = pass
    @cName = clinicName
    @reference = ref
    @price = price
    @entity = ent
    @emailM = email
    mail( :to => email,
          :subject => "[NeuroPump] Bem-vindo ao NeuroPump",
      )
  end

  def send_email_managerUpdate(email,clinicName,ref,ent,price)
    @cName = clinicName
    @reference = ref
    @price = price
    @entity = ent
    @emailM = email
    mail( :to => email,:subject => "[NeuroPump] Pacote mudado no NeuroPump")
  end
end
