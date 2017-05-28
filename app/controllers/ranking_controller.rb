class RankingController < ApplicationController
  before_action :authorize

  def index
    @ranking = User.most_rewarded_first
  end
end
