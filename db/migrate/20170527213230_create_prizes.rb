class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.string :name
      t.string :image
      t.integer :cost
      t.integer :quantity

      t.timestamps
    end
  end
end
