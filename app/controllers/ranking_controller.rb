class RankingController < ApplicationController
  def index
    @ranking = User.most_rewarded_first
  end
end
