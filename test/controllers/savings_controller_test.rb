require 'test_helper'

class SavingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saving = savings(:one)
  end

  test "should get index" do
    get savings_url, as: :json
    assert_response :success
  end

  test "should create saving" do
    assert_difference('Saving.count') do
      post savings_url, params: { saving: { name: @saving.name, total_price: @saving.total_price, total_saved: @saving.total_saved, user_id: @saving.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show saving" do
    get saving_url(@saving), as: :json
    assert_response :success
  end

  test "should update saving" do
    patch saving_url(@saving), params: { saving: { name: @saving.name, total_price: @saving.total_price, total_saved: @saving.total_saved, user_id: @saving.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy saving" do
    assert_difference('Saving.count', -1) do
      delete saving_url(@saving), as: :json
    end

    assert_response 204
  end
end
