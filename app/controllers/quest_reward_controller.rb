class QuestRewardController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    quest = Quest.find_by!(created_by: current_user, id: params[:quest_id])
    to_user = User.find(params[:to_user_id])
    if quest.reward_user(to_user)
      head :ok
    else
      head :conflict
    end
  rescue
    head :not_found
  end
end
