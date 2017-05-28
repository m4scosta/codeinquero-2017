class QuestController < ApplicationController

  skip_before_action :verify_authenticity_token

  QUEST_ATTRS = %w(icon description reward_points max_participants)

  def create
    quest_params = params.select { |param| QUEST_ATTRS.include? param }
    quest_params[:reward_points] = quest_params[:reward_points].to_i
    quest_params[:max_participants] = quest_params[:max_participants].to_i

    quest_params.merge!({ created_by: current_user, available: true })
    quest = Quest.create!(**quest_params.symbolize_keys)
    render json: quest.to_json
  end
end
