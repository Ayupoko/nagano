class CreateOrders < ActiveRecord::Migration[5.2]
  def change

    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :name
      t.string :address
      t.integer :fee
      t.integer :total_payment
      t.integer :payment_method
      t.integer :status
      t.datetime :remember_created_at
      t.datetime :remember_updated_at
       t.timestamps
    end
  end
end
