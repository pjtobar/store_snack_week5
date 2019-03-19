require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # fixtures :categories, :products, :users, :roles
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
  end

  test 'should get index' do
    get products_url
    assert_response :success
  end

  test 'should get new if user is admin' do
    sign_in users(:one)
    get new_product_url
    assert_response :success
  end

  test 'should get index if user is client' do
    sign_in users(:two)
    get new_product_url
    assert_redirected_to products_url
  end

  test 'should create product if user is admin' do
    sign_in users(:one)
    assert_difference('Product.count') do
      post products_url, params: {product: @product_test}
    end
  end

  test 'should get index id action create if user is client' do
    sign_in users(:two)
    assert_no_difference('Product.count') do
      post products_url, params: {product: @product_test}
    end
    assert_redirected_to products_url
  end

  test 'should show product' do
    get product_url(@product)
    assert_response :success
  end

  test 'should get edit product' do
    sign_in users(:one)
    get edit_product_url(@product)
    assert_response :success
  end

  test 'should get index in action edit if user is client' do
    sign_in users(:two)
    get edit_product_url(@product)
    assert_redirected_to products_path
  end

  test 'should update product' do
    sign_in users(:one)
    patch product_url(@product), params: {product: @product_test}
    @product.reload
    assert_equal 'productest', @product.name
    assert_redirected_to products_path
  end

  test 'should get index in action update if user is client' do
    sign_in users(:two)
    patch product_url(@product), params: {product: @product_test}
    assert_redirected_to products_path
  end

  test 'should destroy product' do
    sign_in users(:one)
    delete product_url(@product)
    @product.reload
    assert_equal 0, @product.state
    assert_redirected_to products_url
  end

  test 'should get index in action destroy if user is client' do
    sign_in users(:two)
    delete product_url(@product)
    assert_redirected_to products_url
  end




end
