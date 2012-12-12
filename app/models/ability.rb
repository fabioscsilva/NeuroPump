class Ability
  include CanCan::Ability

  def initialize(login)
    #
    login ||= Login.new 
    if login.has_role? :manager
      can :manage, :all
    elsif login.has_role? :secretary
      can :manage, :all
    elsif login.has_role? :neuropsychologist
      can :read, :all
    elsif login.has_role? :administrator
      can :manage, :all
    elsif login.has_role? :patient
      can [:edit, :update, :show], :all, :email => login.email
    end


  end
end
