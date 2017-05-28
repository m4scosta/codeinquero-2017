class CreatePrizesUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes_users, id: false do |t|
      t.belongs_to :prize
      t.belongs_to :user

      t.timestamps
    end
  end
end
