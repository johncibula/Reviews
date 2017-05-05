# sessions_controller.rb
class SessionsController < ApplicationController
  def create
    if current_user
      redirect_to root_url, :notice => "Signed in!"
    end
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end

  def new

  end

  def destroy
    session[:user_id] = nil
    redirect_to action: 'new'
  end

end




