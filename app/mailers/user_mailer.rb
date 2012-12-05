class UserMailer < ActionMailer::Base
  default from: "brunomiguelas@gmail.com"

  def send_email_neuropsychologists(email)
    mail( :to => email,
          :subject => "[NeuroPump] Faca o Registo na nossa plataforma",
    )
  end

  def send_email_secretaries(email)
    mail( :to => email,
          :subject => "[NeuroPump] Faca o Registo na nossa plataforma",
    )
  end
end
