module API
  module V1
    class SessionsController < ApplicationController
      SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
      skip_before_action :verify_authenticity_token

      def create
        @user = User.find_by(email: params[:email])

        if @user&.valid_password?(params[:password])
          token = JWT.encode(
            {user_id: @user.id, exp: (Time.now + 2.weeks).to_i},
            SECRET_KEY,'HS256'
          )
          render json: {status: 'SUCCESS', message: 'Valid User', token: token}, status: :ok
        else
          render json: {status: 'INVALID', message: 'Invalid User'}, status: :unauthorized
        end
      end

      def index
        puts SECRET_KEY
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
        # if user

        # else

        # end
      end
    end
  end
end
