class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  has_many :comments, dependent: :destroy
  scope :order_cost, ->{order "products.cost DESC"}
  scope :search, ->(search) do
    where "name like ? OR status like ?", "%#{search}%", "%#{search}%"
  end
end
