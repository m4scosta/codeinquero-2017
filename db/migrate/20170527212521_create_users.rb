class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :received_points
      t.integer :available_points
      t.integer :points_to_give

      t.timestamps
    end
  end
end
