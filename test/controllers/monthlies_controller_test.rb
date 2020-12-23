require 'test_helper'

class MonthliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @monthly = monthlies(:one)
  end

  test "should get index" do
    get monthlies_url, as: :json
    assert_response :success
  end

  test "should create monthly" do
    assert_difference('Monthly.count') do
      post monthlies_url, params: { monthly: { date: @monthly.date, user_id: @monthly.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show monthly" do
    get monthly_url(@monthly), as: :json
    assert_response :success
  end

  test "should update monthly" do
    patch monthly_url(@monthly), params: { monthly: { date: @monthly.date, user_id: @monthly.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy monthly" do
    assert_difference('Monthly.count', -1) do
      delete monthly_url(@monthly), as: :json
    end

    assert_response 204
  end
end
