json.extract! deal, :id, :deal_date, :deal_number, :stock_number, :salesperson, :vehicle_type, :customer_name, :vehicle_purchased, :has_trade, :contact_number, :status, :estimated_delivery_date, :notes, :created_at, :updated_at
json.url deal_url(deal, format: :json)
