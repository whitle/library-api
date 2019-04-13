# frozen_string_literal: true

module Api
  module V1
    module Auth
      class GoogleController < ApiController
        def authenticate_user
          access_token = params[:access_token]
          google_api_response = HTTParty.get('https://www.googleapis.com/oauth2/v2/userinfo',
                                             headers: { 'Authorization' => "OAuth #{access_token}" })
          if google_api_response['error']
            render json: {}, status: :unauthorized
          else
            render json: google_api_response.merge(access_token: access_token), status: :ok
          end
        end
      end
    end
  end
end
