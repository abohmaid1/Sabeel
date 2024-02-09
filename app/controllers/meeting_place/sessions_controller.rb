# frozen_string_literal: true

class MeetingPlace::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  #GET /resource/sign_in
  def new
    @disable_nav = true
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  def after_sign_in_path_for(user)
    meeting_places_index_path
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
