class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.string :name
      t.float :total_price
      t.float :total_saved

      t.timestamps
    end
  end
end
