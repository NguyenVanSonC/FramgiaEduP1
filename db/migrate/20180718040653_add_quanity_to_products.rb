class AddQuanityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :quanity, :integer
  end
end
