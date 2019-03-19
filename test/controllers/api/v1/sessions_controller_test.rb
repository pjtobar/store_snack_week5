module API
  module V1
    class SessionsControllerTest < ActionDispatch::IntegrationTest
      test 'should be success login' do
        post api_v1_sessions_path, params: { email: 'example2@gmail.com', password: 12346789 }
        assert_response 200
      end

      test 'should not be found user' do
        post api_v1_sessions_path, params: { email: 'exampleFalse@gmail.com', password: 12367853 }
        assert_response 401
      end
    end
  end
end
