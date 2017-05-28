class WelcomeController < ApplicationController

  def index
    redirect_to home_path if current_user.present?
  end

  def log_in
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      cookies.signed[:id] = user.id
      redirect_to home_path and return
    end

    uparams = user_params.merge!({available_points: 0, received_points: 0, points_to_give: 100})
    user = User.new(uparams.symbolize_keys)
    if user.save
      cookies.signed[:id] = user.id
      redirect_to home_path and return
    else
      # login fails
      flash[:error] = 'Erro no login'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
