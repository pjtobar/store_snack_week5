require 'test_helper'

class DetailsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @product = products(:one)
    @category = categories(:one)
    @product_test = {
      name: 'productest',
      price: 15.25,
      stock: 25,
      sku: 'abcd1230',
      category_id: @category.id,
      state: 0
    }
    @detail_product_exits = {
      product_id: 298486374,
      quantity: 5
    }
    @detail_product_no_exits = {
      product_id: 980190962,
      quantity: 5
    }

    # @purchase = purchases(:one)
    # @detail = details(:one)
  end

  test 'should no create detail if product exits in details' do
    sign_in users(:two)
    assert_no_difference('Detail.count') do
      post details_url, params: {detail: @detail_product_exits}
    end
    # @detail.reload
    # assert_equal 10, @detail.quantity
  end

    test 'should create detail if product does not exits in details' do
      sign_in users(:two)
      assert_difference('Detail.count') do
        post details_url, params: {detail: @detail_product_no_exits}
      end
      # @detail.reload
      # assert_equal 10, @detail.quantity
    end
end
