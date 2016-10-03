class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:nombrep, :apellido , :email, :password, :password_confirmation, :nombreu, :permisos )
  end

  def account_update_params
    params.require(:user).permit(:nombrep, :apellido , :email, :password, :password_confirmation, :nombreu, :permisos, :current_password)
  end
end
