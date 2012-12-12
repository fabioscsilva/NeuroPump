# Caso estiverem a ter problemas com este código, substituam as permissões por "can :manage, :all"
  # EX: if login.has_role? :manager
  #       can :manage, :all
  #     end


class Ability
  include CanCan::Ability

  def initialize(login)
    
    login ||= Login.new 
    # The patient can only RU its own personal information
    if login.has_role? :patient
      can [:show, :edit, :update], Patient do |patient|
        patient.login.email == login.email
      end
    # The neuropsychologist is able to RU/List all patients' data and RU its own information
    elsif login.has_role? :neuropsychologist
      can [:index, :show, :edit, :update], Patient
      can [:show, :edit, :update], Neuropsychologist do |neuropsychologist|
        neuropsychologist.login.email == login.email
      end
    # The secretary is able to CRU patients, Read/List neuropsychologists and RU its own information
    elsif login.has_role? :secretary
      can :manage, Patient
      can [:index, :show], Neuropsychologist
      can [:show, :edit, :update], Secretary do |secretary|
        secretary.login.email == login.email
      end 
    # The manager is able to CRU/List both neuropsychologists and secretaries
    elsif login.has_role? :manager
      can :manage, Neuropsychologist 
      can :manage, Secretary 
      can :manage, Manager 
      can :manage, Clinic # !! Para já manager pode alterar clínicas, estou a corrigir isto.
    # The administrator is able to CRU both clinics and managers
    elsif login.has_role? :administrator
      can :manage, Clinic
      can :manage, Manager
    end

  end
end