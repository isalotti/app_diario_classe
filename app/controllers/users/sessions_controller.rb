# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  #ISBG
   def new
     super
     render :json=>{:id => current_user.id}.to_json
   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #  devise_parameter_sanitizer.permit(:sign_in, keys: [:matricula, :nome])
  #end

  #def configure_sign_up_params
  #    devise_parameter_sanitizer.permit(:sign_up, keys: [:matricula, :nome])
  #end
end
