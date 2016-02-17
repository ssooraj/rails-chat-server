class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def create
    p auth_hash
    @user = User.find_or_create_from_auth_hash(auth_hash)
    cookies.signed[:user_id] = @user.id
    redirect_to '/'
  end

  def destroy
    cookies.signed[:user_id] = nil
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end