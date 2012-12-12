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
end
