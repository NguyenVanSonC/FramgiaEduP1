class Supplier < ApplicationRecord
  has_many :products
  scope :search, ->(search){where "suppliers.name like ? ", "%#{search}%"}
end
