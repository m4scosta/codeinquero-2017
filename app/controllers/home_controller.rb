class HomeController < ApplicationController
  before_action :authenticate_user!
  include TimelineHelper

  def index

  end
end
