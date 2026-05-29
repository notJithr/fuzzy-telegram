require "application_system_test_case"

class DealsTest < ApplicationSystemTestCase
  setup do
    @deal = deals(:one)
  end

  test "visiting the index" do
    visit deals_url
    assert_selector "h1", text: "Deals"
  end

  test "should create deal" do
    visit deals_url
    click_on "New deal"

    fill_in "Contact number", with: @deal.contact_number
    fill_in "Customer name", with: @deal.customer_name
    fill_in "Deal date", with: @deal.deal_date
    fill_in "Deal number", with: @deal.deal_number
    fill_in "Estimated delivery date", with: @deal.estimated_delivery_date
    check "Has trade" if @deal.has_trade
    fill_in "Notes", with: @deal.notes
    fill_in "Salesperson", with: @deal.salesperson
    fill_in "Status", with: @deal.status
    fill_in "Stock number", with: @deal.stock_number
    fill_in "Vehicle purchased", with: @deal.vehicle_purchased
    fill_in "Vehicle type", with: @deal.vehicle_type
    click_on "Create Deal"

    assert_text "Deal was successfully created"
    click_on "Back"
  end

  test "should update Deal" do
    visit deal_url(@deal)
    click_on "Edit this deal", match: :first

    fill_in "Contact number", with: @deal.contact_number
    fill_in "Customer name", with: @deal.customer_name
    fill_in "Deal date", with: @deal.deal_date
    fill_in "Deal number", with: @deal.deal_number
    fill_in "Estimated delivery date", with: @deal.estimated_delivery_date
    check "Has trade" if @deal.has_trade
    fill_in "Notes", with: @deal.notes
    fill_in "Salesperson", with: @deal.salesperson
    fill_in "Status", with: @deal.status
    fill_in "Stock number", with: @deal.stock_number
    fill_in "Vehicle purchased", with: @deal.vehicle_purchased
    fill_in "Vehicle type", with: @deal.vehicle_type
    click_on "Update Deal"

    assert_text "Deal was successfully updated"
    click_on "Back"
  end

  test "should destroy Deal" do
    visit deal_url(@deal)
    click_on "Destroy this deal", match: :first

    assert_text "Deal was successfully destroyed"
  end
end
