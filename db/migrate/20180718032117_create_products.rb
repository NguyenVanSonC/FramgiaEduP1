class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.decimal :cost, precision: 12, scale: 3
      t.string :status
      t.references :supplier, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
