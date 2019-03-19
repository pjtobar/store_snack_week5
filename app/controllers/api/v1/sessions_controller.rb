module API
  module V1
    class SessionsController < ApplicationController
      SECRET_KEY = '0ef0a696-67a1-4987-83e4-4cbc3d0c20e8'
      skip_before_action :verify_authenticity_token

      def create
        @user = User.find_by(email: params[:email])

        if @user&.valid_password?(params[:password])
          token = JWT.encode(
            {user_id: @user.id, exp: (Time.now + 2.seconds).to_i},
            SECRET_KEY,'HS256'
          )
          render json: {status: 'SUCCESS', message: 'Valid User', token: token}, status: :ok
          response.headers['token'] = token
        else
          render json: {status: 'INVALID', message: 'Invalid User'}, status: :unauthorized
        end
      end
    end
  end
end
