class Product < ApplicationRecord
  belongs_to :supplier
  belongs_to :category
  scope :order_cost, ->{order "products.cost DESC"}
  scope :search, ->(search) do
    where "name like ? OR status like ? ", "%#{search}%", "%#{search}%"
  end
  scope :search_bysupplier, ->(search){joins(:supplier).merge(Supplier.search(search))}
  scope :newest, ->{order created_at: :desc}
  scope :min_max_cost, ->(min, max){where "cost >= ? AND cost <= ?", min, max}
  scope :by_category, ->(cate_id){where category_id: cate_id}

  delegate :name, to: :supplier, prefix: :supplier
end
