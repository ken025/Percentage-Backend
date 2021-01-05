class ChangeUserIncomeType < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :income, :float
  end
end
