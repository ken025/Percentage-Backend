class AddKindToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :kind, :string
  end
end
