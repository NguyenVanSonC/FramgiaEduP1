class AddChildOfToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :child_of, :integer
  end
end
