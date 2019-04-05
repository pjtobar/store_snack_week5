module API
  module V1
    class UsersController < ApplicationController
      SECRET_KEY = '0ef0a696-67a1-4987-83e4-4cbc3d0c20e8' # this is wrong in so many levels
      skip_before_action :verify_authenticity_token

      def index
        token = request.headers["token"]
        begin
          decoded_token = JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
          user = User.find(decoded_token[0]['user_id'])
          render json: {status: 'FOUND', message: 'User found', user: user}, status: :found
        rescue ActiveRecord::RecordNotFound
          render json: {status: 'NOT FOUND', message: 'User not found'}, status: :not_found
        rescue JWT::VerificationError
          render json: {status: 'UNAUTHORIZED', message: 'Signature has expired'}, status: :unauthorized
        rescue StandardError
          render json: {status: 'NOT FOUND', message: 'User not found'}, status: :conflict
        end
      end
    end
  end
end
