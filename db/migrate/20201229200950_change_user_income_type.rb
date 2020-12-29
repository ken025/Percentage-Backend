class ChangeUserIncomeType < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.change :income, :float
    end 
  end
end
