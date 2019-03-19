module API
  module V1
    class ProductsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @product = products(:one)
        @search = { name: 'MyString' }
      end

      test 'should index' do
        get api_v1_products_path
        assert_response 200
      end

      test 'should sort by name should' do
        get api_v1_products_path, params: {search: {name: 'Boston'}}
        assert_response 200
      end

    end
  end
end
