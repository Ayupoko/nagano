class OrderDetail < ApplicationRecord
  enum making_status: { unable: 0, waiting: 1, making: 2, conplete: 3 }
  belongs_to :order
  belongs_to :item
end