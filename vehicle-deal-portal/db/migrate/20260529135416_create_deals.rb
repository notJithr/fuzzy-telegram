class CreateDeals < ActiveRecord::Migration[7.2]
  def change
    create_table :deals do |t|
      t.date :deal_date
      t.string :deal_number
      t.string :stock_number
      t.string :salesperson
      t.string :vehicle_type
      t.string :customer_name
      t.string :vehicle_purchased
      t.boolean :has_trade
      t.string :contact_number
      t.string :status
      t.date :estimated_delivery_date
      t.text :notes

      t.timestamps
    end
  end
end
