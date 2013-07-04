class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :email, :password, :username, :admin, :current_password, :first_name, :last_name, :password_confirmation)
  end
  private :resource_params
end
