class CreateSavings < ActiveRecord::Migration[6.0]
  def change
    create_table :savings do |t|
      t.string :name
      t.string :total_price
      t.string :total_saved

      t.timestamps
    end
  end
end
