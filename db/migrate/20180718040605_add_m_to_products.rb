class AddMToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :m, :integer
  end
end
