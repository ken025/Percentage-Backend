class CreateMonthlies < ActiveRecord::Migration[6.0]
  def change
    create_table :monthlies do |t|
      t.string :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
