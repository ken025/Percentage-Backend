class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :bill_name
      t.string :price
      t.preferences :monthly

      t.timestamps
    end
  end
end
