class AddLToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :l, :integer
  end
end
