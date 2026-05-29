require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get deal_summary" do
    get reports_deal_summary_url
    assert_response :success
  end
end
