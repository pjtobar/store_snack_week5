require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @product = products(:two)
    @product_destroy = products(:one)
    @category = categories(:one)
    @product_test = {
      name: 'productest',
      price: 15.25,
      stock: 25,
      sku: 'abcd1230',
      category_id: @category.id,
      state: 0
    }
  end

  test 'should create like' do
    sign_in users(:one)
    assert_difference('Like.count') do
      post likes_url, params: {like: {product_id: @product.id}}
    end
    assert_redirected_to products_url
  end

  test 'should destroy like' do
    sign_in users(:one)
    assert_difference('Like.count', -1) do
      post likes_url, params: {like: {product_id: @product_destroy.id}}
    end
    assert_redirected_to products_url
  end
end
