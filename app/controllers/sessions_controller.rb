class SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Login) && resource.deleted_at && resource.clinic_id.deleted_at
      sign_out resource
      flash[:error] = "Esta conta foi bloqueada."
      root_path
    else
      super
    end
  end

end