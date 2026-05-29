class ReportsController < ApplicationController
  def deal_summary
    current_month = Date.current.beginning_of_month..Date.current.end_of_month

    @total_this_month = Deal.where(deal_date: current_month).count
    @pending_deals = Deal.where(status: Deal::PENDING_STATUSES)
    @finalised_deals = Deal.where(status: Deal::FINAL_STATUSES)
    @fallovers = Deal.where(status: "Fallover")
    @delayed_deals = Deal.all.select(&:delayed?)
  end
end
