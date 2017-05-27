class CreateUserRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_rewards do |t|
      t.text :description
      t.belongs_to :rewarded_user, :user, index: true

      t.timestamps
    end
  end
end
