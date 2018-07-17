class RemoveSizeIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :size_id, :integer
  end
end
