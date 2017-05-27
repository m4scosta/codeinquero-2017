class CreateRewardingUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :rewarding_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :user_reward, index: true
      t.integer :points
      t.boolean :started

      t.timestamps
    end
  end
end
