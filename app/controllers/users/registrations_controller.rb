
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :users_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
  @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(users_params)
    if @user .save
      redirect_to root_path
    else
      puts "===========#{@user.errors.full_messages}"
      flash[:alert] = @user.errors.full_messages.join('. ')
      redirect_to new_user_registration_path
    end   
  end

  # GET /resource/edit
  # def edit
  #   @user= User.find(params[:id])
  # end

  # # PUT /resource
  # def update
  #   @user= User.find(params[:id])
  #   if @user.update(users_params)
  #       redirect_to root_path
  #   else
  #       render :edit
  #   end
  # end
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private


  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
