class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :cart_items, dependent: :destroy
  belongs_to :customer, optional: true
  has_many :order_details, dependent: :destroy
end
