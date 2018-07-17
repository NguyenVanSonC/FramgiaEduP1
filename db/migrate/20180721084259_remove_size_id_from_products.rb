class RemoveSizeIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :size_id, foreign_key: true
  end
end
