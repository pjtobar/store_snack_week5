module API
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      test 'should be success' do
        post api_v1_sessions_path, params: { email: 'pablo.tobar711@gmail.com', password: 'pabloth' }
        resp = response.headers['token']
        get api_v1_users_path, headers: { 'token' => resp }
        assert_response 302
      end

      test 'should be unauthorized' do
        resp = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTI1MDk0ODN9.eP1zMdwv3CRvTHzCB13WjIvbPQrwEeV_6ZX8xU9uhyw'
        get api_v1_users_path, headers: { 'token' => resp }
        assert_response 401
      end

      test 'should be  user not found' do
        resp = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1NTMwMTI0Mjd9.JUg2KPXbEXTQFxNw1N2FUe94LI52sIU4xDi61skxep0'
        get api_v1_users_path, headers: { 'token' => resp }
        assert_response 409
      end
    end
  end
end
