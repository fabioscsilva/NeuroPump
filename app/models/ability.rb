# Caso estiverem a ter problemas com este código, substituam as permissões por "can :manage, :all"
  # EX: if login.has_role? :manager
  #       can :manage, :all
  #     end


class Ability
  include CanCan::Ability

  def initialize(login)
    
    login ||= Login.new 
    # O paciente só pode ver/editar a própria informação
    if login.has_role? :patient
      can [:show, :edit, :update, :games, :stimulation], Patient do |patient|
        patient.login.email == login.email
      end

    # O neuropsicólogo pode ver/editar os pacientes da clínica e ver/editar o seu perfil
    elsif login.has_role? :neuropsychologist
      can [:index, :show, :edit, :update], Patient do |patient|
        patient.clinic_id == login.neuropsychologists.first.clinic_id
      end
      can :manage, Appointment do |appointment|
        appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :new, AppointmentPlan
      can [:edit,:update,:destroy], AppointmentPlan do |appointment_plans|
        appointment_plans.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, ClockResult do |clock_results|
        clock_results.appointment_plan.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, FttResult do |ftt_results|
        ftt_results.appointment_plan.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, TmtResult do |tnt_results|
        tmt_results.appointment_plan.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, WaisResult do |wais_results|
        wais_results.appointment_plan.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, WmsResult do |wms_results|
        wms_results.appointment_plan.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can :manage, EvaluationResult do |eva_results|
        eva_results.appointment.neuropsychologist_id == login.neuropsychologists.first.id
      end
      can [:show, :edit, :update], Neuropsychologist do |neuropsychologist|
        neuropsychologist.login.email == login.email
      end

    # A secretária pode fazer manage dos clientes da própria clínica, ver psicólogos da própria clínica e editar o seu perfil
    elsif login.has_role? :secretary
      can [:new, :create], Patient
      can [:index, :show, :edit, :update], Patient do |patient|
        patient.clinic_id == login.secretaries.first.clinic_id
      end
      can :manage, Appointment do |appointment|
        appointment.secretary_id == login.secretaries.first.id
      end
      can [:index, :show], Neuropsychologist do |neuropsychologist|
        neuropsychologist.clinic_id == login.secretaries.first.clinic_id
      end
      can [:show, :edit, :update], Secretary do |secretary|
        secretary.login.email == login.email
      end 

    # O manager por fazer manage de neuropsicólogos/secretárias da própria clínica e ver/editar o seu perfil e a sua clínica
    elsif login.has_role? :manager
      can :manage, Appointment
      can :manage, Package
      cannot :create, Package
      can :manage, PackagesClinic do |packages_clinic|
        packages_clinic.clinic_id == login.clinic_id
      end
      can :manage, Neuropsychologist do |neuropsychologist|
        neuropsychologist.clinic_id == login.managers.first.clinic_id
      end
      can :manage, Secretary do |secretary|
        secretary.clinic_id == login.managers.first.clinic_id
      end
      can :manage, Manager
      can :show, Payment
      cannot :create, Manager # Não pode 
      can [:show, :edit, :update, :changePackage], Clinic do |clinic|
        clinic.id == login.managers.first.clinic_id
      end

    # O administrador pode fazer manage de clínicas e managers
    elsif login.has_role? :administrator
      can :manage, Payment
      can :manage, Clinic
      can :manage, Manager
      can :manage, Package
      can :manage, PackagesClinic
      can :manage, Payment
      can :index, Administrator
    end

  end
end