class Deal < ApplicationRecord
  has_many_attached :documents

  STATUSES = [
    "Bank Transfer",
    "Pending Finance",
    "Finance Approved",
    "Finance Settled",
    "EDD Set",
    "Paper Delivered",
    "Delivered",
    "Paid",
    "Fallover"
  ]

  PENDING_STATUSES = [
    "Bank Transfer",
    "Pending Finance",
    "Finance Approved",
    "Finance Settled",
    "EDD Set"
  ]

  FINAL_STATUSES = [
    "Paper Delivered",
    "Delivered",
    "Paid",
    "Fallover"
  ]

  validates :deal_date, :deal_number, :stock_number, :customer_name, :vehicle_purchased, :status, presence: true

  def pending?
    PENDING_STATUSES.include?(status)
  end

  def delayed?
    pending? && deal_date.present? && deal_date < 7.days.ago.to_date
  end
end
