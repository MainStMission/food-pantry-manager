class Users::PasswordsController < Devise::PasswordsController
  def resource_params
    params.require(:user).permit(:email, :password,:username, :admin, :password_confirmation)
  end
  private :resource_params
end
