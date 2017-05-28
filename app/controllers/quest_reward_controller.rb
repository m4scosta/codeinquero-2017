class QuestRewardController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    head :bad_request unless params[:quest_id].present? && params[:to_user_id].present?
    quest = Quest.find_by!(created_by: current_user, id: params[:quest_id].to_i)
    to_user = User.find(params[:to_user_id].to_i)
    if quest.reward_user(to_user)
      render json: {}
    else
      head :conflict
    end
  end
end
