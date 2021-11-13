class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting: 0, confirm: 1, making: 2, prepare: 3, sent: 4 }

  def full_address
    postal_code + address + name
  end
 has_many :order_details, dependent: :destroy
 belongs_to :customer

  validates :payment_method, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
end
