class UserRewardController < ApplicationController

  skip_before_action :verify_authenticity_token

  USER_REWARD_ATTRS = %w(description points)

  def create
    to_user = User.find(params[:to_user_id])
    reward_params = params.select { |param| USER_REWARD_ATTRS.include? param }
    reward_params.merge!({
      from: current_user,
      to: to_user
    })
    render json: UserReward.reward(**reward_params.symbolize_keys)
  end

end
