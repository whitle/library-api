# frozen_string_literal: true

class ApiController < ActionController::API
  def init_access_token
    @access_token = params['access_token']
  end

  def authorize_google_user
    @google_apis_response = HTTParty.get('https://www.googleapis.com/oauth2/v2/userinfo',
                                         headers: { 'Authorization' => "OAuth #{@access_token}" })
  end
end
