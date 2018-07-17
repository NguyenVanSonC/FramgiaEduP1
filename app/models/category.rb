class Category < ApplicationRecord
  has_many :products
  scope :recent, ->{order "categories.name DESC"}
end
