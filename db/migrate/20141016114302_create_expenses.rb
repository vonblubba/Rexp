class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.text :description
      t.decimal :amount, precision:8, scale:2

      t.timestamps
    end
  end
end
