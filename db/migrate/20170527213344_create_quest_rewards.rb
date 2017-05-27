class CreateQuestRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :quest_rewards do |t|
      t.belongs_to :quest, index: true
      t.belongs_to :rewarded_user, :user, index: true
      t.integer :points

      t.timestamps
    end
  end
end
