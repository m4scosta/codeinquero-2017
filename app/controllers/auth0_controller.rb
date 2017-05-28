class Auth0Controller < ApplicationController
  # This stores all the user information that came from Auth0
  # and the IdP
  def callback
    session[:userinfo] = request.env['omniauth.auth']
    client_id = session[:userinfo].extra.raw_info.client_id

    unless User.find_by(client_id: client_id).present?
      info = session[:userinfo].info
      User.create(name: info.name, email: info.email, image: info.image,
                  client_id: client_id)
    end

    # Redirect to the URL you want after successful auth
    redirect_to '/dashboard'
  end

  # This handles authentication failures
  def failure
    @error_type = request.params['error_type']
    @error_msg = request.params['error_msg']
    raise
  end
end
