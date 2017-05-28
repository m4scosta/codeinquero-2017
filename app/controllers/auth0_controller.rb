class Auth0Controller < ApplicationController
  # This stores all the user information that came from Auth0
  # and the IdP

  skip_before_action :verify_authenticity_token, :authenticate_user!

  def callback
    session[:userinfo] = request.env['omniauth.auth']
    client_id = session[:userinfo].extra.raw_info.clientID

    unless User.find_by(client_id: client_id).present?
      info = session[:userinfo].info
      User.create(name: info.name, email: info.email, image: info.image,
                  client_id: client_id, available_points: 0, received_points: 0,
                  points_to_give: 100)
    end

    # Redirect to the URL you want after successful auth
    redirect_to home_path
  end

  # This handles authentication failures
  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['error_msg']
    raise
  end
end
