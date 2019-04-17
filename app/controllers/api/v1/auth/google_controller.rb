# frozen_string_literal: true

module Api
  module V1
    module Auth
      class GoogleController < ApiController
        before_action :init_access_token, only: :authenticate_user
        before_action :authorize_google_user, only: :authenticate_user

        def authenticate_user
          if @google_apis_response['error']
            render json: {}, status: :unauthorized
          else
            update_or_create_user
            render json: @google_apis_response.merge(access_token: @access_token), status: :ok
          end
        end

        private

        def update_or_create_user
          user = User.find_or_create_by(email: @google_apis_response['email']) do |new_user|
            new_user.first_name = @google_apis_response['given_name']
            new_user.last_name = @google_apis_response['family_name']
            new_user.password = 'dummy_password'
          end
          user.update_column(:access_token, @access_token)
        end
      end
    end
  end
end
