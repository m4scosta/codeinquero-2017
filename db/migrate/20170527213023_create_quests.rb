class CreateQuests < ActiveRecord::Migration[5.0]
  def change
    create_table :quests do |t|
      t.belongs_to :created_by, :user, index: true
      t.string :description
      t.string :icon
      t.integer :reward_points
      t.integer :max_participants
      t.boolean :available

      t.timestamps
    end
  end
end
