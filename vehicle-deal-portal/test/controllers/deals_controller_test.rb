require "test_helper"

class DealsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deal = deals(:one)
  end

  test "should get index" do
    get deals_url
    assert_response :success
  end

  test "should get new" do
    get new_deal_url
    assert_response :success
  end

  test "should create deal" do
    assert_difference("Deal.count") do
      post deals_url, params: { deal: { contact_number: @deal.contact_number, customer_name: @deal.customer_name, deal_date: @deal.deal_date, deal_number: @deal.deal_number, estimated_delivery_date: @deal.estimated_delivery_date, has_trade: @deal.has_trade, notes: @deal.notes, salesperson: @deal.salesperson, status: @deal.status, stock_number: @deal.stock_number, vehicle_purchased: @deal.vehicle_purchased, vehicle_type: @deal.vehicle_type } }
    end

    assert_redirected_to deal_url(Deal.last)
  end

  test "should show deal" do
    get deal_url(@deal)
    assert_response :success
  end

  test "should get edit" do
    get edit_deal_url(@deal)
    assert_response :success
  end

  test "should update deal" do
    patch deal_url(@deal), params: { deal: { contact_number: @deal.contact_number, customer_name: @deal.customer_name, deal_date: @deal.deal_date, deal_number: @deal.deal_number, estimated_delivery_date: @deal.estimated_delivery_date, has_trade: @deal.has_trade, notes: @deal.notes, salesperson: @deal.salesperson, status: @deal.status, stock_number: @deal.stock_number, vehicle_purchased: @deal.vehicle_purchased, vehicle_type: @deal.vehicle_type } }
    assert_redirected_to deal_url(@deal)
  end

  test "should destroy deal" do
    assert_difference("Deal.count", -1) do
      delete deal_url(@deal)
    end

    assert_redirected_to deals_url
  end
end
