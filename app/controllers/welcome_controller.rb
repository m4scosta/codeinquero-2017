class WelcomeController < ApplicationController

  def index
    render json: { test: 'ok' }
  end
end
