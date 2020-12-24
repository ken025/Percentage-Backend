class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :bill_name
      t.string :price
      t.references :monthly, null: false, foreign_key: true

      t.timestamps
    end
  end
end
