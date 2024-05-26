# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    puts "=========params#{params.inspect}"
    @user = User.find_by(email: params[:user][:email]) || User.find_by(username: params[:user][:email])
   puts("-----id----------#{@user&.id}")
    if @user&.valid_password?(params[:user][:password])
      # puts "=======user#{@user.inspect}"
      sign_in(@user)
      redirect_to root_path
    else
      flash[:alert] = "Invalid Username/email or password."
      redirect_to new_user_session_path
    end
  end

  # DELETE /resource/sign_out
  def destroy
    session.clear
    # sign_out(current_user)
    redirect_to root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
  end
end
