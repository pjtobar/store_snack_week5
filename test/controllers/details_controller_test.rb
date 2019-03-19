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
    @detail_product_exists = {
      product_id: 298486374,
      quantity: 5
    }
    @detail_product_no_exists = {
      product_id: 980190962,
      quantity: 5
    }

    # @purchase = purchases(:one)
    @detail = details(:two)
  end

  test 'should no create detail if product exists in details' do
    sign_in users(:two)
    assert_no_difference('Detail.count') do
      post details_url, params: {detail: @detail_product_exists}
    end
    assert_redirected_to products_path
  end

    test 'should create detail if product does not exists in details' do
      sign_in users(:two)
      assert_difference('Detail.count') do
        post details_url, params: {detail: @detail_product_no_exists}
      end
      assert_redirected_to products_path
    end

    test 'should show detail if user is client' do
      sign_in users(:two)
      get detail_url(@product)
      assert_response :success
    end

    test 'should not show detail if user is admin' do
      sign_in users(:one)
      get detail_url(@product)
      assert_redirected_to products_path
    end

    test 'should increase quantity when product exists' do
      sign_in users(:two)
      post details_url, params: {detail: @detail_product_exists}
      @detail.reload
      assert_equal 10, @detail.quantity
      assert_redirected_to products_url
    end
end
